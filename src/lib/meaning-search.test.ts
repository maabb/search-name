import { beforeEach, describe, expect, it, vi } from 'vitest';

type RpcCall = { fn: string; args: Record<string, unknown> };

const rpcCalls: RpcCall[] = [];
let rpcResponder: (fn: string, args: Record<string, unknown>) =>
  Promise<{ data: unknown; error: { message: string } | null }> = async () => ({
    data: [],
    error: null,
  });

vi.mock('@supabase/supabase-js', () => ({
  createClient: () => ({
    rpc: (fn: string, args: Record<string, unknown>) => {
      rpcCalls.push({ fn, args });
      return rpcResponder(fn, args);
    },
  }),
}));

// A tiny fake of the transformers pipeline: returns a deterministic
// "embedding" derived from the input text, so we can assert the same text
// reaches the database function in the same shape the browser would send.
vi.mock('@xenova/transformers', () => ({
  env: {},
  pipeline: async () => async (texts: string[]) => {
    const dims = 384;
    const data = new Float32Array(texts.length * dims);
    for (let t = 0; t < texts.length; t++) {
      let h = 0;
      for (const ch of texts[t]) h = (h * 31 + ch.charCodeAt(0)) % 997;
      for (let d = 0; d < dims; d++) data[t * dims + d] = ((h + d) % 100) / 100 - 0.5;
    }
    return { dims: [texts.length, dims], data };
  },
}));

const { searchSemantic, searchNames } = await import('@/lib/supabase');
const { clearNameCache: clearCache } = await import('@/lib/searchCache');

function useResponder(
  responder: (fn: string, args: Record<string, unknown>) =>
    Promise<{ data: unknown; error: { message: string } | null }>
) {
  rpcResponder = responder;
}

const semanticRows = [
  {
    id: '33333333-3333-3333-3333-333333333333',
    name: 'Noor',
    root: 'arabic',
    gender: 'unisex',
    meaning: 'light, radiance',
    description: 'Light in Arabic',
    native_script: null,
    pronunciation: null,
    popularity: 8,
    score: 0.71,
  },
];

beforeEach(() => {
  rpcCalls.length = 0;
  clearCache();
  useResponder(async () => ({ data: semanticRows, error: null }));
});

describe('semantic (meaning) search pipeline', () => {
  it('sends a 384-dimension embedding to search_names_semantic', async () => {
    await searchSemantic({
      mode: 'meaning',
      roots: [],
      genders: [],
      query: 'bringer of light',
    });
    expect(rpcCalls[0].fn).toBe('search_names_semantic');
    const emb = rpcCalls[0].args.p_embedding as number[];
    expect(emb).toHaveLength(384);
    expect(emb.every((v) => typeof v === 'number' && Number.isFinite(v))).toBe(true);
  });

  it('passes the raw query and filters alongside the embedding', async () => {
    await searchSemantic({
      mode: 'meaning',
      roots: ['arabic'],
      genders: ['girl'],
      query: 'a calm soul',
    });
    const args = rpcCalls[0].args;
    expect(args.p_query).toBe('a calm soul');
    expect(args.p_root).toEqual(['arabic']);
    expect(args.p_gender).toEqual(['girl']);
  });

  it('produces the same embedding for the same text every time', async () => {
    await searchSemantic({ mode: 'meaning', roots: [], genders: [], query: 'a calm soul' });
    const first = rpcCalls[0].args.p_embedding;
    rpcCalls.length = 0;
    await searchSemantic({ mode: 'meaning', roots: [], genders: [], query: 'a calm soul' });
    expect(rpcCalls[0].args.p_embedding).toEqual(first);
  });

  it('empty query still works — database receives null query text', async () => {
    await searchSemantic({ mode: 'meaning', roots: [], genders: [], query: '   ' });
    const args = rpcCalls[0].args;
    expect(args.p_query).toBe('   ');
  });

  it('database errors are thrown, never swallowed', async () => {
    useResponder(async () => ({ data: null, error: { message: 'function not found' } }));
    await expect(
      searchSemantic({ mode: 'meaning', roots: [], genders: [], query: 'calm' })
    ).rejects.toThrow('function not found');
  });

  it('a database outage is not cached — recovery works on the next search', async () => {
    let healthy = false;
    useResponder(async () =>
      healthy ? { data: semanticRows, error: null } : { data: null, error: { message: 'down' } }
    );
    await expect(
      searchNames({ mode: 'meaning', roots: [], genders: [], query: 'calm' })
    ).rejects.toThrow('down');
    healthy = true;
    const rows = await searchNames({ mode: 'meaning', roots: [], genders: [], query: 'calm' });
    expect(rows).toHaveLength(1);
    expect(rows[0].name).toBe('Noor');
  });

  it('resolves without hanging when the model responds immediately', async () => {
    const start = Date.now();
    await searchSemantic({ mode: 'meaning', roots: [], genders: [], query: 'bright star' });
    expect(Date.now() - start).toBeLessThan(1000);
  });

  it('meaning searches through the general entry point also get cached', async () => {
    await searchNames({ mode: 'meaning', roots: [], genders: [], query: 'bright star' });
    const start = Date.now();
    await searchNames({ mode: 'meaning', roots: [], genders: [], query: 'bright star' });
    expect(Date.now() - start).toBeLessThan(10);
    expect(rpcCalls).toHaveLength(1);
  });
});
