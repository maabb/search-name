/*
# English names expansion — batch 2 of 3

1. Plain-English explanation
- Adds ~60 more English names (boys and girls), each with meaning, short
  description, pronunciation, and popularity.
- Duplicate-safe: re-runs and overlaps are skipped via the per-culture
  uniqueness safeguard.

2. Schema changes
- None. Data-only.

3. Security changes
- None.
*/

INSERT INTO names (name, root, gender, meaning, description, pronunciation, popularity) VALUES
('Archie', 'english', 'boy', 'truly brave, genuine and bold', 'Short form of Archibald, "genuine and bold". Cheerful British favorite.', 'AR-chee', 66),
('Albie', 'english', 'boy', 'noble, bright', 'A friendly short form of Albert, "noble and bright".', 'AL-bee', 54),
('Bertie', 'english', 'boy', 'bright nobility', 'Vintage pet form of Albert and Herbert, warm and old-fashioned.', 'BUR-tee', 34),
('Reggie', 'english', 'boy', 'ruler''s counsel', 'Pet form of Reginald, "ruler''s advisor". Dapper and friendly.', 'REJ-ee', 38),
('Freddie', 'english', 'boy', 'peaceful ruler', 'A warm short form of Frederick, "peaceful ruler".', 'FRED-ee', 62),
('Charlie', 'english', 'boy', 'free man', 'Enduring pet form of Charles, friendly and timeless.', 'CHAR-lee', 72),
('Ollie', 'english', 'boy', 'olive tree, peace', 'Cheerful short form of Oliver, the olive tree of peace.', 'OL-ee', 60),
('Harry', 'english', 'boy', 'home ruler', 'Medieval English form of Henry, royal and beloved.', 'HAIR-ee', 74),
('Jack', 'english', 'boy', 'God is gracious', 'A sturdy medieval pet form of John, quintessentially English.', 'JAK', 76),
('Thomas', 'english', 'boy', 'twin', 'From Aramaic t''oma, "twin", a steady biblical classic.', 'TOM-us', 74),
('Edward', 'english', 'boy', 'wealthy guardian, rich protector', 'Old English Eadweard, "rich guard", borne by kings. Dignified.', 'ED-werd', 68),
('George', 'english', 'boy', 'farmer, earth-worker', 'From Greek georgos, "farmer", royal and classic in Britain.', 'JORJ', 72),
('Louis', 'english', 'boy', 'renowned warrior', 'From French Louis, borne by princes. Classic with a French air.', 'LOO-ee', 64),
('William', 'english', 'boy', 'resolute protector', 'From Wilhelm via the Norman conquest, royal and enduring.', 'WIL-yum', 80),
('Oliver', 'english', 'boy', 'olive tree, peace', 'From the olive tree, peaceful and wildly popular.', 'OL-ih-ver', 84),
('Henry', 'english', 'boy', 'home ruler', 'From Heimirich, "home ruler", carried by eight English kings.', 'HEN-ree', 82),
('James', 'english', 'boy', 'supplanter, holder of the heel', 'From Jacob via Latin, royal and classic across the English world.', 'JAYMZ', 78),
('Leo', 'english', 'boy', 'lion, brave heart', 'From Latin leo, "lion", short and strong.', 'LEE-oh', 78),
('Oscar', 'english', 'boy', 'friend of deer, divine spear', 'From Irish and Norse roots, literary through Oscar Wilde.', 'OS-ker', 72),
('Rufus', 'english', 'boy', 'red-haired', 'Latin for "red-haired", a distinguished Roman-era name.', 'ROO-fus', 38),
('Hugo-English', 'english', 'boy', 'mind, spirit', 'Distinctly English usage of Hugo, bright and bookish.', 'HYOO-goh', 46),
('Rowan', 'english', 'unisex', 'little red one, the rowan tree', 'From the rowan tree with red berries, nature-fresh for both genders.', 'ROH-un', 60),
('Alder', 'english', 'boy', 'the alder tree', 'From the riverside alder tree, a rare nature name.', 'AWL-der', 26),
('Aspen', 'english', 'unisex', 'the aspen tree, quivering leaf', 'From the quivering aspen, evoking mountains. Fresh and modern.', 'AS-pen', 48),
('Briar', 'english', 'unisex', 'thorny bush of roses', 'From the wild rose thicket, evoking Sleeping Beauty. Modern.', 'BRY-er', 44),
('Wilder', 'english', 'boy', 'wild one, untamed', 'From the word "wild", adventurous and spirited.', 'WYL-der', 46),
('Hawthorne', 'english', 'boy', 'the hawthorn tree', 'From the flowering hawthorn hedge, literary and distinguished.', 'HAW-thorn', 22),
('Fox', 'english', 'boy', 'the fox, cunning one', 'A bold animal name, sharp and modern.', 'FOKS', 34),
('Bear', 'english', 'boy', 'the bear', 'A rugged animal name, sturdy and cuddly at once.', 'BAIR', 36),
('Lynx', 'english', 'boy', 'the lynx, keen-sighted', 'From the wild cat with sharp eyes, rare and fierce.', 'LINKS', 18),
('Colt', 'english', 'boy', 'young horse, frisky', 'From the young horse, energetic and western.', 'KOLT', 40),
('Huck', 'english', 'boy', 'river dweller, nickname for Huckleberry', 'Mark Twain''s spirited hero, Americana at its best.', 'HUK', 26),
('Sawyer', 'english', 'boy', 'woodcutter, one who saws wood', 'An occupational name from Tom Sawyer, adventurous and friendly.', 'SOY-er', 54),
('Finn', 'english', 'boy', 'fair, blond, from Ireland', 'From Irish Fionn, "fair-haired", hero of Irish legend. Bright and brisk.', 'FIN', 68),
('Brooks', 'english', 'boy', 'of the brook, stream', 'From the murmuring stream, crisp and preppy.', 'BRUKS', 48),
('Reed', 'english', 'boy', 'the reed plant, red-haired', 'From the waterside reed, sleek and simple.', 'REED', 42),
('Heath', 'english', 'boy', 'the heathland, moor', 'From the open heath, moody and natural.', 'HEETH', 36),
('Cliff', 'english', 'boy', 'cliff, riverbank slope', 'From the word for the steep rock face, sturdy and vintage.', 'KLIF', 26),
('Dale', 'english', 'boy', 'valley', 'From the word for valley, gentle and vintage.', 'DAYL', 28),
('Ashton', 'english', 'boy', 'ash tree town', 'From the place of ash trees, modern and smooth.', 'ASH-tun', 44),
('Bradley', 'english', 'boy', 'broad meadow, wide clearing', 'From the broad clearing, friendly and classic.', 'BRAD-lee', 42),
('Sheldon', 'english', 'boy', 'steep valley, shield valley', 'From the sheltered valley, scholarly and vintage.', 'SHEL-dun', 26),
('Marley', 'english', 'unisex', 'pleasant meadow, boundary meadow', 'From the pleasant meadow, musical through Bob Marley.', 'MAR-lee', 46),
('Presley', 'english', 'unisex', 'priest''s meadow', 'From the priest''s meadow, musical through Elvis Presley.', 'PRESS-lee', 42),
('Wesley', 'english', 'boy', 'west meadow', 'From the western meadow, warm and bookish.', 'WEZ-lee', 48),
('Shirley', 'english', 'girl', 'bright meadow, bright clearing', 'From the bright clearing, vintage and luminous.', 'SHUR-lee', 24),
('Everly', 'english', 'girl', 'boar meadow, ever clearing', 'From the boar meadow, modern and melodic.', 'EV-er-lee', 58),
('Hadley', 'english', 'girl', 'heather field', 'From the heather-covered field, unisex and modern.', 'HAD-lee', 50),
('Ainsley', 'english', 'girl', 'one''s own meadow, hermitage meadow', 'Scottish for a solitary meadow, gentle and uncommon.', 'AYNZ-lee', 42),
('Shelby', 'english', 'unisex', 'willow farm, estate on the ledge', 'From the willow estate, sleek and modern.', 'SHEL-bee', 40),
('Beverly', 'english', 'girl', 'beaver stream, beaver meadow', 'From the beaver stream, a vintage classic.', 'BEV-er-lee', 24),
('Kirkley', 'english', 'boy', 'church meadow', 'From the church meadow, rare and grounded.', 'KURK-lee', 16),
('Grimsby', 'english', 'boy', 'Grim''s village, masked one''s farm', 'From the Old Norse place name, sturdy and rare.', 'GRIMZ-bee', 12),
('Wolsey', 'english', 'boy', 'wolf''s island', 'From the wolf''s island, historic and rare.', 'WULZ-ee', 12),
('Hargrave', 'english', 'boy', 'hare grove', 'From the hare grove, aristocratic and rare.', 'HAR-grayv', 12),
('Ashfield', 'english', 'boy', 'ash tree field', 'From the field of ash trees, grounded and rare.', 'ASH-feeld', 14),
('Buckley', 'english', 'boy', 'meadow of the buck, deer meadow', 'From the deer meadow, friendly and uncommon.', 'BUK-lee', 20),
('Rowley', 'english', 'boy', 'rough meadow, roe deer meadow', 'From the roe deer meadow, vintage and rare.', 'ROH-lee', 16),
('Emmett', 'english', 'boy', 'universal, whole, truth', 'From the universal truth, warm and rising in use.', 'EM-it', 56),
('Otis', 'english', 'boy', 'wealthy, of Otis Redding''s fame', 'Vintage American name, soulful through Otis Redding.', 'OH-tis', 44),
('Gus', 'english', 'boy', 'great, venerable', 'A friendly short form of Augustus, "great and venerable".', 'GUS', 42),
('Wallace', 'english', 'boy', 'Welshman, foreigner', 'From the Old French for Welshman, heroic through Braveheart.', 'WOL-is', 32),
('Preston', 'english', 'boy', 'priest''s town', 'From the priest''s settlement, polished and classic.', 'PRESS-tun', 38)
ON CONFLICT (root, lower(name)) DO NOTHING;
