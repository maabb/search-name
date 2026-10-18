import { pipeline } from '@xenova/transformers';
import { readFileSync } from 'node:fs';

const envText = readFileSync('.env', 'utf8');
const envVars: Record<string, string> = {};
for (const line of envText.split('\n')) {
  const m = line.match(/^([A-Z_]+)=(.*)$/);
  if (m) envVars[m[1]] = m[2].trim().replace(/^['"]|['"]$/g, '');
}

const { createClient } = await import('@supabase/supabase-js');
const supabase = createClient(envVars.VITE_SUPABASE_URL, envVars.VITE_SUPABASE_ANON_KEY);

const extractor = await pipeline('feature-extraction', 'Xenova/all-MiniLM-L6-v2');

const queries = ['a calm and peaceful soul', 'strong like a mountain', 'bringer of light'];

for (const q of queries) {
  const output = await extractor([q], { pooling: 'mean', normalize: true });
  const dims = output.dims[1] as number;
  const emb = Array.from(output.data as Float32Array).slice(0, dims);
  const { data, error } = await supabase.rpc('search_names_semantic', {
    p_embedding: emb,
    p_query: q,
    p_root: null,
    p_gender: null,
    p_limit: 5,
  });
  if (error) {
    console.error(`Query "${q}" failed:`, error.message);
    continue;
  }
  console.log(`\nQuery: "${q}"`);
  for (const r of data ?? []) {
    console.log(`  ${r.name} (${r.gender}) — ${r.meaning} — score ${(r.score as number).toFixed(4)}`);
  }
}
