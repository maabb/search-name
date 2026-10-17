import { type LucideIcon, BookOpen, Languages, ArrowRightLeft } from 'lucide-react';

export interface RootInfo {
  id: string;
  label: string;
  nativeName: string;
  flag: string;
  icon: LucideIcon;
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
    icon: BookOpen,
    accent: '#f3dcdf',
    accentText: '#722f37',
    letterCase: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
  },
  {
    id: 'german',
    label: 'German',
    nativeName: 'Deutsch',
    flag: 'DE',
    icon: Languages,
    accent: '#f3dcdf',
    accentText: '#722f37',
    letterCase: 'ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜ',
  },
  {
    id: 'turkish',
    label: 'Turkish',
    nativeName: 'Türkçe',
    flag: 'TR',
    icon: ArrowRightLeft,
    accent: '#f3dcdf',
    accentText: '#722f37',
    letterCase: 'ABCDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ',
  },
  {
    id: 'arabic',
    label: 'Arabic',
    nativeName: 'العربية',
    flag: 'AR',
    icon: BookOpen,
    accent: '#f3dcdf',
    accentText: '#722f37',
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
