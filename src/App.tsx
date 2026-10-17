import { useCallback, useEffect, useMemo, useState } from 'react';
import {
  Search,
  Sparkles,
  LayoutGrid,
  CaseSensitive,
  Loader2,
  SearchX,
  Baby,
  ChevronRight,
  ChevronLeft,
  BookOpen,
  Globe2,
  Heart,
} from 'lucide-react';
import { NameCard } from '@/components/NameCard';
import { CultureRequest } from '@/components/CultureRequest';
import {
  GenderFilter,
  LetterBar,
  RootFilter,
  selectedRootLabel,
  selectedGenderLabel,
} from '@/components/Filters';
import { ROOTS } from '@/lib/roots';
import { searchNames, type NameResult, type SearchMode } from '@/lib/supabase';

type Tab = SearchMode;

const PAGE_SIZE = 10;

const TABS: { id: Tab; label: string; icon: typeof LayoutGrid; hint: string }[] = [
  {
    id: 'browse',
    label: 'Browse by heritage',
    icon: LayoutGrid,
    hint: 'Pick one or more cultures and get their baby names, most loved first.',
  },
  {
    id: 'letter',
    label: 'Starts with',
    icon: CaseSensitive,
    hint: 'Have a letter in mind? Choose it, and optionally a heritage.',
  },
  {
    id: 'meaning',
    label: 'Search by meaning',
    icon: Sparkles,
    hint: 'Describe the wish behind the name, like "calm", "bright", "strong"…',
  },
  {
    id: 'name',
    label: 'Look up a name',
    icon: Search,
    hint: 'Already love a name? Find its meaning and heritage here.',
  },
];

export default function App() {
  const [tab, setTab] = useState<Tab>('browse');
  const [roots, setRoots] = useState<string[]>([]);
  const [genders, setGenders] = useState<string[]>([]);
  const [letter, setLetter] = useState<string | null>(null);
  const [query, setQuery] = useState('');
  const [debouncedQuery, setDebouncedQuery] = useState('');
  const [results, setResults] = useState<NameResult[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [searched, setSearched] = useState(false);
  const [page, setPage] = useState(1);

  const needsQuery = tab === 'meaning' || tab === 'name';

  // A search only happens once the user actually asks for something:
  // a heritage/gender pick, a letter, or typed text.
  const hasActiveSearch =
    roots.length > 0 ||
    genders.length > 0 ||
    (tab === 'letter' && letter !== null) ||
    (needsQuery && debouncedQuery.length > 0);

  useEffect(() => {
    const t = setTimeout(() => setDebouncedQuery(query.trim()), 250);
    return () => clearTimeout(t);
  }, [query]);

  useEffect(() => {
    setLetter(null);
  }, [roots, tab]);

  useEffect(() => {
    setPage(1);
  }, [tab, roots, genders, letter, debouncedQuery]);

  const runSearch = useCallback(async () => {
    if (!hasActiveSearch) {
      setResults([]);
      setSearched(false);
      return;
    }
    if (needsQuery && debouncedQuery.length === 0) {
      setResults([]);
      setSearched(false);
      return;
    }
    if (tab === 'letter' && !letter) {
      setResults([]);
      setSearched(false);
      return;
    }

    setLoading(true);
    setError(null);
    try {
      const data = await searchNames({
        mode: tab,
        roots,
        genders,
        letter,
        query: needsQuery ? debouncedQuery : null,
        limit: 60,
      });
      setResults(data);
      setSearched(true);
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Something went wrong');
      setResults([]);
      setSearched(true);
    } finally {
      setLoading(false);
    }
  }, [tab, roots, genders, letter, debouncedQuery, needsQuery, hasActiveSearch]);

  useEffect(() => {
    runSearch();
  }, [runSearch]);

  const exploreMeaning = useCallback((meaning: string) => {
    setTab('meaning');
    setQuery(meaning);
    document.getElementById('tell-us-what-matters')?.scrollIntoView({
      behavior: 'smooth',
      block: 'start',
    });
  }, []);

  const pickRoot = useCallback((rootId: string) => {
    setRoots([rootId]);
    document.getElementById('tell-us-what-matters')?.scrollIntoView({
      behavior: 'smooth',
      block: 'start',
    });
  }, []);

  const activeTab = useMemo(() => TABS.find((t) => t.id === tab), [tab]);

  const totalPages = Math.max(1, Math.ceil(results.length / PAGE_SIZE));
  const safePage = Math.min(page, totalPages);
  const pageResults = useMemo(
    () => results.slice((safePage - 1) * PAGE_SIZE, safePage * PAGE_SIZE),
    [results, safePage]
  );

  const goToPage = useCallback((next: number) => {
    setPage(next);
    document.getElementById('names-results')?.scrollIntoView({
      behavior: 'smooth',
      block: 'start',
    });
  }, []);

  return (
    <div className="min-h-screen bg-[#f9f4ec] font-sans text-[#3c2d1e]">
      {/* Hero */}
      <header className="bg-[#f5d8c1]/50 pb-8 pt-12 sm:pt-16">
        <div className="mx-auto max-w-4xl px-4 text-center sm:px-6">
          <div className="mx-auto mb-5 inline-flex items-center gap-2 rounded-full bg-[#fefbf7] px-4 py-1.5 text-sm font-medium text-[#6f4100] ring-1 ring-[#ddd6cf]">
            <Baby className="h-4 w-4 text-[#a4484f]" />
            Baby names for bicultural families
          </div>
          <h1 className="font-serif text-4xl font-semibold leading-tight tracking-tight text-[#3c2d1e] sm:text-5xl">
            The perfect name for your baby,
            <span className="block text-[#722f37]">from every culture you love</span>
          </h1>
          <p className="mx-auto mt-4 max-w-2xl text-lg leading-relaxed text-[#7a6a58]">
            You're not just choosing a name, you're choosing a story. Find the
            roots behind the names you love, feel the meaning in your own
            words, and discover the one that feels like yours.
          </p>
          {/* Quick trust strip */}
          <div className="mx-auto mt-6 flex max-w-2xl flex-wrap items-center justify-center gap-2 text-sm text-[#7a6a58]">
            {[
              { icon: BookOpen, text: "Find your name's root and story" },
              { icon: Globe2, text: 'Discover names from cultures you love' },
              { icon: Heart, text: 'A name that touches your soul and builds memories' },
            ].map(({ icon: Icon, text }) => (
              <span
                key={text}
                className="inline-flex items-center gap-1.5 rounded-full bg-[#fefbf7] px-3 py-1.5 ring-1 ring-[#ddd6cf]"
              >
                <Icon className="h-3.5 w-3.5 text-[#a4484f]" />
                {text}
              </span>
            ))}
          </div>
        </div>
      </header>

      <main className="mx-auto max-w-4xl px-4 pb-24 sm:px-6">
        {/* Choose how to search */}
        <section className="mt-8 rounded-2xl border border-[#ddd6cf] bg-[#fefbf7] p-5 shadow-sm sm:p-6">
          <h2 className="font-serif text-sm font-medium uppercase tracking-wide text-[#8a7a6b]">
            How do you want to find the name?
          </h2>
          <div className="mt-3 grid grid-cols-2 gap-2 sm:grid-cols-4">
            {TABS.map((t) => {
              const Icon = t.icon;
              const active = tab === t.id;
              return (
                <button
                  key={t.id}
                  onClick={() => {
                    setTab(t.id);
                    setQuery('');
                    setDebouncedQuery('');
                  }}
                  className={`flex flex-col items-center gap-2 rounded-xl px-3 py-4 text-sm font-medium transition-all sm:flex-row sm:py-3 ${
                    active
                      ? 'bg-[#3c2d1e] text-[#fefbf7] shadow-md'
                      : 'bg-[#f9f4ec] text-[#5b4130] ring-1 ring-[#ddd6cf] hover:bg-[#f2eade]'
                  }`}
                >
                  <Icon className={`h-5 w-5 shrink-0 ${active ? 'text-[#f3dcdf]' : 'text-[#b09a83]'}`} />
                  <span className="text-center leading-tight sm:text-left">{t.label}</span>
                </button>
              );
            })}
          </div>
        </section>

        {/* Tell us what matters to you */}
        <section
          id="tell-us-what-matters"
          className="mt-4 scroll-mt-4 rounded-2xl border border-[#ddd6cf] bg-[#fefbf7] p-5 shadow-sm sm:p-6"
        >
          <h2 className="font-serif text-lg font-semibold text-[#3c2d1e]">
            Tell us what matters to you
          </h2>

          <div className="mt-4 space-y-5">
            <div>
              <p className="mb-2 text-sm font-medium text-[#5b4130]">
                Family heritage
                <span className="ml-2 text-xs font-normal text-[#8a7a6b]">
                  optional: choose one, several, or none for every culture
                </span>
              </p>
              <RootFilter value={roots} onChange={setRoots} />
            </div>

            {tab === 'letter' && (
              <div>
                <p className="mb-2 text-sm font-medium text-[#5b4130]">Starts with</p>
                <LetterBar rootId={roots[0] ?? null} value={letter} onChange={setLetter} />
              </div>
            )}

            {needsQuery && (
              <div>
                <p className="mb-2 text-sm font-medium text-[#5b4130]">
                  {tab === 'meaning'
                    ? 'The wish behind the name'
                    : 'A name you already love'}
                </p>
                <div className="relative">
                  <Search className="pointer-events-none absolute left-4 top-1/2 h-5 w-5 -translate-y-1/2 text-[#b09a83]" />
                  <input
                    type="text"
                    value={query}
                    onChange={(e) => setQuery(e.target.value)}
                    placeholder={
                      tab === 'meaning'
                        ? 'e.g. river, calm, bright star…'
                        : 'e.g. Layla, Emre, Greta…'
                    }
                    className="w-full rounded-xl border-0 bg-[#f9f4ec] py-3.5 pl-12 pr-4 text-base text-[#3c2d1e] ring-1 ring-[#ddd6cf] transition-shadow placeholder:text-[#b09a83] focus:outline-none focus:ring-2 focus:ring-[#a4484f]"
                    autoFocus
                  />
                  {query && (
                    <button
                      onClick={() => setQuery('')}
                      className="absolute right-3 top-1/2 -translate-y-1/2 rounded-full px-2 py-0.5 text-sm text-[#8a7a6b] hover:bg-[#f2eade] hover:text-[#5b4130]"
                    >
                      clear
                    </button>
                  )}
                </div>
              </div>
            )}

            <div>
              <p className="mb-2 text-sm font-medium text-[#5b4130]">Gender</p>
              <GenderFilter value={genders} onChange={setGenders} />
            </div>

            {(roots.length > 0 || letter || query || genders.length > 0) && (
              <button
                onClick={() => {
                  setRoots([]);
                  setLetter(null);
                  setQuery('');
                  setGenders([]);
                }}
                className="rounded-full px-3 py-1.5 text-sm font-medium text-[#8a7a6b] transition-colors hover:bg-[#f2eade] hover:text-[#5b4130]"
              >
                Reset filters
              </button>
            )}

            {tab === 'letter' && !letter && (
              <p className="text-sm text-[#8a7a6b]">
                Every name has a first letter. Pick yours above and the list
                appears.
              </p>
            )}
          </div>
        </section>

        {/* Results */}
        <div id="names-results" className="mt-8">
          {loading && (
            <div className="flex items-center justify-center gap-3 py-16 text-[#8a7a6b]">
              <Loader2 className="h-5 w-5 animate-spin text-[#a4484f]" />
              <span className="text-sm">Searching…</span>
            </div>
          )}

          {!loading && error && (
            <div className="rounded-2xl border border-[#ddd6cf] bg-[#f3dcdf] px-5 py-4 text-sm text-[#722f37]">
              {error}
            </div>
          )}

          {!loading && !error && results.length > 0 && (
            <>
              <div className="mb-4 flex items-baseline gap-3">
                <h2 className="font-serif text-2xl font-semibold text-[#3c2d1e]">
                  Names waiting for you
                </h2>
                <p className="text-sm text-[#8a7a6b]">
                  {results.length} name{results.length === 1 ? '' : 's'}
                  {totalPages > 1 ? ` · page ${safePage} of ${totalPages}` : ''}
                  {' · '}
                  {selectedRootLabel(roots)}
                  {selectedGenderLabel(genders)}
                  {tab === 'browse' ? ' · most popular first' : ''}
                </p>
              </div>
              <div className="grid gap-4 md:grid-cols-2">
                {pageResults.map((item) => (
                  <NameCard
                    key={item.id}
                    item={item}
                    onExploreMeaning={exploreMeaning}
                    showScore={tab === 'meaning' || tab === 'name'}
                  />
                ))}
              </div>
              {totalPages > 1 && (
                <nav className="mt-8 flex items-center justify-center gap-2">
                  <button
                    onClick={() => goToPage(safePage - 1)}
                    disabled={safePage === 1}
                    className="inline-flex items-center gap-1 rounded-full px-4 py-2 text-sm font-medium transition-colors disabled:cursor-not-allowed disabled:opacity-40 enabled:bg-[#fefbf7] enabled:text-[#5b4130] enabled:ring-1 enabled:ring-[#ddd6cf] enabled:hover:bg-[#f2eade]"
                  >
                    <ChevronLeft className="h-4 w-4" />
                    Previous
                  </button>
                  {Array.from({ length: totalPages }, (_, i) => i + 1).map((p) => (
                    <button
                      key={p}
                      onClick={() => goToPage(p)}
                      className={`h-9 w-9 rounded-full text-sm font-medium transition-colors ${
                        p === safePage
                          ? 'bg-[#722f37] text-[#fefbf7]'
                          : 'bg-[#fefbf7] text-[#5b4130] ring-1 ring-[#ddd6cf] hover:bg-[#f2eade]'
                      }`}
                    >
                      {p}
                    </button>
                  ))}
                  <button
                    onClick={() => goToPage(safePage + 1)}
                    disabled={safePage === totalPages}
                    className="inline-flex items-center gap-1 rounded-full px-4 py-2 text-sm font-medium transition-colors disabled:cursor-not-allowed disabled:opacity-40 enabled:bg-[#fefbf7] enabled:text-[#5b4130] enabled:ring-1 enabled:ring-[#ddd6cf] enabled:hover:bg-[#f2eade]"
                  >
                    Next
                    <ChevronRight className="h-4 w-4" />
                  </button>
                </nav>
              )}
            </>
          )}

          {!loading && !error && searched && results.length === 0 && (
            <div className="rounded-2xl border border-dashed border-[#ddd6cf] bg-[#fefbf7] px-6 py-14 text-center">
              <SearchX className="mx-auto h-8 w-8 text-[#b09a83]" />
              <p className="mt-3 font-medium text-[#5b4130]">No names matched this time</p>
              <p className="mx-auto mt-1 max-w-sm text-sm leading-relaxed text-[#8a7a6b]">
                Every name is waiting to be found. Try a shorter word, like
                "calm" instead of "calmness", or loosen the filters above.
              </p>
            </div>
          )}

          {!loading && !searched && <RootPrompts onPickRoot={pickRoot} />}
        </div>

        {/* Suggest a culture / leave feedback */}
        <div className="mt-10">
          <CultureRequest />
        </div>
      </main>

      <footer className="border-t border-[#ddd6cf] bg-[#f5d8c1]/40 py-10">
        <div className="mx-auto max-w-4xl px-4 text-center sm:px-6">
          <p className="font-serif text-lg font-medium text-[#3c2d1e]">
            One name, two heritages, a story they carry for life.
          </p>
          <p className="mx-auto mt-2 max-w-xl text-sm leading-relaxed text-[#7a6a58]">
            Every baby name here carries its true meaning in English, its
            original culture and script, so both sides of the family can say
            it with pride.
          </p>
        </div>
      </footer>
    </div>
  );
}

function RootPrompts({ onPickRoot }: { onPickRoot: (root: string) => void }) {
  return (
    <div className="rounded-2xl border border-[#ddd6cf] bg-[#fefbf7] p-6 shadow-sm sm:p-8">
      <h2 className="font-serif text-xl font-semibold text-[#3c2d1e]">
        Not sure where to begin?
      </h2>
      <p className="mt-1 text-sm text-[#8a7a6b]">
        Start with a heritage. Every culture's most loved baby names are here.
      </p>
      <div className="mt-5 grid gap-3 sm:grid-cols-2">
        {ROOTS.map((r) => (
          <button
            key={r.id}
            onClick={() => onPickRoot(r.id)}
            className="group flex items-center justify-between rounded-xl px-4 py-3.5 text-left transition-all hover:shadow-md"
            style={{ background: r.accent }}
          >
            <span className="flex items-center gap-3">
              <span
                className="flex h-9 w-9 items-center justify-center rounded-lg bg-[#fefbf7] text-xs font-bold"
                style={{ color: r.accentText }}
              >
                {r.flag}
              </span>
              <span>
                <span className="block text-sm font-semibold" style={{ color: r.accentText }}>
                  {r.label} names
                </span>
                <span className="block text-xs text-[#7a6a58]">{r.nativeName}</span>
              </span>
            </span>
            <ChevronRight
              className="h-4 w-4 transition-transform group-hover:translate-x-0.5"
              style={{ color: r.accentText }}
            />
          </button>
        ))}
      </div>
    </div>
  );
}
