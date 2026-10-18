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
    <article className="group relative overflow-hidden rounded-lg shadow-sm transition-all duration-300 hover:-translate-y-0.5 hover:shadow-lg">
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
            'radial-gradient(90% 70% at 50% 40%, transparent 55%, rgba(150,125,85,0.12) 100%), radial-gradient(30% 20% at 85% 90%, rgba(170,140,95,0.10) 0%, transparent 70%)',
        }}
      />

      {/* double paper border */}
      <div
        aria-hidden
        className="pointer-events-none absolute inset-[7px] rounded-md"
        style={{
          border: '1px solid rgba(160,135,95,0.45)',
          boxShadow: 'inset 0 0 0 2.5px rgba(247,239,223,0.9), inset 0 0 0 3.5px rgba(160,135,95,0.30)',
        }}
      />

      {/* straw ribbon wrapped around the letter */}
      <div
        aria-hidden
        className="pointer-events-none absolute inset-x-0 top-[11px] h-[13px]"
        style={{
          background:
            'repeating-linear-gradient(90deg, #c9a768 0px, #b68f52 5px, #dcbd83 9px, #c9a768 14px), repeating-linear-gradient(to bottom, rgba(255,238,198,0.45) 0px, rgba(255,238,198,0.45) 1px, transparent 1px, transparent 4px)',
          boxShadow:
            '0 1.5px 2.5px rgba(96,66,24,0.35), inset 0 1px 0 rgba(255,240,200,0.55), inset 0 -1.5px 0 rgba(96,66,24,0.4), inset 6px 0 6px -4px rgba(96,66,24,0.45), inset -6px 0 6px -4px rgba(96,66,24,0.45)',
        }}
      />

      {/* straw bow at the top right, where the ribbon is tied */}
      <StrawBow className="absolute -top-1.5 right-2" />

      <div className="relative p-5 pt-9 pl-6">
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

function StrawBow({ className }: { className: string }) {
  return (
    <svg
      aria-hidden
      viewBox="0 0 104 84"
      className={`pointer-events-none h-[68px] w-[84px] ${className}`}
      fill="none"
      style={{ filter: 'drop-shadow(0 1.5px 1.5px rgba(96,66,24,0.3))' }}
    >
      {/* trailing ends of the ribbon */}
      <path
        d="M47 40 C40 54 34 64 24 76"
        stroke="#b68f52"
        strokeWidth="5"
        strokeLinecap="round"
      />
      <path
        d="M57 40 C63 55 68 65 79 75"
        stroke="#a67f45"
        strokeWidth="5"
        strokeLinecap="round"
      />
      <path
        d="M47 40 C40 54 34 64 24 76"
        stroke="#dcbD83"
        strokeWidth="1.5"
        strokeLinecap="round"
        opacity="0.8"
      />
      <path
        d="M57 40 C63 55 68 65 79 75"
        stroke="#d9ba7e"
        strokeWidth="1.5"
        strokeLinecap="round"
        opacity="0.8"
      />

      {/* loops */}
      <path
        d="M50 36 C36 14 10 14 8 30 C6 44 32 48 50 36 Z"
        fill="#cda868"
        stroke="#8f6a34"
        strokeWidth="1.4"
      />
      <path
        d="M54 36 C68 14 94 14 96 30 C98 44 72 48 54 36 Z"
        fill="#c39c58"
        stroke="#8f6a34"
        strokeWidth="1.4"
      />

      {/* straw fibers across the loops */}
      <path d="M14 26 C24 20 36 22 46 32" stroke="#a67f45" strokeWidth="1" opacity="0.7" />
      <path d="M12 34 C24 32 38 34 47 38" stroke="#a67f45" strokeWidth="1" opacity="0.6" />
      <path d="M90 26 C80 20 68 22 58 32" stroke="#93703a" strokeWidth="1" opacity="0.7" />
      <path d="M92 34 C80 32 66 34 57 38" stroke="#93703a" strokeWidth="1" opacity="0.6" />

      {/* knot */}
      <ellipse cx="52" cy="37" rx="8" ry="7" fill="#b0874a" stroke="#7c5a28" strokeWidth="1.4" />
      <path d="M46 34 C50 32 55 32 58 35" stroke="#e6cc92" strokeWidth="1.2" opacity="0.9" />
    </svg>
  );
}

function capitalizeFirst(s: string): string {
  return s.length > 0 ? s[0].toUpperCase() + s.slice(1) : s;
}
