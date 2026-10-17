/*
# Turkish names expansion — batch 1 of 3

1. Plain-English explanation
- Adds ~55 Turkish names (girls first), each with meaning, description,
  pronunciation, and popularity. Duplicate-safe via the per-culture safeguard.

2. Schema changes
- None. Data-only.

3. Security changes
- None.
*/

INSERT INTO names (name, root, gender, meaning, description, native_script, pronunciation, popularity) VALUES
('Aysel', 'turkish', 'girl', 'moon flood, moonlike stream', 'From ay "moon" and sel "flood", the moon''s radiant flow.', 'Aysel', 'eye-SEL', 56),
('Aydan', 'turkish', 'girl', 'from the moon, moonlike', 'From ay "moon", "made of moonlight".', 'Aydan', 'eye-DAHN', 50),
('Aysu', 'turkish', 'girl', 'moon water, moonlit water', 'From ay "moon" and su "water", luminous water.', 'Aysu', 'eye-SOO', 44),
('Ayse', 'turkish', 'girl', 'alive, living, prosperous', 'Turkish form of Aisha, among the most classic Turkish names.', 'Ayşe', 'eye-SEH', 82),
('Fatma', 'turkish', 'girl', 'one who abstains, pure', 'Turkish form of Fatimah, revered and classic.', 'Fatma', 'faht-MAH', 78),
('Emine', 'turkish', 'girl', 'trustworthy, safe, faithful', 'Turkish form of Amina, "trustworthy".', 'Emine', 'eh-mee-NEH', 66),
('Zehra', 'turkish', 'girl', 'radiant, shining, flower', 'Turkish form of Zahra, "the radiant one".', 'Zehra', 'ZEH-rah', 72),
('Hatice', 'turkish', 'girl', 'early born, premature one', 'Turkish form of Khadija, revered and classic.', 'Hatice', 'hah-TEE-juh', 62),
('Merve', 'turkish', 'girl', 'marjoram herb, a hill in paradise', 'Turkish form of Marwa, the sacred hill. Gentle and common.', 'Merve', 'MER-veh', 64),
('Esra', 'turkish', 'girl', 'night journey, swift traveler', 'Turkish form of Isra, the Prophet''s night journey.', 'Esra', 'es-RAH', 60),
('Sude', 'turkish', 'girl', 'happiness, water, bliss', 'Turkish, possibly from Persian for water, "bliss". Popular and modern.', 'Sude', 'SOO-deh', 70),
('Nisa', 'turkish', 'girl', 'woman, the women''s chapter', 'From the Quranic chapter "An-Nisa", graceful and Quranic.', 'Nisa', 'nee-SAH', 66),
('Elif-Nur', 'turkish', 'girl', 'slender and light', 'Compound of Elif and Nur, "slender light".', 'Elif-Nur', 'eh-LEEF-NOOR', 40),
('Betul', 'turkish', 'girl', 'virgin, pure maiden', 'Turkish form of Batul, "pure and virgin".', 'Betül', 'beh-TOOL', 56),
('Cansu', 'turkish', 'girl', 'life water, soul water', 'From can "soul, life" and su "water", the water of life.', 'Cansu', 'JAHN-soo', 54),
('Ebru-Turkish', 'turkish', 'girl', 'marbling art, cloud', 'Turkish usage of Ebru, artistic heritage.', 'Ebru', 'eh-BROO', 38),
('Eslem', 'turkish', 'girl', 'cutting roses, the act of gleaning', 'From Arabic, "gleaning roses", modern and poetic.', 'Eslem', 'es-LEM', 48),
('Azra', 'turkish', 'girl', 'pure, virgin, maiden', 'Turkish from Arabic azra, "pure maiden". Modern and lovely.', 'Azra', 'az-RAH', 62),
('Nehir-Turkish', 'turkish', 'girl', 'river, stream', 'Turkish usage of Nehir, flowing gently.', 'Nehir', 'neh-HEER', 60),
('Melis', 'turkish', 'girl', 'honey bee, sweet as honey', 'From Greek Melissa via Turkish, "honey bee".', 'Melis', 'meh-LEES', 64),
('Duru', 'turkish', 'girl', 'clear, lucid, still', 'Turkish for "clear and still", like calm water. Serene.', 'Duru', 'doo-ROO', 58),
('Ecrin', 'turkish', 'girl', 'reward, recompense', 'Turkish form of Aksin/Ecrin, "divine reward".', 'Ecrin', 'ej-REEN', 46),
('Öykü', 'turkish', 'girl', 'story, tale', 'Turkish for "story", narrative and charming.', 'Öykü', 'oy-KOO', 52),
('Duygu', 'turkish', 'girl', 'emotion, feeling', 'Turkish for "emotion and feeling", tender and deep.', 'Duygu', 'doy-GOO', 44),
('Sevgi', 'turkish', 'girl', 'love, affection', 'Turkish for "love", warm and giving.', 'Sevgi', 'sev-GEE', 40),
('Umut', 'turkish', 'unisex', 'hope', 'Turkish for "hope", bright and unisex.', 'Umut', 'oo-MOOT', 52),
('Ela', 'turkish', 'girl', 'hazel, flame, bright', 'Turkish for hazel-eyed, or the flame of a candle.', 'Ela', 'eh-LAH', 56),
('Naz', 'turkish', 'girl', 'coy charm, grace, pride', 'Turkish/Persian for "coy grace", short and charming.', 'Naz', 'NAHZ', 42),
('Nazli', 'turkish', 'girl', 'coy, charming, delicate', 'From naz "coy charm", "charming one".', 'Nazlı', 'naz-LUH', 46),
('Seher', 'turkish', 'girl', 'dawn, daybreak', 'Turkish from Persian sahar, "the dawn".', 'Seher', 'seh-HER', 40),
('Sultan', 'turkish', 'girl', 'sultana, ruler, sovereign', 'The feminine sovereign, regal and historic.', 'Sultan', 'sool-TAHN', 38),
('Ayla', 'turkish', 'girl', 'moonlight, halo of the moon', 'Turkish for "moonlight", radiant and popular.', 'Ayla', 'EYE-lah', 68),
('Alev', 'turkish', 'girl', 'flame, fire', 'Turkish for "flame", fierce and bright.', 'Alev', 'ah-LEV', 34),
('Ipek', 'turkish', 'girl', 'silk', 'Turkish for "silk", smooth and precious.', 'İpek', 'ee-PEK', 48),
('Nur', 'turkish', 'girl', 'light, radiance', 'Turkish/Arabic for "light", luminous.', 'Nur', 'NOOR', 62),
('Nursena', 'turkish', 'girl', 'light and joy, bright gladness', 'Compound of nur "light" and sena "praise/joy".', 'Nursena', 'noor-seh-NAH', 36),
('Sena', 'turkish', 'girl', 'graceful, praised, army', 'Modern Turkish name from Arabic, "grace and praise".', 'Sena', 'seh-NAH', 60),
('Yaren', 'turkish', 'girl', 'close friend, beloved companion', 'Turkish/Persian for "the dearest friend", warm and modern.', 'Yaren', 'YAH-ren', 58),
('Yağmur', 'turkish', 'unisex', 'rain', 'Turkish for "rain", fresh and beloved for both genders.', 'Yağmur', 'YAH-moor', 62),
('Ceren-Turkish', 'turkish', 'girl', 'gazelle, graceful', 'Turkish usage of Ceren, gracefully swift.', 'Ceren', 'JEH-ren', 50),
('Zehra-Nur', 'turkish', 'girl', 'radiant light', 'Compound of Zehra and Nur, "radiant light".', 'Zehra-Nur', 'ZEH-rah-NOOR', 34),
('Simge', 'turkish', 'girl', 'symbol, sign, emblem', 'Turkish for "symbol", unique and modern.', 'Simge', 'seem-GEH', 36),
('Sevil', 'turkish', 'girl', 'be loved, beloved', 'Turkish, "may you be loved", tender imperative.', 'Sevil', 'seh-VEEL', 30),
('Sevim', 'turkish', 'girl', 'lovable, charming', 'Turkish for "lovable", sweet and vintage.', 'Sevim', 'seh-VEEM', 32),
('Gülay', 'turkish', 'girl', 'rose moon, moon of roses', 'Compound of gül "rose" and ay "moon", "moon of roses".', 'Gülay', 'goo-LYE', 30),
('Gülce', 'turkish', 'girl', 'of roses, rosy', 'From gül "rose", "of the rose".', 'Gülce', 'gool-JEH', 28),
('Gülcan', 'turkish', 'girl', 'rose soul, dear life', 'Compound of gül "rose" and can "soul", "rose soul".', 'Gülcan', 'gool-JAHN', 34),
('Gülizar', 'turkish', 'girl', 'rosy-cheeked, of roses', 'Persian-Turkish, "rosy and lovely".', 'Gülizar', 'goo-lee-ZAR', 20),
('Hilal', 'turkish', 'unisex', 'crescent moon', 'Arabic for "crescent", symbol on the Turkish flag.', 'Hilal', 'hee-LAHL', 46),
('Bilge', 'turkish', 'unisex', 'wise, sage, learned', 'Old Turkish for "the wise one", borne by a khagan.', 'Bilge', 'beel-GEH', 40),
('Ilayda', 'turkish', 'girl', 'water nymph, of water', 'From the water nymph of mythology, lyrical and modern.', 'İlayda', 'ee-LYE-dah', 56),
('Iclal', 'turkish', 'girl', 'glory, honor, magnificence', 'Arabic for "glory and honor".', 'İclal', 'ich-LAHL', 24),
('Selin-Turkish', 'turkish', 'girl', 'flowing water, serene stream', 'Turkish usage of Selin, cool stream.', 'Selin', 'seh-LEEN', 64),
('Beyza', 'turkish', 'girl', 'very white, pure white', 'Arabic for "pure white", clean and bright.', 'Beyza', 'BAY-zah', 50),
('Tuana', 'turkish', 'girl', 'the rain coat, born of rain', 'Modern Turkish, possibly "rain-born", fresh and lyrical.', 'Tuana', 'too-AH-nah', 54)
ON CONFLICT (root, lower(name)) DO NOTHING;
