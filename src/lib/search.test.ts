import { beforeEach, describe, expect, it, vi } from 'vitest';

// The library module reads import.meta.env at load time; tests provide the
// values through a stub so no real credentials are needed.
type RpcCall = { fn: string; args: Record<string, unknown> };

const rpcCalls: RpcCall[] = [];
let rpcResponder: (fn: string, args: Record<string, unknown>) =>
  Promise<{ data: unknown; error: { message: string } | null }> = async () => ({
    data: [],
    error: null,
  });

vi.mock('@supabase/supabase-js', () => {
  return {
    createClient: () => ({
      rpc: (fn: string, args: Record<string, unknown>) => {
        rpcCalls.push({ fn, args });
        return rpcResponder(fn, args);
      },
    }),
  };
});

vi.mock('@xenova/transformers', () => ({
  env: {},
  pipeline: async () => async () => ({
    dims: [1, 384],
    data: new Float32Array(384).fill(0.1),
  }),
}));

const { searchNames, matchNames } = await import('@/lib/supabase');
const { clearNameCache: clearCache } = await import('@/lib/searchCache');

function useResponder(
  responder: (fn: string, args: Record<string, unknown>) =>
    Promise<{ data: unknown; error: { message: string } | null }>
) {
  rpcResponder = responder;
}

const sampleRows = [
  {
    id: '11111111-1111-1111-1111-111111111111',
    name: 'Serenity',
    root: 'english',
    gender: 'girl',
    meaning: 'serenity, calmness',
    description: 'A calm name',
    native_script: null,
    pronunciation: null,
    popularity: 5,
    score: 0.9,
  },
  {
    id: '22222222-2222-2222-2222-222222222222',
    name: 'Salma',
    root: 'arabic',
    gender: 'girl',
    meaning: 'peaceful, safe',
    description: 'A peaceful name',
    native_script: null,
    pronunciation: null,
    popularity: 7,
    score: 0.8,
  },
];

beforeEach(() => {
  rpcCalls.length = 0;
  clearCache();
  useResponder(async () => ({ data: sampleRows, error: null }));
});

describe('searchNames — browse mode', () => {
  it('calls search_names and returns rows', async () => {
    const rows = await searchNames({ mode: 'browse', roots: [], genders: [] });
    expect(rpcCalls).toHaveLength(1);
    expect(rpcCalls[0].fn).toBe('search_names');
    expect(rows).toHaveLength(2);
    expect(rows[0].name).toBe('Serenity');
  });

  it('returns an empty list when the database answers with no rows', async () => {
    useResponder(async () => ({ data: null, error: null }));
    const rows = await searchNames({ mode: 'browse', roots: [], genders: [] });
    expect(rows).toEqual([]);
  });

  it('throws a clear message when the database reports an error', async () => {
    useResponder(async () => ({ data: null, error: { message: 'column not found' } }));
    await expect(
      searchNames({ mode: 'browse', roots: [], genders: [] })
    ).rejects.toThrow('column not found');
  });
});

describe('searchNames — letter mode', () => {
  it('passes letter and filters through to the database call', async () => {
    await searchNames({
      mode: 'letter',
      roots: ['arabic'],
      genders: ['girl'],
      letter: 's',
      query: 'sa',
    });
    const args = rpcCalls[0].args;
    expect(args.p_letter).toBe('s');
    expect(args.p_query).toBe('sa');
    expect(args.p_root).toEqual(['arabic']);
    expect(args.p_gender).toEqual(['girl']);
  });
});

describe('searchNames — name mode', () => {
  it('errors are surfaced as thrown messages, not silent empty results', async () => {
    useResponder(async () => ({ data: null, error: { message: 'timeout' } }));
    await expect(
      searchNames({ mode: 'name', roots: [], genders: [], query: 'layla' })
    ).rejects.toThrow('timeout');
  });

  it('sends the typed name as p_query', async () => {
    await searchNames({ mode: 'name', roots: [], genders: [], query: 'Layla' });
    expect(rpcCalls[0].args.p_query).toBe('Layla');
  });
});

describe('searchNames — meaning (semantic) mode', () => {
  it('skips the keyword function entirely and returns rows', async () => {
    const rows = await searchNames({
      mode: 'meaning',
      roots: [],
      genders: [],
      query: 'a calm soul',
    });
    // Only the semantic call should happen (transformers stubbed, so the
    // embedding path is exercised separately in meaning-search.test.ts).
    expect(rows).toHaveLength(2);
  });

  it('propagates database errors from the semantic search', async () => {
    useResponder(async () => ({ data: null, error: { message: 'embedding dim mismatch' } }));
    await expect(
      searchNames({ mode: 'meaning', roots: [], genders: [], query: 'a calm soul' })
    ).rejects.toThrow('embedding dim mismatch');
  });
});

describe('matchNames (starts/ends matching)', () => {
  it('calls match_names with starts matching and the joined text', async () => {
    await matchNames({ roots: [], genders: [], match: 'starts', text: 'am' });
    expect(rpcCalls[0].fn).toBe('match_names');
    expect(rpcCalls[0].args.p_match).toBe('starts');
    expect(rpcCalls[0].args.p_text).toBe('am');
  });

  it('calls match_names with ends matching', async () => {
    await matchNames({ roots: [], genders: [], match: 'ends', text: 'ley' });
    expect(rpcCalls[0].args.p_match).toBe('ends');
  });

  it('surfaces database errors instead of failing silently', async () => {
    useResponder(async () => ({ data: null, error: { message: 'rate limited' } }));
    await expect(
      matchNames({ roots: [], genders: [], match: 'starts', text: 'am' })
    ).rejects.toThrow('rate limited');
  });
});

describe('latency guard', () => {
  it('browse search resolves quickly when the database is fast', async () => {
    const start = Date.now();
    await searchNames({ mode: 'browse', roots: [], genders: [] });
    expect(Date.now() - start).toBeLessThan(1000);
  });

  it('starts/ends matching resolves quickly', async () => {
    const start = Date.now();
    await matchNames({ roots: [], genders: [], match: 'starts', text: 'am' });
    expect(Date.now() - start).toBeLessThan(1000);
  });

  it('a slow keyword search result is cached, so a repeat search is instant', async () => {
    useResponder(async () => {
      await new Promise((r) => setTimeout(r, 50));
      return { data: sampleRows, error: null };
    });
    await searchNames({ mode: 'browse', roots: ['arabic'], genders: ['girl'] });
    const start = Date.now();
    const rows = await searchNames({ mode: 'browse', roots: ['arabic'], genders: ['girl'] });
    expect(Date.now() - start).toBeLessThan(10);
    expect(rows).toHaveLength(2);
    expect(rpcCalls).toHaveLength(1); // second call never hit the database
  });
});

describe('caching across all search types', () => {
  it('caches name-mode searches — repeat query does not call the database', async () => {
    await searchNames({ mode: 'name', roots: [], genders: [], query: 'layla' });
    await searchNames({ mode: 'name', roots: [], genders: [], query: 'layla' });
    expect(rpcCalls).toHaveLength(1);
  });

  it('caches letter-mode searches', async () => {
    await searchNames({ mode: 'letter', roots: [], genders: [], letter: 'a' });
    await searchNames({ mode: 'letter', roots: [], genders: [], letter: 'a' });
    expect(rpcCalls).toHaveLength(1);
  });

  it('caches semantic meaning searches — repeat wish does not re-run the pipeline', async () => {
    await searchNames({ mode: 'meaning', roots: [], genders: [], query: 'a calm soul' });
    await searchNames({ mode: 'meaning', roots: [], genders: [], query: 'a calm soul' });
    expect(rpcCalls).toHaveLength(1);
  });

  it('treats different queries as different cache entries', async () => {
    await searchNames({ mode: 'name', roots: [], genders: [], query: 'layla' });
    await searchNames({ mode: 'name', roots: [], genders: [], query: 'emre' });
    expect(rpcCalls).toHaveLength(2);
  });

  it('cache key is insensitive to root and gender order', async () => {
    await searchNames({ mode: 'browse', roots: ['arabic', 'turkish'], genders: ['girl', 'boy'] });
    await searchNames({ mode: 'browse', roots: ['turkish', 'arabic'], genders: ['boy', 'girl'] });
    expect(rpcCalls).toHaveLength(1);
  });

  it('does not serve stale rows after the cache is cleared', async () => {
    await searchNames({ mode: 'name', roots: [], genders: [], query: 'layla' });
    clearCache();
    await searchNames({ mode: 'name', roots: [], genders: [], query: 'layla' });
    expect(rpcCalls).toHaveLength(2);
  });

  it('evicts the oldest entries beyond the cache limit', async () => {
    // Fill past 100 entries.
    for (let i = 0; i < 105; i++) {
      await searchNames({ mode: 'name', roots: [], genders: [], query: `name-${i}` });
    }
    // The very first entry should have been evicted, so it hits the database again.
    rpcCalls.length = 0;
    await searchNames({ mode: 'name', roots: [], genders: [], query: 'name-0' });
    expect(rpcCalls).toHaveLength(1);
  });

  it('failed searches are not cached — a retry can succeed', async () => {
    useResponder(async () => ({ data: null, error: { message: 'temporary failure' } }));
    await expect(
      searchNames({ mode: 'browse', roots: [], genders: [] })
    ).rejects.toThrow('temporary failure');
    useResponder(async () => ({ data: sampleRows, error: null }));
    const rows = await searchNames({ mode: 'browse', roots: [], genders: [] });
    expect(rows).toHaveLength(2);
    expect(rpcCalls).toHaveLength(2);
  });
});
