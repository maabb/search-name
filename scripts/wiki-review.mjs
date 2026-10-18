import { readFileSync, writeFileSync, existsSync } from 'node:fs';

const WIKI = 'https://en.wikipedia.org';
const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

async function api(path) {
  const res = await fetch(WIKI + path, {
    headers: { 'User-Agent': 'RootName-content-review/1.0 (contact: rootname.app)' },
  });
  if (res.status === 429) {
    const retry = Number(res.headers.get('retry-after')) || 5;
    await sleep(retry * 1000);
    return api(path);
  }
  if (!res.ok) throw new Error(`HTTP ${res.status} for ${path}`);
  return res.json();
}

// Fetch intro plain-text extracts for up to 20 titles in one request.
async function extracts(titles) {
  const data = await api(
    `/w/api.php?action=query&prop=extracts&exintro=1&explaintext=1&format=json&redirects=1&titles=${encodeURIComponent(
      titles.join('|')
    )}`
  );
  const pages = data.query?.pages ?? {};
  const out = {};
  for (const id of Object.keys(pages)) {
    const p = pages[id];
    if (id === '-1' || !p.extract) continue;
    out[p.title] = p.extract;
  }
  return out;
}

function firstSentences(text, maxSentences = 2, maxChars = 320) {
  const parts = text.match(/[^.!?]+[.!?]+(\s|$)/g) || [text];
  let out = '';
  for (const p of parts) {
    if (out && (out + p).length > maxChars) break;
    out += p;
    if ((out.match(/[.!?]/g) || []).length >= maxSentences) break;
  }
  return out.trim() || text.slice(0, maxChars);
}

const STATE = 'scripts/wiki-review-state.json';
const state = existsSync(STATE) ? JSON.parse(readFileSync(STATE, 'utf8')) : { results: {} };
const names = JSON.parse(readFileSync('/tmp/names.json', 'utf8'));

const pending = names.filter((n) => !state.results[n]);
console.log(`${names.length} names, ${pending.length} without extracts`);

// Pass 1: "X (name)" titles. Pass 2: bare "X". Pass 3: search fallback.
const passes = [
  (n) => `${n} (name)`,
  (n) => n,
];

for (let p = 0; p < passes.length; p++) {
  const candidates = pending.filter((n) => !state.results[n]);
  if (candidates.length === 0) break;
  console.log(`Pass ${p + 1}: ${candidates.length} candidates`);
  for (let i = 0; i < candidates.length; i += 20) {
    const batch = candidates.slice(i, i + 20);
    const found = await extracts(batch.map(passes[p]));
    for (const n of batch) {
      const key = passes[p](n);
      const text = found[key];
      if (text && !/may refer to/i.test(text)) state.results[n] = firstSentences(text);
    }
    if (i % 100 === 0) {
      writeFileSync(STATE, JSON.stringify(state));
      console.log(`  ${Math.min(i + 20, candidates.length)}/${candidates.length}`);
    }
    await sleep(300);
  }
  writeFileSync(STATE, JSON.stringify(state));
}

// Search fallback for the remainder.
const still = names.filter((n) => !state.results[n]);
console.log(`Search fallback for ${still.length} names`);
for (const n of still) {
  try {
    const data = await api(
      `/w/api.php?action=query&list=search&srsearch=${encodeURIComponent(n + ' given name')}&srlimit=1&format=json`
    );
    const hit = data.query?.search?.[0];
    if (hit) {
      const res = await extracts([hit.title]);
      const text = res[hit.title];
      if (text && !/may refer to/i.test(text)) state.results[n] = firstSentences(text);
    }
  } catch (e) {
    console.error('fallback error', n, String(e));
  }
  await sleep(300);
}
writeFileSync(STATE, JSON.stringify(state));

const total = Object.keys(state.results).length;
console.log(`Done. Extracts for ${total}/${names.length} names.`);
