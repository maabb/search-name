/*
# English names expansion — batch 1 of 3

1. Plain-English explanation
- Adds ~60 more English names to the catalog (girls, boys, unisex), each with
  meaning, short description, pronunciation, and popularity.
- Uses ON CONFLICT DO NOTHING on the (root, lower(name)) safeguard, so
  re-running or overlapping batches cannot create duplicates.

2. Schema changes
- None. Data-only.

3. Security changes
- None.
*/

INSERT INTO names (name, root, gender, meaning, description, pronunciation, popularity) VALUES
('Chloe', 'english', 'girl', 'blooming, young green shoot', 'From Greek Khloe, an epithet of the harvest goddess Demeter. Fresh and cheerful.', 'KLOH-ee', 76),
('Zoe', 'english', 'girl', 'life, alive', 'Greek for "life", adopted widely in English. Bright and energetic.', 'ZOH-ee', 78),
('Lily', 'english', 'girl', 'the lily flower, purity', 'From the flower, a symbol of purity since medieval times. Sweet and enduring.', 'LIL-ee', 80),
('Violet', 'english', 'girl', 'the violet flower, modesty', 'From the delicate purple flower, a Victorian favorite back in style.', 'VY-uh-let', 74),
('Poppy', 'english', 'girl', 'the poppy flower, remembrance', 'From the bright red flower, symbolic of sleep and remembrance. Playful and bold.', 'POP-ee', 66),
('Iris', 'english', 'girl', 'rainbow, the iris flower', 'From the Greek goddess of the rainbow, also the flower. Artistic and classic.', 'EYE-ris', 62),
('Jasmine', 'english', 'girl', 'jasmine flower', 'From the fragrant Persian flower via Arabic yasamin. Romantic and sweet.', 'JAZ-min', 68),
('Holly', 'english', 'girl', 'the holly tree', 'From the evergreen holly with red berries, a cheerful winter name.', 'HOL-ee', 52),
('Fern', 'english', 'girl', 'the fern plant, greenery', 'From the shade-loving woodland plant. Quietly nature-loving.', 'FURN', 44),
('Flora', 'english', 'girl', 'flower, Roman goddess of flowers', 'From the Roman goddess of spring and flowers. Blooming and vintage.', 'FLOR-uh', 48),
('Wren', 'english', 'girl', 'the wren bird, small songbird', 'From the tiny spirited songbird. Short, modern, and nature-fresh.', 'REN', 64),
('Sage', 'english', 'unisex', 'wise, the sage herb', 'From the aromatic herb and the word for a wise person. Calm and knowing.', 'SAYJ', 60),
('Isla', 'english', 'girl', 'island, from Islay', 'From the Scottish island Islay, rising fast in English-speaking countries.', 'EYE-la', 72),
('Aurora-Lily', 'english', 'girl', 'dawn lily', 'A modern compound of dawn and lily, luminous and floral.', 'aw-ROH-rah-LY-lee', 30),
('Eloise', 'english', 'girl', 'healthy, wide, famous warrior', 'From the medieval French Heloise. Literary charm and vintage sweetness.', 'EL-oh-weez', 58),
('Beatrice', 'english', 'girl', 'she who brings happiness, blessed', 'From Latin beatrix, "she who makes happy", beloved through Dante and Shakespeare.', 'BEE-uh-triss', 56),
('Cora', 'english', 'girl', 'maiden, daughter', 'From Greek Kore, another name for Persephone. Simple and graceful.', 'KOR-uh', 66),
('Ada', 'english', 'girl', 'noble, nobility', 'Short form of Adelaide, famously borne by computing pioneer Ada Lovelace.', 'AY-duh', 60),
('Mabel', 'english', 'girl', 'lovable, my fair one', 'From Latin amabilis, "lovable". A sweet vintage revival.', 'MAY-buhl', 50),
('Alice', 'english', 'girl', 'noble, of noble kind', 'From the Germanic Adalheidis via Old French, famous through Wonderland.', 'AL-iss', 70),
('Charlotte', 'english', 'girl', 'free woman, little and womanly', 'Feminine of Charles, borne by queens and princesses. Regal and popular.', 'SHAR-lut', 78),
('Eleanor', 'english', 'girl', 'shining light, bright one', 'Of uncertain old roots, borne by medieval queens of England. Dignified.', 'EL-uh-nor', 68),
('Josephine', 'english', 'girl', 'God will add, God increases', 'Feminine of Joseph, borne by Empress Josephine of France. Stately.', 'JOH-zuh-feen', 58),
('Harriet', 'english', 'girl', 'home ruler, estate ruler', 'Feminine of Henry, carried by writer Harriet Beecher Stowe. Vintage strength.', 'HAIR-ee-it', 50),
('Louisa', 'english', 'girl', 'renowned warrior, famous in battle', 'Feminine of Louis, beloved through novelist Louisa May Alcott.', 'loo-EE-zuh', 46),
('Frances', 'english', 'girl', 'from France, free one', 'Feminine of Francis, a classic with the nickname Frankie.', 'FRAN-siss', 44),
('Margaret', 'english', 'girl', 'pearl', 'From Greek margarites, "pearl", borne by queens and saints. Enduring classic.', 'MAR-gret', 66),
('Edith', 'english', 'girl', 'prosperous in war, rich blessing', 'From Old English Eadgyth, "rich and happy". Vintage with quiet strength.', 'EE-dith', 42),
('Vera', 'english', 'girl', 'faith, truth', 'From Russian vera, "faith", also Latin verus, "true". Elegant and crisp.', 'VEER-uh', 48),
('Nora', 'english', 'girl', 'honor, light, short for Honora or Eleanor', 'A luminous short form with Irish roots, warm and modern.', 'NOR-uh', 64),
('Lucy', 'english', 'girl', 'light, born at dawn', 'From Latin lux, "light", borne by Saint Lucy. Bright and friendly.', 'LOO-see', 68),
('Freya', 'english', 'girl', 'noble lady, Norse goddess of love', 'From the Norse goddess of love and beauty, popular across Britain.', 'FRAY-uh', 64),
('Astrid', 'english', 'girl', 'divinely beautiful, beloved of the gods', 'Old Norse for "divinely beautiful", used widely in English now.', 'AS-trid', 52),
('Petra', 'english', 'girl', 'rock, stone', 'Feminine of Peter, from Greek petra, "rock". Solid and uncommon.', 'PEH-truh', 36),
('Maeve', 'english', 'girl', 'she who intoxicates, queenly', 'From the legendary Irish warrior queen Medb. Bold and lyrical.', 'MAYV', 56),
('Orla', 'english', 'girl', 'golden princess', 'From Irish Órlaith, "golden sovereign". Short and radiant.', 'OR-la', 48),
('Nell', 'english', 'girl', 'bright shining one, short for Eleanor', 'A vintage pet form of Eleanor and Helen. Sweet and simple.', 'NEL', 40),
('Sadie', 'english', 'girl', 'princess, short for Sarah', 'A lively pet form of Sarah with vintage charm.', 'SAY-dee', 58),
('Josie', 'english', 'girl', 'God will add', 'A cheerful short form of Josephine, friendly and bright.', 'JOH-zee', 50),
('Tilly', 'english', 'girl', 'mighty in battle, short for Matilda', 'A playful short form of Matilda, vintage-sweet and spunky.', 'TIL-ee', 42),
('Marigold', 'english', 'girl', 'the marigold flower, golden bloom', 'From the golden flower, a rare botanical gem of a name.', 'MAIR-ih-gold', 34),
('Magnolia', 'english', 'girl', 'the magnolia tree, dignity', 'From the southern flowering tree, romantic and stately.', 'mag-NOH-lee-uh', 40),
('Juniper', 'english', 'girl', 'the juniper tree, evergreen', 'From the evergreen shrub with blue berries, fresh and spirited.', 'JOO-nih-per', 52),
('Sylvie', 'english', 'girl', 'of the forest, wood spirit', 'From Latin silva, "forest", a graceful nature name.', 'SIL-vee', 50),
('Autumn', 'english', 'girl', 'the autumn season, harvest', 'A season name evoking golden leaves and harvest warmth.', 'AW-tum', 58),
('Winter', 'english', 'girl', 'the winter season', 'A cool, serene season name, crisp and modern.', 'WIN-ter', 46),
('Ember', 'english', 'girl', 'glowing coal, spark of fire', 'From the glowing remains of a fire, warm and luminous.', 'EM-ber', 48),
('Aurora-Skye', 'english', 'girl', 'dawn sky', 'A modern compound of dawn and the Isle of Skye, wide and luminous.', 'aw-ROH-rah-SKY', 28),
('Rosalind', 'english', 'girl', 'gentle horse, beautiful rose', 'Of Germanic roots read as "pretty rose", Shakespearean and refined.', 'ROZ-uh-lind', 38),
('Cecily', 'english', 'girl', 'blind to one''s own beauty, sixth', 'A medieval form of Cecilia, literary and rare.', 'SESS-uh-lee', 34),
('Philippa', 'english', 'girl', 'lover of horses', 'Feminine of Philip, borne by medieval queens. Nickname Pippa.', 'FIL-ih-puh', 40),
('Verity', 'english', 'girl', 'truth', 'A Puritan virtue name meaning "truth". Honest and elegant.', 'VEER-ih-tee', 36),
('Charity', 'english', 'girl', 'love, Christian love', 'A virtue name from Latin caritas, warm-hearted and vintage.', 'CHAIR-ih-tee', 32),
('Mercy', 'english', 'girl', 'compassion, forgiveness', 'A gentle virtue name, rare and quietly luminous.', 'MUR-see', 34),
('Felicity', 'english', 'girl', 'happiness, good fortune', 'From Latin felicitas, "happiness", cheerful and refined.', 'fuh-LISS-ih-tee', 48),
('Constance', 'english', 'girl', 'steadfast, constant', 'A virtue name meaning "steadfast", dignified with the nickname Connie.', 'KON-stans', 36),
('Tamsin', 'english', 'girl', 'twin', 'A Cornish form of Thomasina, "twin". Distinctive and bright.', 'TAM-zin', 32),
('Demi', 'english', 'girl', 'half, small, goddess of earth', 'A short form of Demetria, fresh and friendly.', 'DEH-mee', 44),
('Martha', 'english', 'girl', 'lady, mistress of the house', 'Aramaic for "lady of the house", biblical and homely classic.', 'MARTH-uh', 44),
('Agatha', 'english', 'girl', 'good, honorable', 'Greek for "good", famous through mystery writer Agatha Christie.', 'AG-uh-thuh', 36),
('Dorothy', 'english', 'girl', 'gift of God', 'From Greek Theodoros feminine form, beloved through Oz. Vintage revival.', 'DOR-uh-thee', 52)
ON CONFLICT (root, lower(name)) DO NOTHING;
