/*
# Turkish names expansion — batch 3 of 3

1. Plain-English explanation
- Adds ~30 more Turkish names, completing the Turkish expansion.
  Duplicate-safe via the per-culture safeguard.

2. Schema changes
- None. Data-only.

3. Security changes
- None.
*/

INSERT INTO names (name, root, gender, meaning, description, native_script, pronunciation, popularity) VALUES
('Adalet', 'turkish', 'girl', 'justice, fairness', 'Turkish for "justice", principled and rare.', 'Adalet', 'ah-dah-LET', 22),
('Adile', 'turkish', 'girl', 'just, fair', 'Turkish feminine of Adil, "the just one".', 'Adile', 'ah-dee-LEH', 24),
('Ahenk', 'turkish', 'girl', 'harmony, melodious accord', 'Turkish for "harmony", musical and rare.', 'Ahenk', 'ah-HENK', 14),
('Aylin-Turkish', 'turkish', 'girl', 'of the moon', 'Turkish usage of Aylin, the moonlit one.', 'Aylin', 'EYE-lin', 76),
('Ayşegül', 'turkish', 'girl', 'living rose', 'Compound of Ayşe and gül, "the living rose".', 'Ayşegül', 'eye-seh-GOOL', 36),
('Bahar', 'turkish', 'girl', 'spring, springtime', 'Persian-Turkish for "spring", fresh and blooming.', 'Bahar', 'bah-HAR', 48),
('Beril', 'turkish', 'girl', 'beryl gemstone, sea-green crystal', 'Turkish for the beryl gem, crystalline and bright.', 'Beril', 'beh-REEL', 34),
('Ceyda', 'turkish', 'girl', 'graceful, beautiful and tall', 'Turkish for "graceful beauty".', 'Ceyda', 'jay-DAH', 52),
('Çiğdem', 'turkish', 'girl', 'crocus flower, early spring bloom', 'The crocus that blooms through snow, resilient.', 'Çiğdem', 'cheeg-DEM', 30),
('Damla', 'turkish', 'girl', 'drop, water drop', 'Turkish for "drop of water", pure and simple.', 'Damla', 'DAHM-lah', 50),
('Dilara', 'turkish', 'girl', 'delighter of hearts, beloved', 'Persian, "she who delights the heart".', 'Dilara', 'dee-lah-RAH', 60),
('Ece-Turkish', 'turkish', 'girl', 'queen, ruler', 'Turkish usage of Ece, the queenly one.', 'Ece', 'eh-JEH', 54),
('Ekin', 'turkish', 'unisex', 'harvest, crop, grain', 'Turkish for "harvest", fertile and grounded.', 'Ekin', 'eh-KEEN', 46),
('Elçin', 'turkish', 'unisex', 'happy news, good tidings', 'Turkish for "joyful news".', 'Elçin', 'el-CHIN', 28),
('Elvin', 'turkish', 'unisex', 'noble friend, old friend', 'Old English via Turkish usage, "noble friend".', 'Elvin', 'el-VEEN', 26),
('Esin', 'turkish', 'girl', 'inspiration, evening breeze', 'Turkish/Arabic for "inspiration".', 'Esin', 'eh-SIN', 32),
('Gamze', 'turkish', 'girl', 'coquettish glance, dimple', 'Turkish for "the dimple and playful glance".', 'Gamze', 'GAHM-zeh', 32),
('Gonca', 'turkish', 'girl', 'flower bud, rosebud', 'Turkish for "rosebud", blooming promise.', 'Gonca', 'gon-JAH', 34),
('Gözde', 'turkish', 'girl', 'favorite, beloved of the eye', 'Turkish for "the favorite", cherished.', 'Gözde', 'guz-DEH', 40),
('Gülbahar', 'turkish', 'girl', 'rose spring, spring rose', 'Compound of gül "rose" and bahar "spring".', 'Gülbahar', 'gool-bah-HAR', 22),
('Hale', 'turkish', 'girl', 'halo, aura of light', 'Turkish/Arabic for "the halo".', 'Hale', 'hah-LEH', 30),
('Hande', 'turkish', 'girl', 'smile, laughter', 'Persian for "smile", joyful and light.', 'Hande', 'hahn-DEH', 40),
('Irmak', 'turkish', 'girl', 'river', 'Turkish for "river", flowing and fresh.', 'Irmak', 'eer-MAHK', 44),
('Kumsal', 'turkish', 'girl', 'sandy shore, beach', 'Turkish for "the sandy beach", summery.', 'Kumsal', 'koom-SAHL', 38),
('Lale', 'turkish', 'girl', 'tulip', 'Turkish for "tulip", the flower of Turkey itself.', 'Lale', 'lah-LEH', 44),
('Melek', 'turkish', 'girl', 'angel', 'Turkish/Arabic for "angel", heavenly.', 'Melek', 'meh-LEK', 54),
('Nergis', 'turkish', 'girl', 'narcissus flower', 'Turkish for the narcissus, springtime bloom.', 'Nergis', 'ner-GEES', 30),
('Özlem', 'turkish', 'girl', 'longing, yearning', 'Turkish for "deep longing", poetic and tender.', 'Özlem', 'uz-LEM', 40),
('Pınar', 'turkish', 'girl', 'spring, fountain of water', 'Turkish for "the spring fountain", fresh.', 'Pınar', 'puh-NAR', 46),
('Sevval', 'turkish', 'girl', 'the month of Shawwal', 'The Islamic month following Ramadan, blessed.', 'Şevval', 'shev-VAHL', 32),
('Sude-Nur', 'turkish', 'girl', 'water and light', 'Compound of Sude and Nur, "water and light".', 'Sude-Nur', 'SOO-deh-NOOR', 30),
('Şule', 'turkish', 'girl', 'flame, blaze of light', 'Turkish for "flame", luminous.', 'Şule', 'SHOO-leh', 28),
('Tulay', 'turkish', 'girl', 'tulle veil, gauzy and light', 'Turkish for "gauzy tulle", delicate.', 'Tülay', 'too-LYE', 26),
('Ülkü', 'turkish', 'girl', 'ideal, aspiration', 'Turkish for "the ideal", purposeful.', 'Ülkü', 'ool-KOO', 30),
('Yosun', 'turkish', 'girl', 'seaweed, water moss', 'Turkish for "water moss", rare and nature-fresh.', 'Yosun', 'yoh-SOON', 12),
('Zümrüt', 'turkish', 'girl', 'emerald gemstone', 'Turkish for "emerald", precious green gem.', 'Zümrüt', 'zoom-RUT', 30)
ON CONFLICT (root, lower(name)) DO NOTHING;
