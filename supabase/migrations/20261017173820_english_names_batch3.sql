/*
# English names expansion — batch 3 of 3

1. Plain-English explanation
- Adds ~50 more English names (girls, boys, and unisex), completing the
  English expansion with modern, vintage, and nature names.
- Duplicate-safe via the per-culture uniqueness safeguard.

2. Schema changes
- None. Data-only.

3. Security changes
- None.
*/

INSERT INTO names (name, root, gender, meaning, description, pronunciation, popularity) VALUES
('Amelia', 'english', 'girl', 'industrious, striving, work', 'From Germanic amal, "work", borne by aviator Amelia Earhart. Beloved worldwide.', 'uh-MEE-lee-uh', 84),
('Sophia', 'english', 'girl', 'wisdom', 'Greek for "wisdom", royal and timeless across the English world.', 'soh-FEE-uh', 82),
('Isabella', 'english', 'girl', 'devoted to God, God is my oath', 'Italian-Spanish form of Elizabeth, romantic and regal.', 'iz-uh-BEL-uh', 80),
('Mia', 'english', 'girl', 'mine, beloved', 'From Italian mia, "mine", short and sweet.', 'MEE-uh', 78),
('Luna', 'english', 'girl', 'moon', 'Latin for "moon", the divine moon goddess, dreamy and popular.', 'LOO-nuh', 76),
('Aria', 'english', 'girl', 'air, melody, lioness', 'From the solo melody, musical and light.', 'AH-ree-uh', 72),
('Aubrey', 'english', 'girl', 'elf ruler, supernatural ruler', 'From the elvish ruler, vintage-turned-modern.', 'AW-bree', 64),
('Natalie', 'english', 'girl', 'Christmas day, born at Christmas', 'From Latin natalis, "birth", festive and elegant.', 'NAT-uh-lee', 62),
('Hailey', 'english', 'girl', 'hay meadow', 'From the hay meadow, friendly and modern.', 'HAY-lee', 54),
('Peyton', 'english', 'unisex', 'fighting man''s estate', 'From the warrior''s town, sleek and modern.', 'PAY-tun', 46),
('Kinsley', 'english', 'girl', 'king''s meadow', 'From the king''s field, modern and melodic.', 'KINZ-lee', 50),
('Delaney', 'english', 'girl', 'dark challenger, from the alder grove', 'Irish-descended, modern and spirited.', 'duh-LAY-nee', 42),
('Emery', 'english', 'unisex', 'brave, powerful ruler', 'From the brave ruler, unisex and strong.', 'EM-er-ee', 48),
('Blakely', 'english', 'girl', 'dark meadow, pale clearing', 'From the dark meadow, modern and crisp.', 'BLAYK-lee', 34),
('Wrenley', 'english', 'girl', 'wren meadow, songbird field', 'A modern songbird name, fresh and lyrical.', 'REN-lee', 30),
('Sutton', 'english', 'unisex', 'southern settlement', 'From the southern town, polished and modern.', 'SUT-un', 36),
('Marlowe', 'english', 'unisex', 'driftwood, remnant of a lake', 'From the lake remnant, literary through Christopher Marlowe.', 'MAR-loh', 34),
('Tennyson', 'english', 'boy', 'son of Tenney, poetic heir', 'Poet''s heir, literary and rare.', 'TEN-ih-sun', 16),
('Braxton', 'english', 'boy', 'Brock''s town', 'From the badger town, modern and strong.', 'BRAKS-tun', 34),
('Grayson', 'english', 'boy', 'son of the grey-haired one', 'Son of the grey one, modern and smooth.', 'GRAY-sun', 56),
('Winston', 'english', 'boy', 'joyful stone, wine''s town', 'From the joyful stone, statesmanlike through Churchill.', 'WIN-stun', 34),
('Landon', 'english', 'boy', 'long hill, ridge', 'From the long hill, friendly and modern.', 'LAN-dun', 46),
('Bennett', 'english', 'boy', 'blessed', 'From Latin benedictus, "blessed", polished and warm.', 'BEN-it', 48),
('Everett-English', 'english', 'boy', 'brave boar, strong as a boar', 'English usage of Everett, distinguished and modern.', 'EV-er-it', 60),
('Silas-English', 'english', 'boy', 'forest, of the woods', 'English usage of Silas, earthy and biblical.', 'SY-luhs', 56),
('Atticus', 'english', 'boy', 'from Attica, of Athens', 'From the Greek region of Athens, beloved through To Kill a Mockingbird.', 'AT-ih-kus', 48),
('Holden', 'english', 'boy', 'hollow valley, kind and sheltered', 'From the sheltered valley, literary through Catcher in the Rye.', 'HOHL-den', 32),
('Huxley', 'english', 'boy', 'Hugh''s meadow', 'From the inhospitable meadow, bookish and modern.', 'HUKS-lee', 32),
('Lennox', 'english', 'unisex', 'elm grove, many elms', 'From the field of elms, Scottish and strong.', 'LEN-uks', 44),
('Knox', 'english', 'boy', 'round hill', 'From the round hill, bold and presidential.', 'NOKS', 38),
('Stone', 'english', 'boy', 'stone, rock', 'From the solid rock, sturdy and elemental.', 'STOHN', 32),
('Flint', 'english', 'boy', 'flint stone, spark', 'From the spark-making stone, rugged and sharp.', 'FLINT', 26),
('Chandler', 'english', 'boy', 'candle maker', 'From the candle maker, urban and friendly through Friends.', 'CHAND-ler', 34),
('Walker', 'english', 'boy', 'walker, one who walks', 'From the occupational walker, friendly and western.', 'WAW-ker', 36),
('Tucker', 'english', 'boy', 'cloth thickener', 'From the cloth worker, friendly and western.', 'TUK-er', 36),
('Carson', 'english', 'boy', 'son of Carr, marsh dweller', 'From the son of the marsh man, crisp and modern.', 'KAR-sun', 44),
('Easton', 'english', 'boy', 'east town', 'From the eastern town, modern and brisk.', 'EE-stun', 46),
('Weston', 'english', 'boy', 'west town', 'From the western town, modern and warm.', 'WES-tun', 44),
('Oakley', 'english', 'unisex', 'oak meadow', 'From the oak meadow, sturdy and modern.', 'OHK-lee', 40),
('Ridge', 'english', 'boy', 'ridge, elevated ground', 'From the high ridge, strong and elemental.', 'RIJ', 24),
('Canyon', 'english', 'boy', 'canyon, deep gorge', 'From the great gorge, western and grand.', 'KAN-yun', 22),
('Denali', 'english', 'unisex', 'the great one, highest peak', 'From the highest peak in North America, majestic and rare.', 'duh-NAH-lee', 20),
('Savannah', 'english', 'girl', 'open plain, treeless grassland', 'From the grassy plain, warm and southern.', 'suh-VAN-uh', 56),
('Georgia', 'english', 'girl', 'farmer, earth-worker', 'Feminine of George, warm through Ray Charles'' Georgia.', 'JOR-juh', 54),
('Virginia', 'english', 'girl', 'maiden, virgin', 'From the maiden, historic and gracious.', 'ver-JIN-yuh', 36),
('Dakota', 'english', 'unisex', 'friend, ally', 'From the Sioux people, "friend and ally", friendly and modern.', 'duh-KOH-tuh', 44),
('Cheyenne', 'english', 'girl', 'speaks in a strange tongue, the Cheyenne people', 'From the Great Plains people, spirited and modern.', 'shy-AN', 40),
('Montana', 'english', 'unisex', 'mountainous, mountain land', 'From the mountain state, wide and adventurous.', 'mon-TAN-uh', 28),
('Sierra', 'english', 'girl', 'mountain range, jagged peaks', 'From the mountain range, rugged and radiant.', 'see-AIR-uh', 38),
('Reese', 'english', 'unisex', 'enthusiasm, ardor, fire', 'Welsh-descended, "fiery ardor", crisp and modern.', 'REES', 44),
('Blair', 'english', 'unisex', 'plain, battlefield, dweller on the plain', 'Scottish for the open field, polished and sleek.', 'BLAIR', 36),
('Skye', 'english', 'girl', 'the Isle of Skye, the sky', 'From the misty isle and the open sky, light and free.', 'SKY', 48),
('Ocean', 'english', 'unisex', 'ocean, vast sea', 'From the boundless sea, rare and vast.', 'OH-shun', 24),
('Cove', 'english', 'unisex', 'small bay, sheltered inlet', 'From the sheltered bay, serene and modern.', 'KOHV', 18),
('Haven', 'english', 'girl', 'safe place, refuge', 'From the safe harbor, warm and peaceful.', 'HAY-ven', 38),
('Serenity', 'english', 'girl', 'serenity, calmness', 'From the calm and peaceful state, gentle and modern.', 'suh-REN-ih-tee', 46),
('Trinity', 'english', 'girl', 'trinity, three in one', 'From the sacred three, spiritual and modern.', 'TRIN-ih-tee', 40),
('Harmony', 'english', 'girl', 'harmony, musical agreement', 'From the musical accord, melodic and warm.', 'HAR-muh-nee', 40),
('Melody', 'english', 'girl', 'song, melody', 'From the song, sweet and musical.', 'MEL-uh-dee', 42),
('Cadence', 'english', 'girl', 'rhythm, flowing beat', 'From the rhythmic flow, musical and modern.', 'KAY-dens', 40)
ON CONFLICT (root, lower(name)) DO NOTHING;
