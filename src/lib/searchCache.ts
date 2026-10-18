import type { NameResult, SearchParams } from '@/lib/supabase';

const MAX_ENTRIES = 100;

interface CacheEntry {
  data: NameResult[];
  stamp: number;
}

const cache = new Map<string, CacheEntry>();

function cacheKey(params: SearchParams): string {
  const roots = [...params.roots].sort().join(',');
  const genders = [...params.genders].sort().join(',');
  return [
    params.mode,
    roots,
    genders,
    params.letter ?? '',
    params.query ?? '',
    params.match ?? '',
    params.limit ?? 60,
  ].join('|');
}

export function getCached(params: SearchParams): NameResult[] | null {
  const key = cacheKey(params);
  const hit = cache.get(key);
  if (!hit) return null;
  // Refresh insertion order so the oldest unused entry is evicted first.
  cache.delete(key);
  cache.set(key, hit);
  return hit.data;
}

export function setCached(params: SearchParams, data: NameResult[]): void {
  const key = cacheKey(params);
  cache.delete(key);
  cache.set(key, { data, stamp: Date.now() });
  while (cache.size > MAX_ENTRIES) {
    const oldest = cache.keys().next().value;
    if (oldest === undefined) break;
    cache.delete(oldest);
  }
}

export function clearNameCache(): void {
  cache.clear();
}
