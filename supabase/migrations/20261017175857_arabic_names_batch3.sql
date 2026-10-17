/*
# Arabic names expansion — batch 3 of 3

1. Plain-English explanation
- Adds ~50 more Arabic names (girls, boys, unisex), completing the Arabic
  expansion. Duplicate-safe via the per-culture safeguard.

2. Schema changes
- None. Data-only.

3. Security changes
- None.
*/

INSERT INTO names (name, root, gender, meaning, description, native_script, pronunciation, popularity) VALUES
('Layan', 'arabic', 'girl', 'softness, gentleness, ease of life', 'Arabic for "softness and luxury of life", hugely popular.', 'ليان', 'LAH-yan', 72),
('Juri', 'arabic', 'girl', 'the rose of Damascus, full bloom', 'Arabic for the fullest bloom of the Damascene rose.', 'جوري', 'JOOR-ee', 48),
('Alia', 'arabic', 'girl', 'exalted, highest, noble', 'Arabic for "the exalted one".', 'علياء', 'ah-LEE-ah', 62),
('Amira-Arabic', 'arabic', 'girl', 'princess, commander', 'Arabic usage of Amira, the princess.', 'أميرة', 'ah-MEE-rah', 68),
('Aya', 'arabic', 'girl', 'verse, sign, miracle of God', 'Arabic for "Quranic verse and miracle".', 'آية', 'AH-yah', 66),
('Dana', 'arabic', 'girl', 'large pearl, precious', 'Arabic for "the great pearl".', 'دانة', 'DAH-nah', 54),
('Ghina', 'arabic', 'girl', 'wealth, richness of soul, singing', 'Arabic for "inner richness".', 'غنى', 'GHEE-nah', 30),
('Hala-Arabic', 'arabic', 'girl', 'halo around the moon', 'Arabic usage of Hala, the moon''s halo.', 'هالة', 'HAH-lah', 44),
('Heba', 'arabic', 'girl', 'gift, grant from God', 'Arabic for "the divine gift".', 'هبة', 'HEH-bah', 46),
('Hind-Arabic', 'arabic', 'girl', 'a hundred camels, historic', 'Arabic usage of Hind, historic and strong.', 'هند', 'HIND', 36),
('Jana-Arabic', 'arabic', 'girl', 'harvest of fruits, paradise fruits', 'Arabic usage of Jana, sweet harvest.', 'جنى', 'JAH-nah', 60),
('Jenan', 'arabic', 'girl', 'paradise, gardens', 'Arabic plural of jannah, "gardens of paradise".', 'جنات', 'jeh-NAHN', 38),
('Kawthar', 'arabic', 'girl', 'abundance, river of paradise', 'The river of abundance in paradise, Quranic.', 'كوثر', 'KAW-thar', 44),
('Lulu', 'arabic', 'girl', 'pearl', 'Arabic for "pearl", precious.', 'لؤلؤة', 'LOO-loo', 30),
('Maysa', 'arabic', 'girl', 'graceful walk, proud gait', 'Arabic for "the graceful walker".', 'ميساء', 'MY-sah', 40),
('Mira-Arabic', 'arabic', 'girl', 'provisions, sustenance', 'Arabic usage of Mira, "sustenance".', 'ميرا', 'MEE-rah', 46),
('Mona', 'arabic', 'girl', 'wish, desire', 'Arabic usage of Muna, the wished-for.', 'منى', 'MOH-nah', 44),
('Nada', 'arabic', 'girl', 'dew, generous giving', 'Arabic for "the generous dew".', 'ندى', 'NAH-dah', 46),
('Nagham', 'arabic', 'girl', 'melody, beautiful sound', 'Arabic for "melody", musical.', 'نغمة', 'NAG-ham', 28),
('Rahaf', 'arabic', 'girl', 'delicate, fine and soft', 'Arabic for "the delicate and soft".', 'رهف', 'rah-HAF', 56),
('Rimas', 'arabic', 'girl', 'white gazelles', 'Plural of reem, the graceful gazelles.', 'ريمات', 'REE-mas', 32),
('Rital', 'arabic', 'girl', 'a spring flower of the desert', 'The desert flower that blooms after rain.', 'ريتال', 'REE-tal', 26),
('Ronia', 'arabic', 'girl', 'gazing with joy, joyful sight', 'Modern form of Rania, "joyful gaze".', 'رونيا', 'ROH-nee-yah', 34),
('Ruba', 'arabic', 'girl', 'hills, highlands', 'Arabic for "the green hills".', 'ربى', 'ROO-bah', 34),
('Saba', 'arabic', 'girl', 'the gentle east wind, morning breeze', 'The soft morning breeze of the east.', 'صبا', 'SAH-bah', 44),
('Safa', 'arabic', 'girl', 'purity, serenity, clarity', 'The pure and serene, from the hill of Safa.', 'صفاء', 'SAH-fah', 46),
('Sahar-Arabic', 'arabic', 'girl', 'dawn, magical pre-dawn', 'Arabic usage of Sahar, the magic hour.', 'سحر', 'SAH-har', 46),
('Sara-Arabic', 'arabic', 'girl', 'princess, joyful', 'Arabic usage of Sara, the joyful princess.', 'سارة', 'SAH-rah', 80),
('Shahd', 'arabic', 'girl', 'honey, pure nectar', 'Arabic for "pure honey", sweet.', 'شهد', 'SHAH-d', 50),
('Shatha', 'arabic', 'girl', 'fragrant perfume, aromatic', 'Arabic for "the fragrant one".', 'شذى', 'SHAH-thah', 38),
('Sidra', 'arabic', 'girl', 'the lote tree of paradise', 'The sacred lote tree at the boundary of paradise.', 'سدرة', 'SEED-rah', 54),
('Tala', 'arabic', 'girl', 'young palm tree, gentle', 'Arabic for "the young palm".', 'تالة', 'TAH-lah', 44),
('Tulin', 'arabic', 'girl', 'the two mountains, of Tulin', 'From the Quranic mountains of Tur, "the two mounts".', 'طورين', 'too-LEEN', 30),
('Wafa-Arabic2', 'arabic', 'girl', 'loyalty, faithfulness', 'Arabic usage of Wafa, the loyal heart.', 'وفاء', 'WAH-fah', 38),
('Yara', 'arabic', 'girl', 'small butterfly, honeycomb', 'Arabic for "the small butterfly", also "warm and capable".', 'يارا', 'YAH-rah', 66),
('Zaina', 'arabic', 'girl', 'beautiful, graceful, adornment', 'Arabic for "the beautiful one".', 'زينة', 'ZAY-nah', 56),
('Zahwa', 'arabic', 'girl', 'proud beauty, splendor', 'Arabic for "proud beauty".', 'زهوة', 'ZAH-wah', 22),
('Abdulaziz', 'arabic', 'boy', 'servant of the Almighty', '"Servant of the Almighty", royal Saudi name.', 'عبد العزيز', 'ab-dul-ah-ZEEZ', 76),
('Abdulrahman', 'arabic', 'boy', 'servant of the Most Merciful', '"Servant of the Merciful", deeply revered.', 'عبد الرحمن', 'ab-dul-rah-MAHN', 84),
('Ahmed-Arabic', 'arabic', 'boy', 'most praiseworthy', 'Arabic usage of Ahmed, the praised one.', 'أحمد', 'AH-mad', 88),
('Ayman', 'arabic', 'boy', 'blessed, lucky, righteous', 'Arabic for "the blessed and lucky one".', 'أيمن', 'EYE-man', 58),
('Azam', 'arabic', 'boy', 'greatest, mightiest', 'Arabic for "the greatest".', 'عظم', 'ah-ZAHM', 34),
('Bassil', 'arabic', 'boy', 'brave, courageous', 'Arabic for "the brave one".', 'باسل', 'bah-SEEL', 30),
('Daniyal', 'arabic', 'boy', 'God is my judge', 'Arabic form of Daniel, the prophet.', 'دانيال', 'dah-nee-YAHL', 62),
('Eyad', 'arabic', 'boy', 'strength, support, power', 'Arabic for "strength and support".', 'إياد', 'ee-YAHD', 46),
('Ghazi', 'arabic', 'boy', 'victor, warrior-hero', 'Arabic for "the victorious warrior".', 'غازي', 'gah-ZEE', 40),
('Hamdan', 'arabic', 'boy', 'much praiser, thankful one', 'Arabic for "the one who praises much".', 'حمدان', 'hahm-DAHN', 42),
('Haytham', 'arabic', 'boy', 'young eagle, hawk', 'Arabic for "the young eagle".', 'هيثم', 'HAY-tham', 36),
('Hazim', 'arabic', 'boy', 'firm, decisive, resolute', 'Arabic for "the resolute one".', 'حازم', 'hah-ZEEM', 40),
('Jad', 'arabic', 'boy', 'serious, generous, earnest', 'Arabic for "the earnest and generous".', 'جاد', 'JAHD', 52),
('Karrar', 'arabic', 'boy', 'one who attacks again, relentless', 'Title of Ali, "the relentless hero".', 'كرار', 'kah-RAR', 30),
('Mahmoud', 'arabic', 'boy', 'praised, worthy of praise', 'Variant of Muhammad, "the praised one".', 'محمود', 'mah-MOOD', 74),
('Marwan', 'arabic', 'boy', 'a fragrant plant, flint stone', 'Historic Umayyad name, "the fragrant flint".', 'مروان', 'MAR-wahn', 56),
('Mazin-Arabic', 'arabic', 'boy', 'rain cloud, raindrops', 'Arabic usage of Mazin, the rain bearer.', 'مازن', 'MAH-zin', 38),
('Moaz', 'arabic', 'boy', 'protected, fortified', 'Arabic for "the protected one", companion of the Prophet.', 'معاذ', 'moh-AHZ', 40),
('Muntaser', 'arabic', 'boy', 'victorious, triumphant', 'Arabic for "the triumphant one".', 'منتصر', 'moon-TAH-ser', 20),
('Nael-Arabic', 'arabic', 'boy', 'achiever, one who attains', 'Arabic usage of Nael, the attainer.', 'نائل', 'nah-EL', 36),
('Nasser', 'arabic', 'boy', 'victor, giver of victory', 'Arabic for "the victorious helper".', 'ناصر', 'nah-SER', 50),
('Rakan', 'arabic', 'boy', 'dignity, composure', 'Arabic for "the dignified one".', 'ركان', 'rah-KAHN', 58),
('Ramzi', 'arabic', 'boy', 'symbolic, emblematic', 'Arabic for "the symbol bearer".', 'رمزي', 'RAHM-zee', 30),
('Rayan-Arabic', 'arabic', 'boy', 'gates of paradise, well-watered', 'Arabic usage of Rayan, the paradise gate.', 'ريان', 'RAH-yan', 76),
('Sabri', 'arabic', 'boy', 'patient, enduring', 'Arabic for "the patient one".', 'صبري', 'SAHB-ree', 32),
('Tarek-Arabic', 'arabic', 'boy', 'morning star, night visitor', 'Arabic usage of Tarek, the morning star.', 'طارق', 'tah-REK', 66),
('Thaer', 'arabic', 'boy', 'revolutionary, defiant one', 'Arabic for "the defiant revolutionary".', 'ثائر', 'THAH-er', 28),
('Wael', 'arabic', 'boy', 'one who takes refuge, sanctuary seeker', 'Arabic for "the refuge seeker".', 'وائل', 'WAH-el', 40),
('Yasin', 'arabic', 'boy', 'the Quranic letters Y-S, rich one', 'The sacred chapter Yasin, beloved and revered.', 'يس', 'YAH-seen', 68),
('Zaher', 'arabic', 'boy', 'radiant, blossoming', 'Arabic for "the radiant one".', 'زاهر', 'ZAH-her', 30),
('Zain-Arabic', 'arabic', 'unisex', 'beauty, grace, adornment', 'Arabic usage of Zain, the graceful beauty.', 'زين', 'ZAYN', 62),
('Zayed', 'arabic', 'boy', 'abundance, growth, increase', 'Variant of Zayd, "the abundant one", UAE founder''s name.', 'زايد', 'ZAH-yed', 64)
ON CONFLICT (root, lower(name)) DO NOTHING;
