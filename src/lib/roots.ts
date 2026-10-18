import { type LucideIcon, BookOpen, Languages, ArrowRightLeft, MoonStar } from 'lucide-react';

export interface RootInfo {
  id: string;
  label: string;
  nativeName: string;
  flag: string;
  emoji: string | null;
  icon: LucideIcon;
  iconColor: string | null;
  accent: string;
  accentText: string;
  letterCase: string;
}

export const ROOTS: RootInfo[] = [
  {
    id: 'english',
    label: 'English',
    nativeName: 'English heritage',
    flag: 'EN',
    emoji: '🇬🇧',
    icon: BookOpen,
    iconColor: null,
    accent: '#efe5d3',
    accentText: '#6b4e2e',
    letterCase: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
  },
  {
    id: 'german',
    label: 'German',
    nativeName: 'Deutsch',
    flag: 'DE',
    emoji: '🇩🇪',
    icon: Languages,
    iconColor: null,
    accent: '#e7d9bf',
    accentText: '#5c4429',
    letterCase: 'ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜ',
  },
  {
    id: 'turkish',
    label: 'Turkish',
    nativeName: 'Türkçe',
    flag: 'TR',
    emoji: '🇹🇷',
    icon: ArrowRightLeft,
    iconColor: null,
    accent: '#e2d2b6',
    accentText: '#6a4f2c',
    letterCase: 'ABCDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ',
  },
  {
    id: 'arabic',
    label: 'Arabic',
    nativeName: 'العربية',
    flag: 'AR',
    emoji: null,
    icon: MoonStar,
    iconColor: '#15803d',
    accent: '#dcc9a9',
    accentText: '#5a4226',
    letterCase: 'ABCDEFGHJKLMNPQRSTUVWXYZ',
  },
];

export const GENDERS = [
  { id: 'girl', label: 'Girl' },
  { id: 'boy', label: 'Boy' },
  { id: 'unisex', label: 'Unisex' },
];

// Warm, muted gender tones that sit inside the cream/peach palette.
export const GENDER_TONES: Record<string, { bg: string; text: string; dot: string }> = {
  girl: { bg: '#f9e3e3', text: '#8a3c3c', dot: '#c86b6b' },
  boy: { bg: '#e8edf4', text: '#3c5a8a', dot: '#8ba6cc' },
  unisex: { bg: '#efe8f6', text: '#5d4a7e', dot: '#b39ddb' },
};

export const ROOT_LABEL: Record<string, string> = {
  english: 'English',
  german: 'German',
  turkish: 'Turkish',
  arabic: 'Arabic',
};

export const GENDER_LABEL: Record<string, string> = {
  girl: 'Girl',
  boy: 'Boy',
  unisex: 'Unisex',
};

export function rootInfo(id: string): RootInfo | undefined {
  return ROOTS.find((r) => r.id === id);
}
