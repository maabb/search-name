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
    <article className="group rounded-2xl border border-[#ddd6cf] bg-[#fefbf7] p-5 shadow-sm transition-all duration-300 hover:-translate-y-0.5 hover:shadow-md">
      <div className="flex items-start justify-between gap-3">
        <div className="min-w-0">
          <h3 className="truncate font-serif text-2xl font-semibold leading-tight text-[#3c2d1e]">
            {item.name}
          </h3>
          {item.pronunciation && (
            <p className="mt-0.5 text-sm italic text-[#8a7a6b]">{item.pronunciation}</p>
          )}
        </div>
        {item.native_script && item.native_script !== item.name && (
          <span
            className="shrink-0 rounded-lg bg-[#f9f4ec] px-2.5 py-1.5 text-lg text-[#5b4130] ring-1 ring-[#ddd6cf]"
            dir="auto"
          >
            {item.native_script}
          </span>
        )}
      </div>

      <p className="mt-3 text-[15px] font-medium leading-relaxed text-[#5b4130]">
        {capitalizeFirst(item.meaning)}
      </p>

      <p className="mt-2 text-sm leading-relaxed text-[#7a6a58]">{item.description}</p>

      <div className="mt-4 flex flex-wrap items-center gap-2">
        <span
          className="inline-flex items-center gap-1.5 rounded-full px-2.5 py-1 text-xs font-medium"
          style={{
            background: info?.accent ?? '#f2eade',
            color: info?.accentText ?? '#5b4130',
          }}
        >
          <span className="text-sm leading-none">{info.emoji ?? info.flag}</span>
          {ROOT_LABEL[item.root] ?? item.root} root
        </span>
        {genderTone && (
          <span
            className="inline-flex items-center gap-1.5 rounded-full bg-[#f9f4ec] px-2.5 py-1 text-xs font-medium ring-1 ring-[#ddd6cf]"
            style={{ color: genderTone.text }}
          >
            <span className="h-2 w-2 rounded-full" style={{ background: genderTone.dot }} />
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
    </article>
  );
}

function capitalizeFirst(s: string): string {
  return s.length > 0 ? s[0].toUpperCase() + s.slice(1) : s;
}
