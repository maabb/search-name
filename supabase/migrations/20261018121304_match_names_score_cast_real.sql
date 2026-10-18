/*
# Fix match_names score type: cast whole CASE-style expression to real

1. Plain-English explanation
- Internal type fix only; search behavior is unchanged.

2. Schema changes
- match_names now casts its popularity score expression to real as one
  unit, matching the pattern used in search_names.

3. Security changes
- None.
*/

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
         (n.popularity::real / 100.0)::real AS score
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
