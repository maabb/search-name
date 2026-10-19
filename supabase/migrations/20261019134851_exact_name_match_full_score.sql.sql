/*
# Exact name lookups always score 100%

In "name" mode, similarity() is trigram-based and correct for identical
strings, but the score is what visitors see front-and-center as "% match".
Guarantee an exact (normalized) name match returns 1.0 so a search for
"adam" always shows Adam at 100% — never a partial trigram value.
*/

CREATE OR REPLACE FUNCTION search_names(
  p_mode text,
  p_root text[] DEFAULT NULL,
  p_gender text[] DEFAULT NULL,
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
LANGUAGE plpgsql STABLE SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_query text;
  v_nq text;
  v_letter text;
  v_prefix_tsquery text;
  v_gender text[];
BEGIN
  v_query := nullif(trim(coalesce(p_query, '')), '');
  v_nq := norm_text(coalesce(p_query, ''));
  v_letter := nullif(trim(coalesce(p_letter, '')), '');

  IF p_gender IS NULL OR cardinality(p_gender) = 0 THEN
    v_gender := NULL;
  ELSIF cardinality(p_gender) = 1 AND p_gender[1] IN ('girl','boy') THEN
    v_gender := array_append(p_gender, 'unisex');
  ELSE
    v_gender := p_gender;
  END IF;

  IF v_nq IS NOT NULL THEN
    SELECT string_agg(exp, ' | ') INTO v_prefix_tsquery
    FROM (
      SELECT w || ':*' AS exp FROM unnest(regexp_split_to_array(v_nq, '[^a-z]+')) w WHERE w <> ''
      UNION
      SELECT (syn || ':*') FROM
        unnest(regexp_split_to_array(v_nq, '[^a-z]+')) w,
        unnest(ARRAY[
          CASE
            WHEN w IN ('calm','calmness','calming','serenity','serene','peace','peaceful','tranquil','tranquility','quiet','still','stillness') THEN ARRAY['calm','serene','peaceful','tranquil','still','quiet']
            WHEN w IN ('river','rivers','stream','creek','brook','water','waterfall') THEN ARRAY['river','stream','water','flowing']
            WHEN w IN ('star','stars','starlight') THEN ARRAY['star','stellar']
            WHEN w IN ('light','bright','shining','radiant','luminous','glow') THEN ARRAY['light','bright','shining','radiant','luminous']
            WHEN w IN ('flower','flowers','blossom','bloom','blossoming','floral') THEN ARRAY['flower','blossom','bloom','floral']
            WHEN w IN ('strong','strength','powerful','mighty','brave','courage','valiant','bold','warrior') THEN ARRAY['strong','strength','brave','mighty','valiant','warrior','bold']
            WHEN w IN ('wise','wisdom','intelligent','smart') THEN ARRAY['wisdom','wise']
            WHEN w IN ('beloved','love','loved','dear','gracious','grace','favor') THEN ARRAY['love','beloved','gracious','grace','dear']
            WHEN w IN ('noble','nobility','royal','queen','king','princess','prince','ruler','leader','sovereign','commander') THEN ARRAY['noble','royal','queen','king','princess','prince','ruler','leader','commander','sovereign']
            WHEN w IN ('joy','joyful','happy','happiness','gladness','delight') THEN ARRAY['joy','happy','happiness','gladness','delight']
            WHEN w IN ('hope','hopeful') THEN ARRAY['hope']
            WHEN w IN ('pure','purity','innocent','innocence','clear','clarity','crystal') THEN ARRAY['pure','innocent','clear','crystal']
            WHEN w IN ('sea','ocean','deep','vast') THEN ARRAY['sea','ocean','deep','vast']
            WHEN w IN ('moon','lunar') THEN ARRAY['moon','lunar']
            WHEN w IN ('night') THEN ARRAY['night']
            WHEN w IN ('dawn','morning') THEN ARRAY['dawn','morning']
            WHEN w IN ('gift','given','god''s gift') THEN ARRAY['gift']
            WHEN w IN ('peace') THEN ARRAY['peace','peaceful']
            WHEN w IN ('generous','generosity','giving','kind','kindness','benevolent','beneficent') THEN ARRAY['generous','generosity','kind','benevolent','beneficent']
            WHEN w IN ('beautiful','beauty','handsome','lovely','elegant','graceful') THEN ARRAY['beautiful','beauty','handsome','lovely','elegant','graceful']
            ELSE NULL
          END
        ]) syn WHERE syn IS NOT NULL
    ) all_terms;
  END IF;

  RETURN QUERY
  SELECT n.id, n.name, n.root, n.gender, n.meaning, n.description,
         n.native_script, n.pronunciation, n.popularity,
         (CASE
           WHEN v_query IS NOT NULL AND p_mode = 'name'
             THEN CASE WHEN norm_text(n.name) = v_nq THEN 1.0
                       ELSE similarity(norm_text(n.name), v_nq) END
           WHEN v_query IS NOT NULL AND p_mode = 'meaning'
             THEN greatest(
               similarity(n.fuzzy_text, v_nq),
               similarity(norm_text(n.meaning), v_nq) * 1.5,
               CASE WHEN v_prefix_tsquery IS NOT NULL
                    THEN ts_rank(n.searchable, to_tsquery('simple', v_prefix_tsquery)) * 5
                    ELSE 0 END
             )
           ELSE n.popularity::real / 100.0
         END)::real AS score
  FROM names n
  WHERE (p_root IS NULL OR cardinality(p_root) = 0 OR n.root = ANY(p_root))
    AND (v_gender IS NULL OR n.gender = ANY(v_gender))
    AND (p_mode <> 'letter' OR v_letter IS NULL
         OR lower(left(n.name, 1)) = lower(left(v_letter, 1)))
    AND (
      v_query IS NULL OR p_mode IN ('browse','letter')
      OR (v_prefix_tsquery IS NOT NULL AND n.searchable @@ to_tsquery('simple', v_prefix_tsquery))
      OR n.fuzzy_text % v_nq
      OR (p_mode = 'name' AND norm_text(n.name) % v_nq)
      OR (p_mode = 'name' AND norm_text(n.name) = v_nq)
      OR similarity(norm_text(n.meaning), v_nq) > 0.12
    )
    AND (
      p_mode <> 'name' OR v_query IS NULL
      OR norm_text(n.name) = v_nq
      OR norm_text(n.name) % v_nq
      OR (v_prefix_tsquery IS NOT NULL AND n.searchable @@ to_tsquery('simple', v_prefix_tsquery))
      OR similarity(norm_text(n.name), v_nq) > 0.25
    )
  ORDER BY
    CASE WHEN v_query IS NOT NULL AND p_mode = 'name'
      THEN (CASE WHEN norm_text(n.name) = v_nq THEN 1.0
                 ELSE similarity(norm_text(n.name), v_nq) END) END DESC NULLS LAST,
    CASE WHEN v_query IS NOT NULL AND p_mode = 'meaning'
      THEN greatest(
        similarity(n.fuzzy_text, v_nq),
        similarity(norm_text(n.meaning), v_nq) * 1.5,
        CASE WHEN v_prefix_tsquery IS NOT NULL
             THEN ts_rank(n.searchable, to_tsquery('simple', v_prefix_tsquery)) * 5
             ELSE 0 END
      ) END DESC NULLS LAST,
    n.popularity DESC,
    n.name
  LIMIT least(greatest(p_limit, 1), 200);
END;
$$;

GRANT EXECUTE ON FUNCTION search_names(text, text[], text[], text, text, integer) TO anon, authenticated;
