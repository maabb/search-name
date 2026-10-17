INSERT INTO names (name, root, gender, meaning, description, native_script, pronunciation, popularity) VALUES
('Maab', 'arabic', 'girl', 'place of return, refuge, destination', 'From the Arabic root awb, "to return". Poetic name suggesting a safe haven one returns to.', 'مآب', 'MAH-ab', 52),
('Reab', 'arabic', 'unisex', 'variant spelling of Maab, place of return', 'A modern transliteration of Maab, carrying the same meaning of refuge and homecoming.', 'مآب', 'REE-ab', 30),
('Diaa', 'arabic', 'boy', 'light, radiance, splendor', 'From Arabic diyaa, "radiance and brightness", also written Zia or Dia. Distinguished and classic.', 'ضياء', 'dee-YAH', 60),
('Tala', 'arabic', 'girl', 'young palm tree, gentle and graceful', 'Arabic for the soft young palm sapling, symbol of grace and upward growth.', 'طلاء', 'TAH-lah', 62),
('Homam', 'arabic', 'boy', 'generous heart, great-hearted giver', 'From Arabic himam, noble-mindedness and openhanded courage. A strong honorific name.', 'همام', 'hoh-MAHM', 55),
('Hashem', 'arabic', 'boy', 'breaker of bread, generous feeder of others', 'The title of the Prophet''s great-grandfather Hashim, from hashama, "to crush bread for guests". Forever tied to generosity.', 'هاشم', 'HAH-shem', 72),
('Hisham', 'arabic', 'boy', 'generous, openhanded', 'Classic Arabic name meaning generosity, borne by Umayyad caliphs and the poet Hisham ibn al-Kalbi.', 'هشام', 'hee-SHAHM', 68),
('Yaman', 'arabic', 'boy', 'blessed, prosperous, of the right side (good fortune)', 'From the Arabic root yumn, "blessing and good fortune"; also the name of the land of Yemen, "the blessed south".', 'يمن', 'YAH-man', 58),
('Rukana', 'arabic', 'boy', 'steadfast, firm, unmoving in resolve', 'Name of the Prophet''s companion Rukana ibn Abd Yaghuth, famed for his strength and steadfastness.', 'ركانة', 'roo-KAH-nah', 38),
('Muhab', 'arabic', 'boy', 'of deep love, beloved', 'From the Arabic root mahabba, "love and affection". A tender, heartfelt name.', 'محب', 'moo-HAB', 45),
('Remaa', 'arabic', 'girl', 'white gazelle, graceful antelope', 'Expanded spelling of Rema, the gazelle that is a classic symbol of beauty in Arabic poetry.', 'ريم', 'REE-mah', 48),
('Rema', 'arabic', 'girl', 'white gazelle, striking beauty', 'From Arabic reem, the white gazelle celebrated by poets as the ideal of graceful beauty.', 'ريما', 'REH-mah', 66),
('Etaaf', 'arabic', 'girl', 'kindness, compassion, tenderness of heart', 'From Arabic itaat, gentleness and sympathetic kindness. Soft and warm in meaning.', 'إعطاف', 'et-TAHF', 35),
('Aghyad', 'arabic', 'boy', 'brave and noble youth, gallant man', 'From Arabic aghyad, plural of ghayd, "young manly courage and noble generosity".', 'أغياد', 'agh-YAD', 42),
('Ayham', 'arabic', 'boy', 'brave, lion-hearted, decisive', 'Pre-Islamic Arabic name meaning courageous and resolute, carried by poets and knights.', 'أيهام', 'eye-HAHM', 50),
('Sura', 'arabic', 'girl', 'star, constellation (the Pleiades), high-flying', 'From Arabic suraa, the Pleiades star cluster, a classic image of beauty and elevation in Arabic verse.', 'ثريا', 'SOO-rah', 46)
ON CONFLICT DO NOTHING;
SELECT count(*) FROM names;
