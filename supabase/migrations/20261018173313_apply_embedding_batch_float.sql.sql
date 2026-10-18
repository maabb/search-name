/*
# Apply float embedding batches

The previous apply_embedding_batch expected 8-bit quantized vectors (384 bytes
+ scale). The re-embedding pass regenerated full float32 vectors from the
current descriptions, so this function accepts those directly as text in
pgvector's '[a,b,...]' format.

Security: gated by the same shared upload token as the original; updates only
the embedding column and only for ids present in the payload.
*/

CREATE OR REPLACE FUNCTION public.apply_embedding_batch_float(p_items jsonb, p_token text)
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
    SET embedding = (i.item->>'vec')::vector(384)
    FROM (
        SELECT (item->>'id')::uuid AS id, item
        FROM jsonb_array_elements(p_items) AS item
    ) i
    WHERE n.id = i.id;
    GET DIAGNOSTICS v_count = ROW_COUNT;
    RETURN v_count;
END;
$$;

GRANT EXECUTE ON FUNCTION public.apply_embedding_batch_float(jsonb, text) TO anon;