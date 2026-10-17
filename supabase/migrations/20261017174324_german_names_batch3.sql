/*
# German names expansion — batch 3 of 3 (fixed)

1. Plain-English explanation
- Adds ~50 more German names (girls, boys, unisex), including modern
  favorites, completing the German expansion. Duplicate-safe.
- Fixes a missing opening parenthesis from the first attempt of this batch.

2. Schema changes
- None. Data-only.

3. Security changes
- None.
*/

INSERT INTO names (name, root, gender, meaning, description, native_script, pronunciation, popularity) VALUES
('Emma-German2', 'german', 'girl', 'whole, universal', 'German usage of Emma, the enduring number one.', 'Emma', 'EM-ah', 0),
('Mia-German', 'german', 'girl', 'mine, beloved', 'German usage of Mia, short and sweet.', 'Mia', 'MEE-ah', 74),
('Sophia-German', 'german', 'girl', 'wisdom', 'German usage of Sophia, "wisdom".', 'Sophia', 'zoh-FEE-ah', 70),
('Marie-Luise', 'german', 'girl', 'beloved and renowned warrior', 'Compound of Marie and Luise, aristocratic and graceful.', 'Marie-Luise', 'mah-ree-loo-EE-zuh', 28),
('Charlotte-German', 'german', 'girl', 'free woman', 'German usage of Charlotte, royal and modern.', 'Charlotte', 'shar-LOT-tuh', 66),
('Hedwig', 'german', 'girl', 'battle, strife, combat', 'Old German hjadu "combat", saintly and vintage.', 'Hedwig', 'HED-vik', 12),
('Adelinde', 'german', 'girl', 'noble and gentle', 'Old German, "noble and tender". Rare.', 'Adelinde', 'AH-duh-lin-duh', 8),
('Rosalinde', 'german', 'girl', 'gentle rose, beautiful rose', 'German form of Rosalind, "pretty rose".', 'Rosalinde', 'roh-zah-LIN-duh', 14),
('Ottilie', 'german', 'girl', 'prosperity, wealth, fortune', 'Old German aud "wealth", vintage revival.', 'Ottilie', 'OT-ih-lee', 22),
('Wilhelmina', 'german', 'girl', 'resolute protector', 'Feminine of Wilhelm, royal and resolute.', 'Wilhelmina', 'vil-hel-MEE-nah', 12),
('Amalia', 'german', 'girl', 'industrious, striving, work', 'Old German amal "work", elegant revival.', 'Amalia', 'ah-MAH-lee-ah', 48),
('Genoveva', 'german', 'girl', 'of the family, noble woman', 'Saint Genevieve''s German form, "noble woman".', 'Genoveva', 'geh-noh-VEH-vah', 10),
('Kunigunde', 'german', 'girl', 'brave in battle, royal kin', 'Old German, "royal kin bold in battle". Medieval empress.', 'Kunigunde', 'KOO-nee-gun-duh', 6),
('Mechthild', 'german', 'girl', 'mighty in battle', 'Old German, "mighty in battle".', 'Mechthild', 'MEKHT-hilt', 8),
('Swantje', 'german', 'girl', 'swan', 'Frisian for "little swan", graceful and northern.', 'Swantje', 'SVAN-yuh', 12),
('Wiebke', 'german', 'girl', 'battle warrior', 'Frisian, "warrior woman".', 'Wiebke', 'VEEP-kuh', 10),
('Henrike', 'german', 'girl', 'home ruler', 'Feminine of Henrik, "home ruler".', 'Henrike', 'HEN-ree-kuh', 20),
('Johanna-German', 'german', 'girl', 'God is gracious', 'German usage of Johanna, steady and graceful.', 'Johanna', 'yoh-HAH-nah', 44),
('Katharina-German', 'german', 'girl', 'pure, clear', 'German usage of Katharina, regal classic.', 'Katharina', 'kah-tah-REE-nah', 46),
('Anne-German', 'german', 'girl', 'grace, favor', 'German usage of Anne, simple and enduring.', 'Anne', 'AH-nuh', 50),
('Emma-Rose', 'german', 'girl', 'whole and rose', 'Modern compound of Emma and Rose, blooming.', 'Emma-Rose', 'EM-ah-ROH-zuh', 24),
('Friedrike', 'german', 'girl', 'peaceful ruler', 'Feminine of Friedrich, "peaceful ruler".', 'Friedrike', 'FREE-dree-kuh', 10),
('Liesel', 'german', 'girl', 'God is my oath', 'Bavarian pet form of Elisabeth, storybook sweet.', 'Liesel', 'LEE-zel', 16),
('Aurelia', 'german', 'girl', 'golden', 'Latin for "golden", luminous revival.', 'Aurelia', 'ow-REH-lee-ah', 40),
('Cecilia', 'german', 'girl', 'blind to one''s own beauty', 'Saint of music, "the sixth". Musical.', 'Cecilia', 'tseh-TSEE-lee-ah', 32),
('Livia', 'german', 'girl', 'blue, olive', 'Roman empress name, sleek and modern.', 'Livia', 'LEE-vee-ah', 34),
('Konstantin', 'german', 'boy', 'constant, steadfast', 'From Latin constans, "steadfast", imperial.', 'Konstantin', 'kon-stahn-TEEN', 38),
('Ferdinand', 'german', 'boy', 'brave journey, bold voyager', 'Old German, "bold traveler", borne by emperors.', 'Ferdinand', 'FER-dee-nahnt', 20),
('Achim', 'german', 'boy', 'God will judge', 'North German short form of Joachim.', 'Achim', 'AH-khim', 12),
('Caspar', 'german', 'boy', 'treasurer, bringer of treasure', 'One of the three magi, "treasurer".', 'Caspar', 'KAS-par', 26),
('Magnus', 'german', 'boy', 'great, mighty', 'Latin for "great", Nordic-German classic.', 'Magnus', 'MAHG-nus', 34),
('Björn', 'german', 'boy', 'bear', 'Nordic for "bear", used in northern Germany.', 'Björn', 'byorn', 28),
('Sören', 'german', 'boy', 'stern, strict', 'Danish-German form of Søren, "stern".', 'Sören', 'ZUR-ren', 18),
('Jesper', 'german', 'boy', 'treasurer, keeper of treasure', 'Danish-German form of Jasper.', 'Jesper', 'YES-per', 16),
('Henrik', 'german', 'boy', 'home ruler', 'Scandinavian-German form of Henry.', 'Henrik', 'HEN-rik', 30),
('Matti', 'german', 'boy', 'gift of God', 'Finnish-German form of Matthew.', 'Matti', 'MAH-tee', 14),
('Jonte', 'german', 'boy', 'God is gracious', 'Modern German short form of Jonathan, sprightly.', 'Jonte', 'YON-tuh', 20),
('Levi-German', 'german', 'boy', 'joined, attached, in harmony', 'Biblical Levi, rising fast in Germany.', 'Levi', 'LAY-vee', 52),
('Matteo', 'german', 'boy', 'gift of God', 'Italian form of Matthew, popular in Germany.', 'Matteo', 'maht-TEH-oh', 54),
('Aleksander', 'german', 'boy', 'defender of the people', 'German-Polish spelling of Alexander.', 'Aleksander', 'ah-lek-ZAHN-der', 24),
('Nico', 'german', 'boy', 'victory of the people', 'Short form of Niklas, friendly and brisk.', 'Nico', 'NEE-koh', 42),
('Jannis', 'german', 'boy', 'God is gracious', 'Greek-German form of Yannis, sunny.', 'Jannis', 'YAH-nis', 24),
('Janosch', 'german', 'boy', 'God is gracious', 'Pet form of Jan, beloved through children''s books.', 'Janosch', 'YAH-nosh', 16),
('Cornelius', 'german', 'boy', 'horn, strong as a horn', 'Latin family name, "horn". Distinguished.', 'Cornelius', 'kor-NAY-lee-us', 14),
('Quentin', 'german', 'boy', 'fifth, the fifth one', 'From Latin quintus, "the fifth".', 'Quentin', 'kwen-TEEN', 18),
('Roman-German', 'german', 'boy', 'of Rome, Roman', 'Pan-European name popular in Germany.', 'Roman', 'roh-MAHN', 36),
('Theo-German', 'german', 'boy', 'gift of God', 'German short form of Theodor, beloved.', 'Theo', 'TAY-oh', 64),
('Matthias-German', 'german', 'boy', 'gift of God', 'German usage of Matthias, "gift of God".', 'Matthias', 'mah-TEE-ahs', 44),
('Lotta', 'german', 'girl', 'free woman', 'Modern short form of Charlotte, spirited.', 'Lotta', 'LOT-tah', 44),
('Mette', 'german', 'girl', 'pearl', 'North German-Danish form of Margarete, "pearl".', 'Mette', 'MET-tuh', 12),
('Ida-German', 'german', 'girl', 'industrious, diligent', 'German usage of Ida, "diligent".', 'Ida', 'EE-dah', 44)
ON CONFLICT (root, lower(name)) DO NOTHING;
