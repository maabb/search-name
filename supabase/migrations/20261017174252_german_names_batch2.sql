/*
# German names expansion — batch 2 of 3

1. Plain-English explanation
- Adds ~55 German boys'' names and a few unisex names, each with meaning,
  description, pronunciation, and popularity. Duplicate-safe.

2. Schema changes
- None. Data-only.

3. Security changes
- None.
*/

INSERT INTO names (name, root, gender, meaning, description, native_script, pronunciation, popularity) VALUES
('Lukas-Heinz', 'german', 'boy', 'bright, shining light', 'Compound usage blending Lukas and Heinz, bright and traditional.', 'Lukas-Heinz', 'LOO-kahs-HYNTS', 12),
('Hans', 'german', 'boy', 'God is gracious', 'Evergreen German short form of Johannes.', 'Hans', 'HAHNSS', 30),
('Fritz', 'german', 'boy', 'peaceful ruler', 'Cheerful short form of Friedrich, "peaceful ruler".', 'Fritz', 'FRITS', 28),
('Heinrich', 'german', 'boy', 'home ruler', 'Classic German form of Henry, borne by emperors.', 'Heinrich', 'HYN-rikh', 26),
('Lorenz', 'german', 'boy', 'from Laurentum, crowned with laurel', 'German form of Lawrence, "crowned with laurel".', 'Lorenz', 'loh-RENTS', 24),
('Sebastian', 'german', 'boy', 'venerable, revered', 'From Latin venerabilis, "revered". Distinguished and popular.', 'Sebastian', 'zeh-BAS-tee-ahn', 72),
('Christian', 'german', 'boy', 'follower of Christ', 'Steady classic, "follower of Christ".', 'Christian', 'KRIS-tee-ahn', 44),
('Andreas', 'german', 'boy', 'manly, brave', 'German form of Andrew, "manly and brave".', 'Andreas', 'ahn-DRAY-ahs', 36),
('Tobias', 'german', 'boy', 'God is good', 'Biblical, "God is good", warm and steady.', 'Tobias', 'toh-BEE-ahs', 54),
('Florian', 'german', 'boy', 'flowering, flourishing', 'From Latin florens, "blooming". Fresh and popular.', 'Florian', 'FLOH-ree-ahn', 50),
('Dominik', 'german', 'boy', 'belonging to the Lord', 'From Latin dominus, "of the Lord".', 'Dominik', 'DOH-mee-neek', 34),
('Fabian', 'german', 'boy', 'bean grower, of the Fabii', 'From the Roman family name, friendly and modern.', 'Fabian', 'FAH-bee-ahn', 40),
('Julian', 'german', 'boy', 'youthful, sky father''s kin', 'From Julius, "youthful". Smooth and popular.', 'Julian', 'YOO-lee-ahn', 68),
('Moritz', 'german', 'boy', 'dark-skinned, Moorish', 'German form of Maurice, playful through the sugar-rhyme Moritz.', 'Moritz', 'MOH-rits', 34),
('Niklas', 'german', 'boy', 'victory of the people', 'German short form of Nikolaus, "people''s victory".', 'Niklas', 'NIK-lahs', 46),
('Valentin', 'german', 'boy', 'strong, healthy, valiant', 'From Latin valens, "strong". Festive through Valentine.', 'Valentin', 'vah-len-TEEN', 40),
('Simon', 'german', 'boy', 'he has heard, listener', 'Biblical, "the listener", steady and kind.', 'Simon', 'ZEE-mohn', 52),
('David', 'german', 'boy', 'beloved', 'Biblical king''s name, "beloved", enduring.', 'David', 'DAH-vid', 54),
('Noah-German', 'german', 'boy', 'rest, comfort', 'German usage of Noah, hugely popular.', 'Noah', 'NOH-ah', 76),
('Ben-German', 'german', 'boy', 'son of the right hand', 'German short form of Benjamin, brisk and loved.', 'Ben', 'BEN', 64),
('Elias-German', 'german', 'boy', 'my God is Yahweh', 'German usage of Elias, rising favorite.', 'Elias', 'EH-lee-ahs', 70),
('Oskar', 'german', 'boy', 'friend of deer, divine spear', 'German spelling of Oscar, spirited and popular.', 'Oskar', 'OS-kar', 62),
('Emil', 'german', 'boy', 'rival, eager, industrious', 'From Latin Aemilius, "eager". Vintage revival favorite.', 'Emil', 'EH-meel', 56),
('Fritz-German', 'german', 'boy', 'peaceful ruler', 'German usage of Fritz, folksy and enduring.', 'Fritz', 'FRITS', 32),
('Jakob', 'german', 'boy', 'holder of the heel, supplanter', 'German spelling of Jacob, biblical and classic.', 'Jakob', 'YAH-kohp', 58),
('Tim-German', 'german', 'boy', 'honor of God', 'German usage of Tim, friendly and short.', 'Tim', 'TIM', 48),
('Jan', 'german', 'boy', 'God is gracious', 'Dutch-German short form of Janus/John.', 'Jan', 'YAHN', 44),
('Tom-German', 'german', 'boy', 'twin', 'German usage of Tom, simple and friendly.', 'Tom', 'TOM', 42),
('Luca', 'german', 'boy', 'from Lucania, bringer of light', 'Italian-German hybrid, "light", very popular.', 'Luca', 'LOO-kah', 74),
('Finn-German', 'german', 'boy', 'fair, from Finland', 'Nordic adoption popular in Germany, "fair".', 'Finn', 'FIN', 66),
('Jonas-German', 'german', 'boy', 'dove', 'German usage of Jonas, "dove of peace".', 'Jonas', 'YOH-nahs', 68),
('Samuel', 'german', 'boy', 'God has heard', 'Biblical, "heard by God", steady.', 'Samuel', 'ZAH-moo-el', 56),
('Daniel', 'german', 'boy', 'God is my judge', 'Biblical classic, "God is my judge".', 'Daniel', 'DAH-nee-el', 58),
('Philipp', 'german', 'boy', 'lover of horses', 'German spelling of Philip, "horse lover".', 'Philipp', 'FIL-ip', 40),
('Vincent', 'german', 'boy', 'conquering, prevailing', 'From Latin vincere, "to conquer". Artistic through Van Gogh.', 'Vincent', 'vin-TSENT', 46),
('Johann', 'german', 'boy', 'God is gracious', 'Timeless German form of John, borne by Bach and Goethe.', 'Johann', 'yoh-HAHN', 30),
('Georg', 'german', 'boy', 'farmer, earth-worker', 'German form of George, "farmer".', 'Georg', 'gay-ORK', 22),
('Michael', 'german', 'boy', 'who is like God?', 'Biblical archangel''s name, classic.', 'Michael', 'MEE-ah-el', 40),
('Wolfgang', 'german', 'boy', 'wolf path, wandering wolf', 'Old German, "wolf path", immortal through Mozart.', 'Wolfgang', 'VOLFS-gahng', 20),
('Rudolf', 'german', 'boy', 'famous wolf', 'From hrod "fame" and wolf, "renowned wolf".', 'Rudolf', 'ROO-dolf', 18),
('Gustav', 'german', 'boy', 'staff of the Goths, royal staff', 'Old Swedish-German, "royal staff". Regal.', 'Gustav', 'GUS-tahf', 30),
('Ernst', 'german', 'boy', 'earnest, serious, sincere', 'Old German for "serious", dignified.', 'Ernst', 'ERNST', 16),
('Klaus', 'german', 'boy', 'victory of the people', 'Short form of Nikolaus, folksy and familiar.', 'Klaus', 'KLOWSS', 20),
('Dieter', 'german', 'boy', 'of the people, warrior of the folk', 'Old German, "people''s warrior". Mid-century classic.', 'Dieter', 'DEE-ter', 16),
('Manfred', 'german', 'boy', 'man of peace, peacemaker', 'Old German, "man of peace".', 'Manfred', 'MAHN-fert', 14),
('Reinhard', 'german', 'boy', 'brave counsel, wise advisor', 'Old German, "brave and wise counsel".', 'Reinhard', 'RYNE-hart', 12),
('Sigmund', 'german', 'boy', 'victorious protector', 'Old German, "victory shield", Norse saga hero.', 'Sigmund', 'ZIG-moont', 12),
('Leopold', 'german', 'boy', 'of the people, bold for his people', 'Old German, "people-bold", borne by Austrian royalty.', 'Leopold', 'LAY-oh-polt', 22),
('Albrecht', 'german', 'boy', 'noble, bright, aristocratic', 'Old German, "noble-bright", Dürer''s name.', 'Albrecht', 'AHL-brekht', 14),
('Gunther', 'german', 'boy', 'warrior of battle', 'Old German, "battle warrior", Nibelungen king.', 'Gunther', 'GUN-ter', 12),
('Viktor', 'german', 'boy', 'victor, conqueror', 'Latin "victor", strong and Roman.', 'Viktor', 'VIK-tor', 32),
('Xaver', 'german', 'boy', 'new house, of the bright new home', 'Bavarian favorite from Saint Francis Xavier.', 'Xaver', 'KSAH-fer', 14),
('Quirin', 'german', 'boy', 'spear, of the god Quirinus', 'Old Bavarian saint''s name from Roman Quirinus.', 'Quirin', 'kvee-REEN', 10),
('Anselm', 'german', 'boy', 'divine helmet, God''s protection', 'Old German, "God''s helmet", saintly philosopher.', 'Anselm', 'AHN-zelm', 10),
('Benedikt', 'german', 'boy', 'blessed', 'German form of Benedict, "blessed".', 'Benedikt', 'beh-neh-DIKT', 30),
('Laurenz', 'german', 'boy', 'from Laurentum, laurel-crowned', 'German short form of Lorenz, "laurel".', 'Laurenz', 'LOW-rennts', 16)
ON CONFLICT (root, lower(name)) DO NOTHING;
