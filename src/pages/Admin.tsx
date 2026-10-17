import { useEffect, useState } from 'react';
import {
  Loader2,
  Lock,
  LogOut,
  Mail,
  MessageSquareHeart,
  Trash2,
} from 'lucide-react';
import { supabase } from '@/lib/supabase';

interface Submission {
  id: string;
  culture_name: string;
  message: string | null;
  email: string | null;
  created_at: string;
}

export function AdminPage() {
  const [session, setSession] = useState<boolean | null>(null);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [authError, setAuthError] = useState('');
  const [busy, setBusy] = useState(false);
  const [items, setItems] = useState<Submission[] | null>(null);
  const [loadError, setLoadError] = useState('');

  useEffect(() => {
    supabase.auth.getSession().then(({ data }) => setSession(!!data.session));
    const { data: sub } = supabase.auth.onAuthStateChange((_event, s) => {
      setSession(!!s);
    });
    return () => sub.subscription.unsubscribe();
  }, []);

  useEffect(() => {
    if (session) loadItems();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [session]);

  const loadItems = async () => {
    setLoadError('');
    const { data, error } = await supabase
      .from('culture_requests')
      .select('id, culture_name, message, email, created_at')
      .order('created_at', { ascending: false });
    if (error) {
      setLoadError(error.message);
      setItems(null);
      return;
    }
    setItems((data ?? []) as Submission[]);
  };

  const signIn = async (e: React.FormEvent) => {
    e.preventDefault();
    setBusy(true);
    setAuthError('');
    const { error } = await supabase.auth.signInWithPassword({
      email: email.trim(),
      password,
    });
    if (error) setAuthError(error.message);
    setBusy(false);
  };

  const signOut = async () => {
    await supabase.auth.signOut();
    setItems(null);
  };

  const remove = async (id: string) => {
    const { error } = await supabase
      .from('culture_requests')
      .delete()
      .eq('id', id);
    if (!error) setItems((prev) => (prev ?? []).filter((r) => r.id !== id));
  };

  if (session === null || session === undefined) {
    return (
      <div className="flex min-h-screen items-center justify-center bg-[#f9f4ec] text-[#8a7a6b]">
        <Loader2 className="h-5 w-5 animate-spin text-[#a4484f]" />
      </div>
    );
  }

  if (!session) {
    return (
      <div className="flex min-h-screen items-center justify-center bg-[#f9f4ec] px-4">
        <form
          onSubmit={signIn}
          className="w-full max-w-sm rounded-2xl border border-[#ddd6cf] bg-[#fefbf7] p-6 shadow-sm sm:p-8"
        >
          <div className="flex items-center gap-3">
            <span className="flex h-10 w-10 items-center justify-center rounded-xl bg-[#f3dcdf]">
              <Lock className="h-5 w-5 text-[#722f37]" />
            </span>
            <div>
              <h1 className="font-serif text-xl font-semibold text-[#3c2d1e]">
                Owner sign in
              </h1>
              <p className="text-sm text-[#8a7a6b]">
                Private area for culture suggestions.
              </p>
            </div>
          </div>

          <div className="mt-5 space-y-4">
            <div>
              <label htmlFor="admin-email" className="mb-1.5 block text-sm font-medium text-[#5b4130]">
                Email
              </label>
              <input
                id="admin-email"
                type="email"
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="w-full rounded-xl border-0 bg-[#f9f4ec] py-3 px-4 text-base text-[#3c2d1e] ring-1 ring-[#ddd6cf] focus:outline-none focus:ring-2 focus:ring-[#722f37]"
              />
            </div>
            <div>
              <label htmlFor="admin-password" className="mb-1.5 block text-sm font-medium text-[#5b4130]">
                Password
              </label>
              <input
                id="admin-password"
                type="password"
                required
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="w-full rounded-xl border-0 bg-[#f9f4ec] py-3 px-4 text-base text-[#3c2d1e] ring-1 ring-[#ddd6cf] focus:outline-none focus:ring-2 focus:ring-[#722f37]"
              />
            </div>

            {authError && (
              <p className="rounded-xl bg-[#f3dcdf] px-4 py-3 text-sm text-[#722f37]">
                {authError}
              </p>
            )}

            <button
              type="submit"
              disabled={busy}
              className="inline-flex w-full items-center justify-center gap-2 rounded-xl bg-[#722f37] px-5 py-3 text-sm font-semibold text-[#fefbf7] transition-colors hover:bg-[#5d262d] disabled:opacity-50"
            >
              {busy ? <Loader2 className="h-4 w-4 animate-spin" /> : <Lock className="h-4 w-4" />}
              Sign in
            </button>
            <a
              href="/"
              className="block text-center text-sm text-[#8a7a6b] hover:text-[#5b4130]"
            >
              Back to the site
            </a>
          </div>
        </form>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#f9f4ec]">
      <header className="border-b border-[#ddd6cf] bg-[#fefbf7]">
        <div className="mx-auto flex max-w-4xl items-center justify-between px-4 py-4 sm:px-6">
          <div className="flex items-center gap-3">
            <span className="flex h-9 w-9 items-center justify-center rounded-xl bg-[#f3dcdf]">
              <MessageSquareHeart className="h-4 w-4 text-[#722f37]" />
            </span>
            <h1 className="font-serif text-lg font-semibold text-[#3c2d1e]">
              Culture suggestions
            </h1>
          </div>
          <div className="flex items-center gap-2">
            <a
              href="/"
              className="rounded-full px-3 py-1.5 text-sm text-[#8a7a6b] transition-colors hover:bg-[#f2eade] hover:text-[#5b4130]"
            >
              View site
            </a>
            <button
              onClick={signOut}
              className="inline-flex items-center gap-1.5 rounded-full px-3 py-1.5 text-sm text-[#722f37] transition-colors hover:bg-[#f3dcdf]"
            >
              <LogOut className="h-4 w-4" />
              Sign out
            </button>
          </div>
        </div>
      </header>

      <main className="mx-auto max-w-4xl px-4 py-8 sm:px-6">
        {loadError && (
          <div className="rounded-2xl bg-[#f3dcdf] px-5 py-4 text-sm text-[#722f37]">
            {loadError}
          </div>
        )}

        {items === null && !loadError && (
          <div className="flex items-center justify-center gap-3 py-16 text-[#8a7a6b]">
            <Loader2 className="h-5 w-5 animate-spin text-[#a4484f]" />
            <span className="text-sm">Loading…</span>
          </div>
        )}

        {items !== null && items.length === 0 && (
          <div className="rounded-2xl border border-dashed border-[#ddd6cf] bg-[#fefbf7] px-6 py-14 text-center">
            <Mail className="mx-auto h-8 w-8 text-[#b09a83]" />
            <p className="mt-3 font-medium text-[#5b4130]">No suggestions yet</p>
            <p className="mt-1 text-sm text-[#8a7a6b]">
              When visitors ask for a new culture, it will appear here.
            </p>
          </div>
        )}

        {items !== null && items.length > 0 && (
          <div className="space-y-4">
            <p className="text-sm text-[#8a7a6b]">
              {items.length} suggestion{items.length === 1 ? '' : 's'}
            </p>
            {items.map((r) => (
              <article
                key={r.id}
                className="rounded-2xl border border-[#ddd6cf] bg-[#fefbf7] p-5 shadow-sm"
              >
                <div className="flex items-start justify-between gap-3">
                  <div className="min-w-0">
                    <h2 className="font-serif text-xl font-semibold text-[#3c2d1e]">
                      {r.culture_name}
                    </h2>
                    <p className="mt-0.5 text-xs text-[#8a7a6b]">
                      {new Date(r.created_at).toLocaleString()}
                    </p>
                  </div>
                  <button
                    onClick={() => remove(r.id)}
                    title="Delete this suggestion"
                    className="shrink-0 rounded-full p-2 text-[#8a7a6b] transition-colors hover:bg-[#f3dcdf] hover:text-[#722f37]"
                  >
                    <Trash2 className="h-4 w-4" />
                  </button>
                </div>
                {r.message && (
                  <p className="mt-3 text-sm leading-relaxed text-[#5b4130]">{r.message}</p>
                )}
                {r.email && (
                  <a
                    href={`mailto:${r.email}`}
                    className="mt-3 inline-flex items-center gap-1.5 text-sm font-medium text-[#722f37] hover:underline"
                  >
                    <Mail className="h-3.5 w-3.5" />
                    {r.email}
                  </a>
                )}
              </article>
            ))}
          </div>
        )}
      </main>
    </div>
  );
}
