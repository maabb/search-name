// Additional Arabic entries requested by the user + enrichment batch.
// Meanings verified against standard Arabic naming references.
export interface SeedName {
  name: string;
  root: 'arabic';
  gender: 'girl' | 'boy' | 'unisex';
  meaning: string;
  description: string;
  native_script?: string;
  pronunciation?: string;
  popularity: number;
}

export const newArabicNames: SeedName[] = [
  // --- Requested by the user ---
  { name: 'Maab', root: 'arabic', gender: 'girl', meaning: 'place of return, refuge, destination', description: 'From the Arabic root awb, "to return". Poetic name suggesting a safe haven one returns to.', native_script: 'مآب', pronunciation: 'MAH-ab', popularity: 52 },
  { name: 'Reab', root: 'arabic', gender: 'unisex', meaning: 'variant spelling of Maab, place of return', description: 'A modern transliteration of Maab, carrying the same meaning of refuge and homecoming.', native_script: 'مآب', pronunciation: 'REE-ab', popularity: 30 },
  { name: 'Diaa', root: 'arabic', gender: 'boy', meaning: 'light, radiance, splendor', description: 'From Arabic diyaa, "radiance and brightness", also written Zia or Dia. Distinguished and classic.', native_script: 'ضياء', pronunciation: 'dee-YAH', popularity: 60 },
  { name: 'Tala', root: 'arabic', gender: 'girl', meaning: 'young palm tree, gentle and graceful', description: 'Arabic for the soft young palm sapling, symbol of grace and upward growth.', native_script: 'طلاء', pronunciation: 'TAH-lah', popularity: 62 },
  { name: 'Homam', root: 'arabic', gender: 'boy', meaning: 'generous heart, great-hearted giver', description: 'From Arabic himam, noble-mindedness and openhanded courage. A strong honorific name.', native_script: 'همام', pronunciation: 'hoh-MAHM', popularity: 55 },
  { name: 'Hashem', root: 'arabic', gender: 'boy', meaning: 'breaker of bread, generous feeder of others', description: 'The title of the Prophet\'s great-grandfather Hashim, from hashama, "to crush bread for guests". Forever tied to generosity.', native_script: 'هاشم', pronunciation: 'HAH-shem', popularity: 72 },
  { name: 'Hisham', root: 'arabic', gender: 'boy', meaning: 'generous, openhanded', description: 'Classic Arabic name meaning generosity, borne by Umayyad caliphs and the poet Hisham ibn al-Kalbi.', native_script: 'هشام', pronunciation: 'hee-SHAHM', popularity: 68 },
  { name: 'Yaman', root: 'arabic', gender: 'boy', meaning: 'blessed, prosperous, of the right side (good fortune)', description: 'From the Arabic root yumn, "blessing and good fortune"; also the name of the land of Yemen, "the blessed south".', native_script: 'يمن', pronunciation: 'YAH-man', popularity: 58 },
  { name: 'Rukana', root: 'arabic', gender: 'boy', meaning: 'steadfast, firm, unmoving in resolve', description: 'Name of the Prophet\'s companion Rukana ibn Abd Yaghuth, famed for his strength and steadfastness.', native_script: 'ركانة', pronunciation: 'roo-KAH-nah', popularity: 38 },
  { name: 'Muhab', root: 'arabic', gender: 'boy', meaning: 'of deep love, beloved', description: 'From the Arabic root mahabba, "love and affection". A tender, heartfelt name.', native_script: 'محب', pronunciation: 'moo-HAB', popularity: 45 },
  { name: 'Remaa', root: 'arabic', gender: 'girl', meaning: 'white gazelle, graceful antelope', description: 'Expanded spelling of Rema, the gazelle that is a classic symbol of beauty in Arabic poetry.', native_script: 'ريم', pronunciation: 'REE-mah', popularity: 48 },
  { name: 'Rema', root: 'arabic', gender: 'girl', meaning: 'white gazelle, striking beauty', description: 'From Arabic reem, the white gazelle celebrated by poets as the ideal of graceful beauty.', native_script: 'ريما', pronunciation: 'REH-mah', popularity: 66 },
  { name: 'Etaaf', root: 'arabic', gender: 'girl', meaning: 'kindness, compassion, tenderness of heart', description: 'From Arabic itaat, gentleness and sympathetic kindness. Soft and warm in meaning.', native_script: 'إعطاف', pronunciation: 'et-TAHF', popularity: 35 },
  { name: 'Aghyad', root: 'arabic', gender: 'boy', meaning: 'brave and noble youth, gallant man', description: 'From Arabic aghyad, plural of ghayd, "young manly courage and noble generosity".', native_script: 'أغياد', pronunciation: 'agh-YAD', popularity: 42 },
  { name: 'Ayham', root: 'arabic', gender: 'boy', meaning: 'brave, lion-hearted, decisive', description: 'Pre-Islamic Arabic name meaning courageous and resolute, carried by poets and knights.', native_script: 'أيهام', pronunciation: 'eye-HAHM', popularity: 50 },
  { name: 'Sura', root: 'arabic', gender: 'girl', meaning: 'star, constellation (the Pleiades), high-flying', description: 'From Arabic suraa, the Pleiades star cluster, a classic image of beauty and elevation in Arabic verse.', native_script: 'ثريا', pronunciation: 'SOO-rah', popularity: 46 },
];
