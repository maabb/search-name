import { readFileSync, writeFileSync } from 'node:fs';
import { createClient } from '@supabase/supabase-js';

const PROGRESS_FILE = 'scripts/embeddings-progress-v2.jsonl';
const STATE_FILE = 'scripts/reembed-upload-state.json';
const BATCH = 100;

const envText = readFileSync('.env', 'utf8');
const envVars: Record<string, string> = {};
for (const line of envText.split('\n')) {
  const m = line.match(/^([A-Z_]+)=(.*)$/);
  if (m) envVars[m[1]] = m[2].trim().replace(/^['"]|['"]$/g, '');
}

const supabaseUrl = envVars.VITE_SUPABASE_URL ?? '';
const supabaseAnonKey = envVars.VITE_SUPABASE_ANON_KEY ?? '';
if (!supabaseUrl || !supabaseAnonKey) {
  console.error('Missing VITE_SUPABASE_URL / VITE_SUPABASE_ANON_KEY in environment');
  process.exit(1);
}
const supabase = createClient(supabaseUrl, supabaseAnonKey);

type Item = { id: string; embedding: number[] };

function loadState(): number {
  if (readStateExists()) {
    const obj = JSON.parse(readFileSync(STATE_FILE, 'utf8')) as { uploaded: number };
    return obj.uploaded;
  }
  return 0;
}

function readStateExists(): boolean {
  try {
    readFileSync(STATE_FILE, 'utf8');
    return true;
  } catch {
    return false;
  }
}

async function main() {
  const lines = readFileSync(PROGRESS_FILE, 'utf8')
    .split('\n')
    .filter((l) => l.trim());
  const items: Item[] = lines.map((l) => JSON.parse(l) as Item);
  console.log(`${items.length} embeddings loaded`);

  let offset = loadState();
  console.log(`Resuming from ${offset}`);
  while (offset < items.length) {
    const batch = items.slice(offset, offset + BATCH);
    const payload = batch.map((it) => ({
      id: it.id,
      vec: `[${it.embedding.join(',')}]`,
    }));
    const { error } = await supabase.rpc('apply_embedding_batch_float', {
      p_items: payload,
      p_token: '42bcb9e9576dd9f8827edb827751c8d854dcab30d3089925',
    });
    if (error) {
      console.error(`Batch at offset ${offset} failed:`, error.message);
      process.exit(1);
    }
    offset += batch.length;
    writeFileSync(STATE_FILE, JSON.stringify({ uploaded: offset }));
    console.log(`Uploaded ${offset}/${items.length}`);
  }
  console.log('Done');
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
