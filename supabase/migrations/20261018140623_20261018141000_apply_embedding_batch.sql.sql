CREATE OR REPLACE FUNCTION public.apply_embedding_batch(p_items jsonb, p_token text)
RETURNS integer
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
    v_count integer;
BEGIN
    IF p_token IS DISTINCT FROM '42bcb9e9576dd9f8827edb827751c8d854dcab30d3089925' THEN
        RAISE EXCEPTION 'invalid token';
    END IF;
    UPDATE names n
    SET embedding = public.int8_to_vector(
            decode(i.item->>'b64', 'base64'),
            (i.item->>'scale')::double precision)
    FROM (
        SELECT (item->>'id')::uuid AS id, item
        FROM jsonb_array_elements(p_items) AS item
    ) i
    WHERE n.id = i.id;
    GET DIAGNOSTICS v_count = ROW_COUNT;
    RETURN v_count;
END;
$$;

GRANT EXECUTE ON FUNCTION public.apply_embedding_batch(jsonb, text) TO anon;