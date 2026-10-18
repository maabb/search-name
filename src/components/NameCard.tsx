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
    <article className="group rounded-2xl border border-[#8a6d54] bg-[#7a5c42] p-5 shadow-sm transition-all duration-300 hover:-translate-y-0.5 hover:shadow-md">
      <div className="flex items-start justify-between gap-3">
        <div className="min-w-0">
          <h3 className="truncate font-serif text-2xl font-semibold leading-tight text-[#f5ede2]">
            {item.name}
          </h3>
        </div>
      </div>

      <p className="mt-3 text-[15px] font-medium leading-relaxed text-[#efe3d3]">
        {capitalizeFirst(item.meaning)}
      </p>

      <p className="mt-2 text-sm leading-relaxed text-[#e2d4c2]">{item.description}</p>

      <div className="mt-4 flex flex-wrap items-center gap-2">
        <span
          className="inline-flex items-center gap-1.5 rounded-full px-2.5 py-1 text-xs font-medium"
          style={{
            background: 'rgba(254, 251, 247, 0.18)',
            color: info?.accent ?? '#f5ede2',
          }}
        >
          <span className="text-sm leading-none">{info.emoji ?? info.flag}</span>
          {ROOT_LABEL[item.root] ?? item.root} root
        </span>
        {genderTone && (
          <span
            className="inline-flex items-center gap-1.5 rounded-full px-2.5 py-1 text-xs font-medium ring-1 ring-white/25"
            style={{ background: genderTone.bg, color: '#fff' }}
          >
            <span className="h-2 w-2 rounded-full" style={{ background: genderTone.dot }} />
            {GENDER_LABEL[item.gender] ?? item.gender}
          </span>
        )}
        {showScore && item.score > 0 && (
          <span className="rounded-full bg-white/20 px-2.5 py-1 text-xs font-medium text-white">
            {Math.round(item.score * 100)}% match
          </span>
        )}
        <button
          onClick={() => onExploreMeaning(item.meaning.split(',')[0].trim())}
          className="ml-auto rounded-full px-2.5 py-1 text-xs font-medium text-[#efe3d3] transition-colors hover:bg-white/15 hover:text-white"
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
