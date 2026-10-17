import { createClient } from '@supabase/supabase-js';

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

export interface SearchParams {
  mode: SearchMode;
  roots: string[];
  genders: string[];
  letter?: string | null;
  query?: string | null;
  limit?: number;
}

export async function searchNames(params: SearchParams): Promise<NameResult[]> {
  const { data, error } = await supabase.rpc('search_names', {
    p_mode: params.mode,
    p_root: params.roots.length > 0 ? params.roots : null,
    p_gender: params.genders.length > 0 ? params.genders : null,
    p_letter: params.letter ?? null,
    p_query: params.query ?? null,
    p_limit: params.limit ?? 60,
  });

  if (error) throw new Error(error.message);
  return (data ?? []) as NameResult[];
}

const FEATURED_ROOTS = ['arabic', 'english', 'german', 'turkish'];

export async function fetchFeaturedNames(): Promise<NameResult[]> {
  const picked = await Promise.all(
    FEATURED_ROOTS.map(async (root) => {
      const { data, error } = await supabase.from('names').select('id').eq('root', root);
      if (error) throw new Error(error.message);
      const ids = (data ?? []) as { id: string }[];
      if (ids.length === 0) return null;
      return ids[Math.floor(Math.random() * ids.length)].id;
    })
  );

  const chosen = picked.filter((id): id is string => id !== null);
  if (chosen.length === 0) return [];

  const { data, error } = await supabase
    .from('names')
    .select(
      'id, name, root, gender, meaning, description, native_script, pronunciation, popularity'
    )
    .in('id', chosen);

  if (error) throw new Error(error.message);
  const rows = (data ?? []) as Omit<NameResult, 'score'>[];
  return rows
    .map((row) => ({ ...row, score: row.popularity / 100 }))
    .sort(() => Math.random() - 0.5);
}
