import { pipeline } from '@xenova/transformers';
import { readFileSync, writeFileSync, existsSync } from 'node:fs';

const RESULT_FILES = [
  '/tmp/cc-agent/72114265/.v3/persisted-tool-results/v3-session/chatcmpl-tool-a1b2e6494bd5ada2.txt',
  '/tmp/cc-agent/72114265/.v3/persisted-tool-results/v3-session/chatcmpl-tool-b0d3e05543aad05d.txt',
  '/tmp/cc-agent/72114265/.v3/persisted-tool-results/v3-session/chatcmpl-tool-86c74c8ff13d363e.txt',
  '/tmp/cc-agent/72114265/.v3/persisted-tool-results/v3-session/chatcmpl-tool-9646335a1701ecd6.txt',
];
const PROGRESS_FILE = 'scripts/embeddings-progress.jsonl';
const BATCH = 64;

interface Row {
  id: string;
  name: string;
  meaning: string;
  description: string;
}

function loadRows(): Row[] {
  const rows: Row[] = [];
  for (const file of RESULT_FILES) {
    const raw = JSON.parse(readFileSync(file, 'utf8')) as string;
    const start = raw.indexOf('[');
    const end = raw.lastIndexOf(']');
    const jsonText = raw.slice(start, end + 1);
    rows.push(...(JSON.parse(jsonText) as Row[]));
  }
  return rows;
}

function loadDone(): Map<string, string> {
  const done = new Map<string, string>();
  if (existsSync(PROGRESS_FILE)) {
    for (const line of readFileSync(PROGRESS_FILE, 'utf8').split('\n')) {
      if (!line.trim()) continue;
      const obj = JSON.parse(line) as { id: string; embedding: number[] };
      done.set(obj.id, JSON.stringify(obj.embedding));
    }
  }
  return done;
}

async function main() {
  const rows = loadRows();
  const done = loadDone();
  const pending = rows.filter((r) => !done.has(r.id));
  console.log(`${rows.length} rows, ${done.size} already embedded, ${pending.length} to go`);

  console.log('Loading embedding model (Xenova/all-MiniLM-L6-v2)...');
  const extractor = await pipeline('feature-extraction', 'Xenova/all-MiniLM-L6-v2');

  const out = writeFileSync.bind(null); // keep reference clear
  let written = 0;
  for (let start = 0; start < pending.length; start += BATCH) {
    const batch = pending.slice(start, start + BATCH);
    const texts = batch.map((r) =>
      [r.name, r.meaning, r.description].filter((s) => s && s.trim()).join('. ')
    );
    const output = await extractor(texts, { pooling: 'mean', normalize: true });
    const [batchSize, dims] = output.dims as number[];
    const flat = output.data as Float32Array;
    const lines: string[] = [];
    for (let i = 0; i < batch.length; i++) {
      const vec = Array.from(flat.subarray(i * dims, (i + 1) * dims)).map(
        (n) => Math.round(n * 1e6) / 1e6
      );
      lines.push(JSON.stringify({ id: batch[i].id, embedding: vec }));
    }
    writeFileSync(PROGRESS_FILE, lines.join('\n') + '\n', { flag: 'a' });
    written += batch.length;
    console.log(`Embedded ${written}/${pending.length}`);
  }
  console.log('All embeddings saved to', PROGRESS_FILE);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
