/*
# Arabic names expansion — batch 1 of 3

1. Plain-English explanation
- Adds ~55 Arabic names (girls first), each with meaning, description,
  native script, pronunciation, and popularity. Duplicate-safe.

2. Schema changes
- None. Data-only.

3. Security changes
- None.
*/

INSERT INTO names (name, root, gender, meaning, description, native_script, pronunciation, popularity) VALUES
('Fatima', 'arabic', 'girl', 'one who abstains, captivating pure one', 'Daughter of the Prophet, revered as a leader of women.', 'فاطمة', 'FAH-tee-mah', 88),
('Amina', 'arabic', 'girl', 'trustworthy, safe, honest', 'From amana, "trust", borne by the Prophet''s mother. Trusted.', 'أمينة', 'ah-MEE-nah', 80),
('Khadija', 'arabic', 'girl', 'early-born, trustworthy', 'First wife of the Prophet, first Muslim. Revered merchant.', 'خديجة', 'kah-DEE-jah', 78),
('Zaynab', 'arabic', 'girl', 'fragrant flower, precious ornament', 'Borne by the Prophet''s daughter, noble and strong.', 'زينب', 'ZAY-nab', 82),
('Ruqayyah', 'arabic', 'girl', 'gentle, spell, rising higher', 'Daughter of the Prophet, gentle and revered.', 'رقية', 'roo-KAY-yah', 56),
('Sumaya', 'arabic', 'girl', 'high above, elevated', 'First martyr of Islam, elevated in courage.', 'سمية', 'soo-MAY-yah', 60),
('Jamila', 'arabic', 'girl', 'beautiful, graceful', 'Arabic for "beautiful", classic and graceful.', 'جميلة', 'jah-MEE-lah', 64),
('Habiba', 'arabic', 'girl', 'beloved, darling', 'Arabic for "the beloved one", warm and dear.', 'حبيبة', 'hah-BEE-bah', 66),
('Aaliyah', 'arabic', 'girl', 'high, exalted, rising', 'From ala, "to ascend", exalted and musical.', 'عالية', 'ah-LEE-yah', 72),
('Inaya', 'arabic', 'girl', 'care, concern, divine providence', 'Arabic for "God''s care", tender and protected.', 'عناية', 'in-ah-YAH', 58),
('Safiya', 'arabic', 'girl', 'pure, sincere friend, best friend', 'From safi, "pure", borne by the Prophet''s aunt.', 'صفية', 'sah-FEE-yah', 62),
('Ayla-Arabic', 'arabic', 'girl', 'moonlight, halo', 'Cross-cultural moonlight name, radiant.', 'آيلة', 'EYE-lah', 54),
('Asma', 'arabic', 'girl', 'loftier, more sublime', 'Daughter of Abu Bakr, "the lofty one".', 'أسماء', 'AS-mah', 58),
('Balqis', 'arabic', 'girl', 'queen of Sheba', 'The legendary Queen of Sheba, royal and wise.', 'بلقيس', 'bal-KEES', 44),
('Dina', 'arabic', 'girl', 'religion, judgment, valley', 'Arabic form of Dinah, "the judged one".', 'دينا', 'DEE-nah', 50),
('Fadwa', 'arabic', 'girl', 'self-sacrifice, ransom', 'Arabic for "self-sacrifice", borne by poet Fadwa Tuqan.', 'فدوى', 'FAD-wah', 40),
('Ghada', 'arabic', 'girl', 'graceful young woman, slender', 'Arabic for "the graceful young girl".', 'غادة', 'GAH-dah', 44),
('Hala', 'arabic', 'girl', 'halo around the moon', 'Arabic for the moon''s halo, luminous.', 'هالة', 'HAH-lah', 46),
('Hind', 'arabic', 'girl', 'a hundred camels, India', 'Historic Arabic name of tribes and queens.', 'هند', 'HIND', 38),
('Itidal', 'arabic', 'girl', 'moderation, balance', 'Arabic for "balance and moderation".', 'اعتدال', 'it-TAH-dal', 20),
('Jumana', 'arabic', 'girl', 'silver pearl', 'Arabic for "the silver pearl", precious.', 'جمانة', 'joo-MAH-nah', 48),
('Lamya', 'arabic', 'girl', 'with lovely dark lips, radiant complexion', 'Classical Arabic beauty name, poetic.', 'لمياء', 'LAHM-yah', 38),
('Maha', 'arabic', 'girl', 'wild cow, beautiful dark eyes', 'Classical for large beautiful eyes, poetic.', 'مها', 'MAH-hah', 46),
('Manar', 'arabic', 'girl', 'lighthouse, guiding light', 'Arabic for "the beacon", guiding light.', 'منار', 'mah-NAR', 50),
('Muna', 'arabic', 'girl', 'wish, desire', 'Arabic for "the wish", hoped-for.', 'منى', 'MOO-nah', 44),
('Nadira', 'arabic', 'girl', 'rare, precious', 'Arabic for "the rare one", unique.', 'نادرة', 'nah-DEE-rah', 32),
('Najwa', 'arabic', 'girl', 'secret conversation, confidential whisper', 'Arabic for "the intimate whisper".', 'نجوى', 'NAJ-wah', 42),
('Nawal', 'arabic', 'girl', 'gift, blessing, donation', 'Arabic for "the gift".', 'نوال', 'nah-WAHL', 46),
('Rabia', 'arabic', 'girl', 'spring, fourth-born', 'Arabic for "springtime", also borne by mystic Rabia al-Adawiyya.', 'رابعة', 'rah-BEE-ah', 44),
('Reem', 'arabic', 'girl', 'white gazelle', 'Arabic for the graceful white gazelle.', 'ريم', 'REEM', 54),
('Sahar', 'arabic', 'girl', 'dawn, just before sunrise', 'Arabic for "the magic of dawn".', 'سحر', 'SAH-har', 48),
('Shadia', 'arabic', 'girl', 'singer with a beautiful voice', 'Arabic for "the melodious singer".', 'شادية', 'SHAH-dee-yah', 36),
('Suhaila', 'arabic', 'girl', 'smooth, level, of the star Suhail', 'Feminine of Suhail, the southern star.', 'سهيلة', 'soo-HAY-lah', 28),
('Thuraya', 'arabic', 'girl', 'the Pleiades star cluster', 'Arabic for the Pleiades, celestial cluster.', 'الثريا', 'thoo-RAY-yah', 36),
('Wafa', 'arabic', 'girl', 'loyalty, faithfulness', 'Arabic for "loyalty", steadfast.', 'وفاء', 'WAH-fah', 42),
('Widad', 'arabic', 'girl', 'love, friendship', 'Arabic for "affection and love".', 'وداد', 'wee-DAHD', 28),
('Yumna', 'arabic', 'girl', 'good fortune, blessed, right side', 'Arabic for "blessed and fortunate".', 'يمنى', 'YOOM-nah', 48),
('Zahra-Arabic', 'arabic', 'girl', 'flower, radiant', 'Arabic usage of Zahra, radiant bloom.', 'زهرة', 'ZAH-rah', 66),
('Zain', 'arabic', 'unisex', 'beauty, grace, adornment', 'Arabic for "beauty and grace".', 'زين', 'ZAYN', 64),
('Salwa', 'arabic', 'girl', 'quail, solace, comfort', 'Arabic for the quail of comfort in the desert.', 'سلوى', 'SAL-wah', 36),
('Sawsan', 'arabic', 'girl', 'lily of the valley', 'Arabic for the fragrant lily flower.', 'سوسن', 'SAW-san', 32),
('Wafa-Arabic', 'arabic', 'girl', 'loyalty, faithfulness', 'Arabic usage of Wafa, faithful heart.', 'وفاء', 'WAH-fah', 40),
('Amal', 'arabic', 'girl', 'hope, aspiration', 'Arabic for "hope", bright and hopeful.', 'أمل', 'AH-mal', 58),
('Bahija', 'arabic', 'girl', 'happy, joyful', 'Arabic for "the joyful one".', 'بهيجة', 'bah-HEE-jah', 22),
('Bushra', 'arabic', 'girl', 'good news, glad tidings', 'Arabic for "good news", a Quranic word.', 'بشرى', 'BUSH-rah', 50),
('Dua', 'arabic', 'girl', 'prayer, supplication', 'Arabic for "the prayer", devotional.', 'دعاء', 'doo-AH', 56),
('Farida', 'arabic', 'girl', 'unique, precious gem', 'Arabic for "the unique one".', 'فريدة', 'fah-REE-dah', 48),
('Ghalia', 'arabic', 'girl', 'precious, expensive, beloved', 'Arabic for "precious and beloved".', 'غالية', 'gah-LEE-yah', 26),
('Hana-Arabic', 'arabic', 'girl', 'happiness, bliss', 'Arabic usage of Hana, blissful contentment.', 'هناء', 'HAH-nah', 62),
('Ilham', 'arabic', 'girl', 'inspiration, intuition', 'Arabic for "divine inspiration".', 'إلهام', 'il-HAHM', 36),
('Ibtisam', 'arabic', 'girl', 'smile, smiling', 'Arabic for "the smile".', 'ابتسام', 'ib-tee-SAHM', 34),
('Latifa', 'arabic', 'girl', 'gentle, kind, subtle', 'Arabic for "the gentle one".', 'لطيفة', 'lah-TEE-fah', 40),
('Maimuna', 'arabic', 'girl', 'blessed, fortunate', 'Arabic for "the blessed one", wife of the Prophet.', 'ميمونة', 'my-MOO-nah', 34),
('Marwa', 'arabic', 'girl', 'a hill in Mecca, flint stone', 'The sacred hill of Marwa, blessed ground.', 'مروة', 'MAR-wah', 56),
('Nabila', 'arabic', 'girl', 'noble, high-born', 'Arabic for "the noble one".', 'نبيلة', 'nah-BEE-lah', 42),
('Rania-Arabic', 'arabic', 'girl', 'queenly gaze, gazing with wonder', 'Arabic usage of Rania, the noble gaze.', 'رانية', 'RAH-nee-yah', 58),
('Sabrina', 'arabic', 'girl', 'patient, enduring', 'Cross-cultural, "the patient one".', 'صابرينة', 'sah-BREE-nah', 36),
('Tasneem', 'arabic', 'girl', 'a spring in paradise', 'The spring of paradise, Quranic and sweet.', 'تسنيم', 'tas-NEEM', 52)
ON CONFLICT (root, lower(name)) DO NOTHING;
