import { GENDER_LABEL, GENDER_TONES, ROOT_LABEL, rootInfo } from '@/lib/roots';
import type { NameResult } from '@/lib/supabase';

interface Props {
  item: NameResult;
  showScore?: boolean;
}

const CARD_BG = "url('/assets/images/image%20copy%203.png')";

export function NameCard({ item, showScore }: Props) {
  const info = rootInfo(item.root);
  const genderTone = GENDER_TONES[item.gender];

  return (
    <article
      className="group relative flex flex-col overflow-hidden rounded-2xl bg-[#e8d9c3] bg-cover bg-center shadow-sm transition-all duration-300 hover:-translate-y-0.5 hover:shadow-md"
      style={{ backgroundImage: CARD_BG }}
    >
      {/* soft wash so text stays readable over the photo */}
      <div
        aria-hidden="true"
        className="absolute inset-0 bg-[#fbf5ea]/80 transition-colors duration-300 group-hover:bg-[#fbf5ea]/85"
      />

      <div className="relative flex flex-1 flex-col p-5">
        <div>
          <h3 className="truncate font-serif text-2xl font-semibold text-[#3c2d1e]">
            {item.name}
          </h3>
        </div>

        <p className="mt-2 text-[15px] font-medium leading-relaxed text-[#5b4130]">
          {capitalizeFirst(item.meaning)}
        </p>

        <p className="mt-1.5 text-sm leading-relaxed text-[#6b5a48]">{item.description}</p>

        <div className="mt-auto flex flex-wrap items-center gap-2 pt-4">
          <span
            className="inline-flex items-center gap-1.5 rounded-full bg-[#fbf7f0] px-2.5 py-1 text-xs font-medium text-[#6b4e2e] ring-1 ring-[#ddd0bf]"
          >
            <span className="text-sm leading-none">
              {info?.emoji ?? info?.flag ?? ROOT_LABEL[item.root] ?? item.root}
            </span>
            {ROOT_LABEL[item.root] ?? item.root} root
          </span>
          {genderTone && (
            <span
              className="inline-flex items-center gap-1.5 rounded-full bg-[#fbf7f0] px-2.5 py-1 text-xs font-medium ring-1 ring-[#ddd0bf]"
              style={{ color: genderTone.text }}
            >
              <span className="h-2 w-2 rounded-full" style={{ background: genderTone.dot }} />
              {GENDER_LABEL[item.gender] ?? item.gender}
            </span>
          )}
          {showScore && item.score > 0 && (
            <span className="rounded-full bg-[#f3e7d3] px-2.5 py-1 text-xs font-medium text-[#6b4e2e]">
              {Math.round(item.score * 100)}% match
            </span>
          )}
        </div>
      </div>
    </article>
  );
}


function capitalizeFirst(s: string): string {
  return s.length > 0 ? s[0].toUpperCase() + s.slice(1) : s;
}
