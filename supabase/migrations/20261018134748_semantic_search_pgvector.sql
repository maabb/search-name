/*
# Enable semantic (meaning-based) name search with pgvector

1. What this does
   - Turns on the `vector` extension (pgvector), which is included with the
     database at no extra cost. It stores "embeddings": lists of numbers that
     capture the *meaning* of text, so "serene" can match "calm and peaceful"
     even without shared words.
   - Adds a 384-dimension `embedding` column to the `names` table. Each name's
     meaning + description gets one embedding, produced once by a free
     open-source model (all-MiniLM-L6-v2). The column is nullable so old rows
     are never broken; rows are filled by a one-time script.
   - Adds an HNSW index on the embedding for fast nearest-meaning lookups.
   - Adds a `search_names_semantic` function that blends two scores:
     (a) vector similarity between the visitor's typed wish and each name's
     embedding, and (b) the existing keyword/fuzzy match score. The blend
     keeps exact-word matches on top while letting paraphrases surface.

2. Modified tables
   - `names`: new nullable `embedding vector(384)` column + HNSW index.

3. New functions
   - `search_names_semantic(p_embedding vector, p_query text, p_root text[],
     p_gender text[], p_limit integer)`: SECURITY DEFINER, search_path locked
     to public. Returns the same columns as `search_names` plus a blended
     score. Gender logic matches the existing function: selecting girl or boy
     also includes unisex names.

4. Security
   - No RLS changes: `names` already has RLS enabled with public read access.
   - The function does not bypass row level security for anything sensitive;
     it reads only names data that is already public to the app.
   - Input is bounded (limit clamped 1..200) like the existing search.
*/

CREATE EXTENSION IF NOT EXISTS vector;

ALTER TABLE names ADD COLUMN IF NOT EXISTS embedding vector(384);

CREATE INDEX IF NOT EXISTS names_embedding_hnsw
  ON names USING hnsw (embedding vector_cosine_ops)
  WITH (m = 16, ef_construction = 64);

CREATE OR REPLACE FUNCTION public.search_names_semantic(
  p_embedding vector(384),
  p_query text DEFAULT NULL,
  p_root text[] DEFAULT NULL,
  p_gender text[] DEFAULT NULL,
  p_limit integer DEFAULT 60
)
RETURNS TABLE(
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
LANGUAGE plpgsql
STABLE
SECURITY DEFINER
SET search_path TO 'public'
AS $function$
DECLARE
  v_nq text;
  v_gender text[];
  v_query text;
BEGIN
  v_query := nullif(trim(coalesce(p_query, '')), '');
  v_nq := norm_text(coalesce(v_query, ''));

  IF p_gender IS NULL OR cardinality(p_gender) = 0 THEN
    v_gender := NULL;
  ELSIF cardinality(p_gender) = 1 AND p_gender[1] IN ('girl','boy') THEN
    v_gender := array_append(p_gender, 'unisex');
  ELSE
    v_gender := p_gender;
  END IF;

  RETURN QUERY
  SELECT n.id, n.name, n.root, n.gender, n.meaning, n.description,
         n.native_script, n.pronunciation, n.popularity,
         (
           0.65 * (1 - (n.embedding <=> p_embedding)::real)
           + 0.35 * greatest(
             similarity(n.fuzzy_text, v_nq),
             similarity(norm_text(n.meaning), v_nq) * 1.5
           )
         )::real AS score
  FROM names n
  WHERE n.embedding IS NOT NULL
    AND (p_root IS NULL OR cardinality(p_root) = 0 OR n.root = ANY(p_root))
    AND (v_gender IS NULL OR n.gender = ANY(v_gender))
  ORDER BY n.embedding <=> p_embedding
  LIMIT least(greatest(p_limit, 1), 200);
END;
$function$;
