import { createClient } from '@supabase/supabase-js';
import { getCached, setCached } from '@/lib/searchCache';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error('Supabase configuration is missing');
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey, {
  auth: { persistSession: true, autoRefreshToken: true },
});

export interface NameResult {
  id: string;
  name: string;
  root: string;
  gender: string;
  meaning: string;
  description: string;
  native_script: string | null;
  pronunciation: string | null;
  popularity: number;
  score: number;
}

export type SearchMode = 'browse' | 'letter' | 'meaning' | 'name';

// How the typed text should match a name. 'starts' is the default.
export type MatchType = 'starts' | 'ends' | 'contains';

export interface SearchParams {
  mode: SearchMode;
  roots: string[];
  genders: string[];
  letter?: string | null;
  query?: string | null;
  match?: MatchType;
  limit?: number;
}

export async function searchNames(params: SearchParams): Promise<NameResult[]> {
  const cached = getCached(params);
  if (cached) return cached;

  const { data, error } = await supabase.rpc('search_names', {
    p_mode: params.mode,
    p_root: params.roots.length > 0 ? params.roots : null,
    p_gender: params.genders.length > 0 ? params.genders : null,
    p_letter: params.letter ?? null,
    p_query: params.query ?? null,
    p_limit: params.limit ?? 60,
  });

  if (error) throw new Error(error.message);
  const results = (data ?? []) as NameResult[];
  setCached(params, results);
  return results;
}

export interface MatchParams {
  roots: string[];
  genders: string[];
  match: MatchType;
  text: string;
  limit?: number;
}

// Fast anchored matching: starts with / ends with the typed text.
export async function matchNames(params: MatchParams): Promise<NameResult[]> {
  const searchParams: SearchParams = {
    mode: 'letter',
    roots: params.roots,
    genders: params.genders,
    letter: null,
    query: params.text,
    match: params.match,
    limit: params.limit ?? 60,
  };
  const cached = getCached(searchParams);
  if (cached) return cached;

  const { data, error } = await supabase.rpc('match_names', {
    p_root: params.roots.length > 0 ? params.roots : null,
    p_gender: params.genders.length > 0 ? params.genders : null,
    p_match: params.match,
    p_text: params.text,
    p_limit: params.limit ?? 60,
  });

  if (error) throw new Error(error.message);
  const results = (data ?? []) as NameResult[];
  setCached(searchParams, results);
  return results;
}
