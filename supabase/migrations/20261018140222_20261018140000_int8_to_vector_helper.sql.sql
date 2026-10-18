CREATE OR REPLACE FUNCTION public.int8_to_vector(data bytea, scale double precision)
RETURNS vector(384)
LANGUAGE plpgsql
IMMUTABLE
AS $$
DECLARE
    n integer;
    result double precision[];
    i integer;
BEGIN
    n := octet_length(data);
    IF n <> 384 THEN
        RAISE EXCEPTION 'expected 384 bytes, got %', n;
    END IF;
    result := array_fill(0::double precision, ARRAY[384]);
    FOR i IN 1..384 LOOP
        result[i] := ((get_byte(data, i - 1) - 128)::double precision) / scale;
    END LOOP;
    RETURN result::vector;
END;
$$;

GRANT EXECUTE ON FUNCTION public.int8_to_vector(bytea, double precision) TO authenticated, anon;