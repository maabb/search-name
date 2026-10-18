/*
# Multi-letter starts-with, ends-with match, and search indexes

1. Plain-English explanation
- "Starts with" no longer limits you to one letter: type any beginning,
  like "Am" or "Zey", and it matches. The alphabet bar still works for
  single letters.
- New "Ends with" choice: type any ending, like "an" or "ley", and it
  matches names finishing with those letters.
- Both directions search by culture and gender as before, sorted most
  popular first.
- New indexes keep both match types fast as the catalog grows.

2. Schema changes
- New search function match_names(p_root, p_gender, p_match, p_text,
  p_limit) covering starts/ends/contains matching on normalized names.
- Two indexes on the name column: a btree for anchored starts/ends
  matching and a trigram index for free "contains" matching.

3. Security changes
- None. Same read-only pattern; the new function is SECURITY DEFINER
  with a fixed search path and granted to anon and authenticated.
*/

CREATE INDEX IF NOT EXISTS idx_names_name_lower
  ON names (lower(name) text_pattern_ops);

CREATE INDEX IF NOT EXISTS idx_names_name_trgm
  ON names USING gin (norm_text(name) gin_trgm_ops);

CREATE OR REPLACE FUNCTION match_names(
  p_root text[] DEFAULT NULL,
  p_gender text[] DEFAULT NULL,
  p_match text DEFAULT 'starts',
  p_text text DEFAULT NULL,
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
LANGUAGE plpgsql STABLE SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_text text;
  v_gender text[];
  v_pattern text;
BEGIN
  v_text := nullif(lower(trim(coalesce(p_text, ''))), '');
  IF v_text IS NULL THEN
    RAISE EXCEPTION 'p_text is required';
  END IF;

  IF p_gender IS NULL OR cardinality(p_gender) = 0 THEN
    v_gender := NULL;
  ELSIF cardinality(p_gender) = 1 AND p_gender[1] IN ('girl','boy') THEN
    v_gender := array_append(p_gender, 'unisex');
  ELSE
    v_gender := p_gender;
  END IF;

  IF p_match = 'ends' THEN
    v_pattern := '%' || v_text;
  ELSIF p_match = 'contains' THEN
    v_pattern := '%' || v_text || '%';
  ELSE
    v_pattern := v_text || '%';
  END IF;

  RETURN QUERY
  SELECT n.id, n.name, n.root, n.gender, n.meaning, n.description,
         n.native_script, n.pronunciation, n.popularity,
         n.popularity::real / 100.0 AS score
  FROM names n
  WHERE (p_root IS NULL OR cardinality(p_root) = 0 OR n.root = ANY(p_root))
    AND (v_gender IS NULL OR n.gender = ANY(v_gender))
    AND (
      (p_match = 'ends' AND norm_text(n.name) LIKE v_pattern)
      OR (p_match <> 'ends' AND lower(n.name) LIKE v_pattern)
    )
  ORDER BY n.popularity DESC, n.name
  LIMIT least(greatest(p_limit, 1), 200);
END;
$$;
