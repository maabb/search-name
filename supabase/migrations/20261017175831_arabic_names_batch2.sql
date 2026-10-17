/*
# Arabic names expansion — batch 2 of 3

1. Plain-English explanation
- Adds ~55 Arabic boys'' names, duplicate-safe via the per-culture safeguard.

2. Schema changes
- None. Data-only.

3. Security changes
- None.
*/

INSERT INTO names (name, root, gender, meaning, description, native_script, pronunciation, popularity) VALUES
('Abdullah', 'arabic', 'boy', 'servant of God', '"Servant of God", the name of the Prophet''s father, deeply revered.', 'عبد الله', 'ab-DOOL-lah', 92),
('Omar-Arabic', 'arabic', 'boy', 'flourishing life, long-lived', 'Arabic usage of Omar, flourishing.', 'عمر', 'OH-mar', 84),
('Hamza', 'arabic', 'boy', 'lion, strong and steadfast', 'The Prophet''s uncle, "the lion of God".', 'حمزة', 'HAHM-zah', 80),
('Bilal-Arabic', 'arabic', 'boy', 'refreshing water', 'Arabic usage of Bilal, the first muezzin.', 'بلال', 'bee-LAHL', 70),
('Yousef', 'arabic', 'boy', 'God increases', 'Arabic spelling of Joseph, the beautiful prophet.', 'يوسف', 'YOO-sef', 86),
('Ismail-Arabic', 'arabic', 'boy', 'God will hear', 'Arabic usage of Ismail, the prophet.', 'إسماعيل', 'is-mah-EEL', 72),
('Ishaq', 'arabic', 'boy', 'he laughs, one who laughs', 'Arabic form of Isaac, the laughing prophet.', 'إسحاق', 'is-HAHK', 60),
('Yahya', 'arabic', 'boy', 'he lives, alive', 'Arabic form of John the Baptist, "he who lives".', 'يحيى', 'YAH-hyah', 74),
('Musa', 'arabic', 'boy', 'saved from water, drawn out', 'Arabic form of Moses, the prophet of the parted sea.', 'موسى', 'MOO-sah', 78),
('Harun', 'arabic', 'boy', 'mountain of strength, exalted', 'Arabic form of Aaron, brother of Musa.', 'هارون', 'hah-ROON', 66),
('Suleiman', 'arabic', 'boy', 'man of peace', 'Arabic form of Solomon, the wise king.', 'سليمان', 'soo-lay-MAHN', 72),
('Dawoud', 'arabic', 'boy', 'beloved', 'Arabic form of David, the psalmist king.', 'داود', 'dah-WOOD', 64),
('Zakariya', 'arabic', 'boy', 'God remembers', 'Arabic form of Zechariah, "God remembers".', 'زكريا', 'zak-ah-REE-yah', 58),
('Idris', 'arabic', 'boy', 'interpreter, studious one', 'The prophet Idris, "the studious one".', 'إدريس', 'id-REES', 62),
('Nuh', 'arabic', 'boy', 'rest, comfort', 'Arabic form of Noah, the ark builder.', 'نوح', 'NOOH', 66),
('Saleh', 'arabic', 'boy', 'righteous, good, pious', 'The prophet Saleh, "the righteous one".', 'صالح', 'SAH-leh', 68),
('Hud', 'arabic', 'boy', 'returning to God, guidance', 'The prophet Hud, the guide.', 'هود', 'HOOD', 40),
('Luqman', 'arabic', 'boy', 'wise sage of the Quran', 'The wise sage of the Quran, full of counsel.', 'لقمان', 'look-MAHN', 52),
('Talha', 'arabic', 'boy', 'a lush green tree of the desert', 'Companion of the Prophet, "the green tree".', 'طلحة', 'TAL-hah', 50),
('Zubair', 'arabic', 'boy', 'strong, wise, mountain strength', 'Companion of the Prophet, "the strong one".', 'الزبير', 'zoo-BAIR', 48),
('Saad', 'arabic', 'boy', 'good fortune, felicity', 'Arabic for "good fortune", companion of the Prophet.', 'سعد', 'SAHD', 56),
('Anas', 'arabic', 'boy', 'affection, friendliness', 'Companion of the Prophet, "the friendly one".', 'أنس', 'AH-nas', 54),
('Osama', 'arabic', 'boy', 'lion, king of beasts', 'Arabic for "the lion".', 'أسامة', 'oo-SAH-mah', 44),
('Faisal', 'arabic', 'boy', 'decisive judge, one who separates truth', 'Arabic for "the resolute judge", royal name.', 'فيصل', 'fay-SAHL', 58),
('Fahad', 'arabic', 'boy', 'leopard, swift wild cat', 'Arabic for "the leopard", swift and strong.', 'فهد', 'FAH-had', 60),
('Majid', 'arabic', 'boy', 'glorious, noble, magnificent', 'Arabic for "the glorious one", divine name.', 'ماجد', 'mah-JEED', 50),
('Nabil', 'arabic', 'boy', 'noble, high-born', 'Arabic for "the noble one".', 'نبيل', 'nah-BEEL', 52),
('Waleed', 'arabic', 'boy', 'newborn child', 'Arabic for "the newborn".', 'وليد', 'wah-LEED', 50),
('Ziyad', 'arabic', 'boy', 'growth, abundance, increase', 'Arabic for "the growing one".', 'زياد', 'zee-YAHD', 44),
('Adnan', 'arabic', 'boy', 'settler, one who resides', 'Legendary ancestor of the northern Arabs.', 'عدنان', 'ad-NAHN', 62),
('Qasim', 'arabic', 'boy', 'divider, distributor of goods', '"The divider of good", son of the Prophet.', 'قاسم', 'kah-SEEM', 54),
('Ammar', 'arabic', 'boy', 'long-lived, builder of nations', 'Companion of the Prophet, "the long-lived builder".', 'عمار', 'AH-mar', 58),
('Hussein', 'arabic', 'boy', 'handsome, beautiful, good', 'Grandson of the Prophet, deeply revered.', 'حسين', 'hoo-SAYN', 82),
('Abbas', 'arabic', 'boy', 'stern lion, frowning lion', 'Uncle of the Prophet, "the lion".', 'عباس', 'ab-BAHS', 60),
('Salman', 'arabic', 'boy', 'safe, secure, peaceful', 'Companion of the Prophet, "the safe one".', 'سلمان', 'sal-MAHN', 62),
('Suhail', 'arabic', 'boy', 'the southern star, smooth', 'Name of the bright southern star Canopus.', 'سهيل', 'soo-HAYL', 48),
('Waseem', 'arabic', 'boy', 'handsome, graceful', 'Arabic for "the handsome one".', 'وسيم', 'wah-SEEM', 50),
('Mustafa-Arabic', 'arabic', 'boy', 'the chosen one', 'Arabic usage of Mustafa, the chosen.', 'مصطفى', 'moos-TAH-fah', 80),
('Adel', 'arabic', 'boy', 'just, fair', 'Arabic for "the just one".', 'عادل', 'AH-del', 54),
('Aziz', 'arabic', 'boy', 'mighty, beloved, precious', 'Arabic for "the mighty and beloved", divine name.', 'عزيز', 'ah-ZEEZ', 56),
('Bassam', 'arabic', 'boy', 'one who smiles often', 'Arabic for "the smiling one".', 'بسام', 'bah-SAHM', 42),
('Basel', 'arabic', 'boy', 'brave, courageous', 'Arabic for "the brave one".', 'باسل', 'BAH-sel', 44),
('Diyar', 'arabic', 'boy', 'homelands, settlements', 'Arabic for "the homelands".', 'ديار', 'dee-YAR', 36),
('Faris', 'arabic', 'boy', 'knight, horseman, one who pierces', 'Arabic for "the knight", chivalrous.', 'فارس', 'fah-REES', 62),
('Ghassan', 'arabic', 'boy', 'oldness of youth, vigor', 'Name of an ancient Arab kingdom.', 'غسان', 'gah-SAHN', 34),
('Haydar', 'arabic', 'boy', 'lion, brave as a lion', 'Title of Ali, "the lion".', 'حيدر', 'HAY-dar', 56),
('Imad', 'arabic', 'boy', 'pillar, support, mainstay', 'Arabic for "the pillar of support".', 'عماد', 'ee-MAHD', 44),
('Jamal', 'arabic', 'boy', 'beauty, grace', 'Arabic for "beauty".', 'جمال', 'jah-MAHL', 48),
('Kamal', 'arabic', 'boy', 'perfection, completeness', 'Arabic for "perfection".', 'كمال', 'kah-MAHL', 50),
('Labib', 'arabic', 'boy', 'intelligent, sensible', 'Arabic for "the wise one".', 'لبيب', 'lah-BEEB', 30),
('Mazin', 'arabic', 'boy', 'rain cloud, raindrops', 'Arabic for "the rain cloud", blessing-bringer.', 'مازن', 'MAH-zin', 40),
('Murad', 'arabic', 'boy', 'wish, desire fulfilled', 'Arabic for "the fulfilled wish", Ottoman sultans'' name.', 'مراد', 'moo-RAHD', 50),
('Nael', 'arabic', 'boy', 'achiever, one who attains', 'Arabic for "the one who attains".', 'نائل', 'nah-EL', 38),
('Rayan', 'arabic', 'boy', 'luxuriant, well-watered, gates of paradise', 'The gate of paradise for those who fast.', 'ريان', 'RAH-yan', 78),
('Sameer', 'arabic', 'boy', 'companion in evening talk', 'Arabic for "the pleasant companion".', 'سمير', 'sah-MEER', 52),
('Tawfiq', 'arabic', 'boy', 'success, divine guidance', 'Arabic for "success from God".', 'توفيق', 'taw-FEEK', 48),
('Wahid', 'arabic', 'boy', 'one, unique, singular', 'Arabic for "the one and unique".', 'وحيد', 'wah-HEED', 40),
('Zahi', 'arabic', 'boy', 'bright, luminous', 'Arabic for "the bright one".', 'زاهي', 'ZAH-hee', 26),
('Alaa', 'arabic', 'boy', 'nobility, excellence, blessings', 'Arabic for "the nobility and blessings".', 'علاء', 'ah-LAH', 46)
ON CONFLICT (root, lower(name)) DO NOTHING;
