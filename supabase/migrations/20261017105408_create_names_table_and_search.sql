/*
# Baby name explorer — schema, indexes, and search function (retry 4: schema-qualify unaccent calls)

Fix: both the `unaccent` function and dictionary live in the `public` schema; during SQL-function
inlining the search_path is not honored, so every reference is fully qualified:
public.unaccent('public.unaccent'::regdictionary, t).
Everything else unchanged. Idempotent — safe to re-run.

1. New Table `names` — name, root (english/german/turkish/arabic), gender, meaning,
   description, native_script, pronunciation, popularity, plus two generated columns:
   `fuzzy_text` (normalized blob for trigram fuzzy matching) and `searchable` (tsvector).

2. Indexes — btree (root, gender, popularity DESC) for browse; btree (root, first letter)
   for letter filter; GIN full-text; three GIN trigram indexes for fuzzy meaning/name search.

3. Functions — `norm_text` (IMMUTABLE normalizer) and `search_names(...)` (single round-trip
   search function covering browse / letter / meaning / name modes).

4. Security — RLS with public-read policy (anon + authenticated); no write privileges
   for frontend roles.
*/

CREATE TABLE IF NOT EXISTS names (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  root text NOT NULL CHECK (root IN ('english','german','turkish','arabic')),
  gender text NOT NULL CHECK (gender IN ('girl','boy','unisex')),
  meaning text NOT NULL,
  description text NOT NULL,
  native_script text,
  pronunciation text,
  popularity integer NOT NULL DEFAULT 50 CHECK (popularity BETWEEN 0 AND 100),
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE OR REPLACE FUNCTION norm_text(t text) RETURNS text
LANGUAGE sql IMMUTABLE PARALLEL SAFE
AS $$ SELECT lower(trim(regexp_replace(public.unaccent('public.unaccent'::regdictionary, t), '\s+', ' ', 'g'))); $$;

ALTER TABLE names ADD COLUMN IF NOT EXISTS fuzzy_text text
  GENERATED ALWAYS AS (
    norm_text(name) || ' ' || norm_text(meaning) || ' ' || norm_text(description)
  ) STORED;

ALTER TABLE names ADD COLUMN IF NOT EXISTS searchable tsvector
  GENERATED ALWAYS AS (
    setweight(to_tsvector('simple', coalesce(name, '')), 'A') ||
    setweight(to_tsvector('simple', coalesce(meaning, '')), 'B') ||
    setweight(to_tsvector('simple', coalesce(description, '')), 'C')
  ) STORED;

CREATE INDEX IF NOT EXISTS idx_names_root_gender
  ON names (root, gender, popularity DESC);
CREATE INDEX IF NOT EXISTS idx_names_root_letter
  ON names (root, lower(left(name, 1)), name);
CREATE INDEX IF NOT EXISTS idx_names_fts ON names
  USING gin (searchable);
CREATE INDEX IF NOT EXISTS idx_names_trgm ON names
  USING gin (fuzzy_text gin_trgm_ops);
CREATE INDEX IF NOT EXISTS idx_names_trgm_name ON names
  USING gin ((norm_text(name)) gin_trgm_ops);
CREATE INDEX IF NOT EXISTS idx_names_trgm_meaning ON names
  USING gin ((norm_text(meaning)) gin_trgm_ops);

ALTER TABLE names ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Public read access to name catalog" ON names;
CREATE POLICY "Public read access to name catalog" ON names
  FOR SELECT TO anon, authenticated USING (true);

REVOKE INSERT, UPDATE, DELETE ON TABLE names FROM anon, authenticated;

-- Single entry point the frontend calls: one round trip per search.
-- p_mode: 'browse' | 'letter' | 'meaning' | 'name'
CREATE OR REPLACE FUNCTION search_names(
  p_mode text,
  p_root text DEFAULT NULL,
  p_gender text DEFAULT NULL,
  p_letter text DEFAULT NULL,
  p_query text DEFAULT NULL,
  p_limit integer DEFAULT 60
)
RETURNS TABLE (
  id uuid,
  name text,
  root text,
  gender text,
  meaning text,
  description text,
  native_script text,
  pronunciation text,
  popularity integer,
  score real
)
LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public AS $$
  WITH q AS (
    SELECT
      nullif(trim(coalesce(p_query, '')), '') AS query,
      norm_text(coalesce(p_query, '')) AS nq,
      nullif(trim(coalesce(p_letter, '')), '') AS letter
  )
  SELECT n.id, n.name, n.root, n.gender, n.meaning, n.description,
         n.native_script, n.pronunciation, n.popularity,
         CASE
           WHEN q.query IS NOT NULL AND p_mode = 'name'
             THEN similarity(norm_text(n.name), q.nq)
           WHEN q.query IS NOT NULL AND p_mode = 'meaning'
             THEN greatest(
               similarity(n.fuzzy_text, q.nq),
               similarity(norm_text(n.meaning), q.nq) * 1.2
             )
           ELSE n.popularity::real / 100.0
         END AS score
  FROM names n, q
  WHERE (p_root IS NULL OR n.root = p_root)
    AND (p_gender IS NULL OR n.gender = p_gender)
    AND (p_mode <> 'letter' OR q.letter IS NULL
         OR lower(left(n.name, 1)) = lower(left(q.letter, 1)))
    AND (
      q.query IS NULL OR p_mode IN ('browse','letter')
      OR n.searchable @@ websearch_to_tsquery('simple', q.query)
      OR n.fuzzy_text % q.nq
      OR (p_mode = 'name' AND norm_text(n.name) % q.nq)
      OR (p_mode = 'meaning' AND n.searchable @@ websearch_to_tsquery('simple',
            coalesce((
              SELECT string_agg(w || ':*', ' | ')
              FROM unnest(regexp_split_to_array(q.nq, '[^a-z]+')) w
              WHERE w <> ''
            ), ''))
      )
    )
    AND (
      p_mode <> 'name' OR q.query IS NULL
      OR norm_text(n.name) % q.nq
      OR n.searchable @@ websearch_to_tsquery('simple', q.query)
      OR similarity(norm_text(n.name), q.nq) > 0.25
    )
  ORDER BY
    CASE WHEN q.query IS NOT NULL AND p_mode = 'name'
      THEN similarity(norm_text(n.name), q.nq) END DESC NULLS LAST,
    CASE WHEN q.query IS NOT NULL AND p_mode = 'meaning'
      THEN greatest(
        similarity(n.fuzzy_text, q.nq),
        similarity(norm_text(n.meaning), q.nq) * 1.2
      ) END DESC NULLS LAST,
    n.popularity DESC,
    n.name
  LIMIT least(greatest(p_limit, 1), 200);
$$;

GRANT EXECUTE ON FUNCTION search_names(text, text, text, text, text, integer) TO anon, authenticated;