import { ROOTS, GENDERS, GENDER_TONES, ROOT_LABEL, GENDER_LABEL } from '@/lib/roots';

interface GenderFilterProps {
  value: string[];
  onChange: (value: string[]) => void;
}

export function GenderFilter({ value, onChange }: GenderFilterProps) {
  const toggle = (id: string) => {
    onChange(value.includes(id) ? value.filter((g) => g !== id) : [...value, id]);
  };

  return (
    <div className="flex flex-wrap gap-1.5">
      {GENDERS.map((o) => {
        const active = value.includes(o.id);
        const tone = GENDER_TONES[o.id];
        return (
          <button
            key={o.id}
            onClick={() => toggle(o.id)}
            className={`inline-flex items-center gap-1.5 rounded-full px-3.5 py-1.5 text-sm font-medium transition-colors ${
              active
                ? ''
                : 'bg-[#fefbf7] text-[#5b4130] ring-1 ring-[#ddd6cf] hover:bg-[#f2eade]'
            }`}
            style={active ? { background: tone.bg, color: tone.text } : undefined}
          >
            <span
              className="h-2 w-2 rounded-full"
              style={{ background: tone.dot }}
            />
            {o.label}
          </button>
        );
      })}
      {value.length > 0 && (
        <button
          onClick={() => onChange([])}
          className="inline-flex items-center rounded-full px-3 py-1.5 text-sm text-[#8a7a6b] transition-colors hover:bg-[#f2eade] hover:text-[#5b4130]"
        >
          clear
        </button>
      )}
    </div>
  );
}

interface RootFilterProps {
  value: string[];
  onChange: (value: string[]) => void;
}

export function RootFilter({ value, onChange }: RootFilterProps) {
  const toggle = (id: string) => {
    onChange(value.includes(id) ? value.filter((r) => r !== id) : [...value, id]);
  };

  return (
    <div className="flex flex-wrap gap-1.5">
      {ROOTS.map((r) => {
        const active = value.includes(r.id);
        return (
          <button
            key={r.id}
            onClick={() => toggle(r.id)}
            className={`inline-flex items-center gap-1.5 rounded-full px-3.5 py-1.5 text-sm font-medium transition-colors ${
              active
                ? ''
                : 'bg-[#fefbf7] text-[#5b4130] ring-1 ring-[#ddd6cf] hover:bg-[#f2eade]'
            }`}
            style={active ? { background: r.accent, color: r.accentText } : undefined}
          >
            <span className="text-[10px] font-bold tracking-wide">{r.flag}</span>
            {r.label}
          </button>
        );
      })}
      {value.length > 0 && (
        <button
          onClick={() => onChange([])}
          className="inline-flex items-center rounded-full px-3 py-1.5 text-sm text-[#8a7a6b] transition-colors hover:bg-[#f2eade] hover:text-[#5b4130]"
        >
          clear
        </button>
      )}
    </div>
  );
}

export type MatchTypeValue = 'starts' | 'ends';

interface MatchTypeBarProps {
  value: 'starts' | 'ends';
  onChange: (value: 'starts' | 'ends') => void;
}

export function MatchTypeBar({ value, onChange }: MatchTypeBarProps) {
  const options: { id: MatchTypeValue; label: string }[] = [
    { id: 'starts', label: 'Starts with' },
    { id: 'ends', label: 'Ends with' },
  ];

  return (
    <div className="flex gap-1.5">
      {options.map((o) => {
        const active = value === o.id;
        return (
          <button
            key={o.id}
            onClick={() => onChange(o.id)}
            className={`rounded-full px-3.5 py-1.5 text-sm font-medium transition-colors ${
              active
                ? 'bg-[#3c2d1e] text-[#fefbf7]'
                : 'bg-[#fefbf7] text-[#5b4130] ring-1 ring-[#ddd6cf] hover:bg-[#f2eade]'
            }`}
          >
            {o.label}
          </button>
        );
      })}
    </div>
  );
}

export function selectedRootLabel(roots: string[]): string {
  if (roots.length === 0) return 'all roots';
  if (roots.length === ROOTS.length) return 'all roots';
  return roots.map((r) => ROOT_LABEL[r] ?? r).join(' + ');
}

export function selectedGenderLabel(genders: string[]): string {
  if (genders.length === 0 || genders.length === GENDERS.length) return '';
  return ' · ' + genders.map((g) => GENDER_LABEL[g] ?? g).join(' + ');
}
