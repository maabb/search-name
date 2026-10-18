import { GENDER_LABEL, GENDER_TONES, ROOT_LABEL, rootInfo } from '@/lib/roots';
import type { NameResult } from '@/lib/supabase';

interface Props {
  item: NameResult;
  onExploreMeaning: (meaning: string) => void;
  showScore?: boolean;
}

export function NameCard({ item, onExploreMeaning, showScore }: Props) {
  const info = rootInfo(item.root);
  const genderTone = GENDER_TONES[item.gender];

  return (
    <article className="group relative overflow-hidden rounded-xl shadow-sm transition-all duration-300 hover:-translate-y-0.5 hover:shadow-lg">
      {/* aged letter-paper background */}
      <div
        aria-hidden
        className="absolute inset-0"
        style={{
          background:
            'radial-gradient(120% 90% at 20% 0%, rgba(255,252,244,0.9) 0%, rgba(247,239,223,0.85) 45%, rgba(240,228,204,0.9) 100%)',
        }}
      />
      <div
        aria-hidden
        className="absolute inset-0 opacity-[0.35]"
        style={{
          background:
            'repeating-linear-gradient(to bottom, transparent 0px, transparent 27px, rgba(140,120,90,0.10) 28px)',
        }}
      />
      <div
        aria-hidden
        className="absolute inset-0"
        style={{
          background:
            'radial-gradient(90% 70% at 50% 40%, transparent 55%, rgba(150,125,85,0.10) 100%)',
        }}
      />

      {/* partial double border — opens at the corners for the flowers */}
      <div
        aria-hidden
        className="pointer-events-none absolute inset-[7px] rounded-md"
        style={{
          border: '1px solid rgba(160,135,95,0.45)',
          boxShadow: 'inset 0 0 0 2.5px rgba(247,239,223,0.9), inset 0 0 0 3.5px rgba(160,135,95,0.30)',
          maskImage:
            'linear-gradient(to right, transparent 0, transparent 34px, black 56px, black calc(100% - 56px), transparent calc(100% - 34px)), linear-gradient(to bottom, transparent 0, transparent 34px, black 56px, black calc(100% - 56px), transparent calc(100% - 34px))',
          maskComposite: 'intersect',
          WebkitMaskImage:
            'linear-gradient(to right, transparent 0, transparent 34px, black 56px, black calc(100% - 56px), transparent calc(100% - 34px)), linear-gradient(to bottom, transparent 0, transparent 34px, black 56px, black calc(100% - 56px), transparent calc(100% - 34px))',
          WebkitMaskComposite: 'source-in',
        }}
      />

      {/* calm botanical corners */}
      <CornerSprig className="absolute left-0 top-0" />
      <CornerSprig className="absolute right-0 top-0 -scale-x-100" />
      <CornerSprig className="absolute bottom-0 left-0 -scale-y-100" />
      <CornerSprig className="absolute bottom-0 right-0 -scale-100" />

      <div className="relative p-5 pl-6">
        <div className="flex items-start justify-between gap-3">
          <div className="min-w-0">
            <h3 className="truncate font-serif text-2xl font-semibold leading-tight text-[#3c2d1e]">
              {item.name}
            </h3>
            <p className="mt-0.5 text-sm italic text-[#8a7a6b]">
              {item.pronunciation ?? ''}
            </p>
          </div>
          {item.native_script && item.native_script !== item.name && (
            <span
              className="shrink-0 rounded-lg px-2.5 py-1.5 text-lg"
              dir="auto"
              style={{
                background: 'rgba(254,251,247,0.85)',
                color: info?.accentText ?? '#5b4130',
              }}
            >
              {item.native_script}
            </span>
          )}
        </div>

        <p className="mt-3 text-[15px] font-medium leading-relaxed text-[#5b4130]">
          {capitalizeFirst(item.meaning)}
        </p>

        <p className="mt-2 text-sm leading-relaxed text-[#7a6a58]">
          {item.description}
        </p>

        <div className="mt-4 flex flex-wrap items-center gap-2">
          <span
            className="inline-flex items-center gap-1.5 rounded-full px-2.5 py-1 text-xs font-medium"
            style={{
              background: info?.accent ?? '#f2eade',
              color: info?.accentText ?? '#5b4130',
            }}
          >
            <span className="text-[10px] font-bold tracking-wide">{info?.flag}</span>
            {ROOT_LABEL[item.root] ?? item.root} root
          </span>
          {genderTone && (
            <span
              className="inline-flex items-center gap-1.5 rounded-full bg-[#fefbf7]/90 px-2.5 py-1 text-xs font-medium"
              style={{ color: genderTone.text }}
            >
              <span
                className="h-2 w-2 rounded-full"
                style={{ background: genderTone.dot }}
              />
              {GENDER_LABEL[item.gender] ?? item.gender}
            </span>
          )}
          {showScore && item.score > 0 && (
            <span className="rounded-full bg-[#efe5d3] px-2.5 py-1 text-xs font-medium text-[#6b4e2e]">
              {Math.round(item.score * 100)}% match
            </span>
          )}
          <button
            onClick={() => onExploreMeaning(item.meaning.split(',')[0].trim())}
            className="ml-auto rounded-full px-2.5 py-1 text-xs font-medium text-[#8a7a6b] transition-colors hover:bg-[#f2eade] hover:text-[#5b4130]"
            title="Find names with a similar meaning"
          >
            Similar meanings
          </button>
        </div>
      </div>
    </article>
  );
}

function CornerSprig({ className }: { className: string }) {
  return (
    <svg
      aria-hidden
      viewBox="0 0 64 64"
      className={`h-12 w-12 text-[#7d8b6a] ${className}`}
      fill="none"
      style={{ opacity: 0.75 }}
    >
      <path
        d="M6 58 C10 44 14 36 24 28 C32 22 42 18 54 16"
        stroke="currentColor"
        strokeWidth="1.4"
        strokeLinecap="round"
      />
      <path
        d="M14 46 C20 44 26 44 30 46 C26 50 20 50 14 46 Z"
        fill="currentColor"
        opacity="0.55"
      />
      <path
        d="M26 34 C32 30 38 29 43 31 C39 36 32 37 26 34 Z"
        fill="currentColor"
        opacity="0.7"
      />
      <path
        d="M40 22 C45 19 51 18 56 20 C52 25 45 26 40 22 Z"
        fill="currentColor"
        opacity="0.6"
      />
      <circle cx="50" cy="14" r="2.2" fill="#c98d5f" />
      <circle cx="56" cy="20" r="1.6" fill="#c98d5f" opacity="0.8" />
      <circle cx="12" cy="54" r="1.8" fill="#c98d5f" opacity="0.7" />
    </svg>
  );
}

function capitalizeFirst(s: string): string {
  return s.length > 0 ? s[0].toUpperCase() + s.slice(1) : s;
}
