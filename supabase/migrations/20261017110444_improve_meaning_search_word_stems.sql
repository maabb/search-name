/*
# Improve meaning search: word-stem matching for multi-word queries

The previous version only matched when every typed word appeared as a prefix in the name data
(AND semantics). Users type things like "river calmness", where each word alone should contribute
matches. This update:

1. Builds a prefix tsquery per word joined with `|` (OR semantics) so any word matching counts,
   ranked by how many/how well they match.
2. Adds a `similarity` fallback against the meaning text alone.
3. Keeps the fuzzy trigram fallback for typos and near-miss spellings.

No schema changes; only the search_names function body changes. Idempotent.
*/

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
      nullif(trim(coalesce(p_letter, '')), '') AS letter,
      coalesce((
        SELECT string_agg(w || ':*', ' | ')
        FROM unnest(regexp_split_to_array(norm_text(coalesce(p_query, '')), '[^a-z]+')) w
        WHERE w <> ''
      ), '') AS prefix_tsquery
  )
  SELECT n.id, n.name, n.root, n.gender, n.meaning, n.description,
         n.native_script, n.pronunciation, n.popularity,
         CASE
           WHEN q.query IS NOT NULL AND p_mode = 'name'
             THEN similarity(norm_text(n.name), q.nq)
           WHEN q.query IS NOT NULL AND p_mode = 'meaning'
             THEN greatest(
               similarity(n.fuzzy_text, q.nq),
               similarity(norm_text(n.meaning), q.nq) * 1.5,
               ts_rank(n.searchable, to_tsquery('simple', q.prefix_tsquery)) * 5
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
      OR n.searchable @@ to_tsquery('simple', q.prefix_tsquery)
      OR n.fuzzy_text % q.nq
      OR (p_mode = 'name' AND norm_text(n.name) % q.nq)
      OR similarity(norm_text(n.meaning), q.nq) > 0.2
    )
    AND (
      p_mode <> 'name' OR q.query IS NULL
      OR norm_text(n.name) % q.nq
      OR n.searchable @@ to_tsquery('simple', q.prefix_tsquery)
      OR similarity(norm_text(n.name), q.nq) > 0.25
    )
  ORDER BY
    CASE WHEN q.query IS NOT NULL AND p_mode = 'name'
      THEN similarity(norm_text(n.name), q.nq) END DESC NULLS LAST,
    CASE WHEN q.query IS NOT NULL AND p_mode = 'meaning'
      THEN greatest(
        similarity(n.fuzzy_text, q.nq),
        similarity(norm_text(n.meaning), q.nq) * 1.5,
        ts_rank(n.searchable, to_tsquery('simple', q.prefix_tsquery)) * 5
      ) END DESC NULLS LAST,
    n.popularity DESC,
    n.name
  LIMIT least(greatest(p_limit, 1), 200);
$$;

GRANT EXECUTE ON FUNCTION search_names(text, text, text, text, text, integer) TO anon, authenticated;