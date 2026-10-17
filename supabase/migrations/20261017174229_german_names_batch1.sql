/*
# German names expansion — batch 1 of 3

1. Plain-English explanation
- Adds ~60 German names (girls first), each with meaning, description,
  pronunciation, and popularity. Duplicate-safe via the per-culture safeguard.

2. Schema changes
- None. Data-only.

3. Security changes
- None.
*/

INSERT INTO names (name, root, gender, meaning, description, native_script, pronunciation, popularity) VALUES
('Adelaide', 'german', 'girl', 'of noble kind, noble natured', 'From Adalheidis, "nobility", borne by a 19th-century queen of England.', 'Adelaide', 'AD-uh-layd', 54),
('Elisabeth', 'german', 'girl', 'God is my oath', 'German form of Elizabeth, classic and royal.', 'Elisabeth', 'eh-LEE-zah-bet', 56),
('Susanne', 'german', 'girl', 'lily', 'German form of Susan, from Hebrew shoshana, "lily".', 'Susanne', 'zoo-ZAH-nuh', 34),
('Christine', 'german', 'girl', 'follower of Christ, Christian', 'German form of Christina, steady and classic.', 'Christine', 'kris-TEE-nuh', 38),
('Sabine', 'german', 'girl', 'of the Sabine people', 'From the ancient Sabine people of Italy, vintage and poised.', 'Sabine', 'zah-BEE-nuh', 30),
('Heidrun', 'german', 'girl', 'honor and secret rune', 'Old German name blending honor and the secret rune, distinctly Nordic-German.', 'Heidrun', 'HYD-roon', 18),
('Brunhilde', 'german', 'girl', 'armor, battle, brown warrior', 'From the legendary shieldmaiden of the Nibelungenlied. Mighty and mythic.', 'Brünhilde', 'BROON-hil-duh', 14),
('Waltraud', 'german', 'girl', 'ruler of strength', 'Old German for "strong ruler", a grandmother-era classic.', 'Waltraud', 'VAHL-trowt', 12),
('Gertrud', 'german', 'girl', 'spear of strength', 'From ger "spear" and traut "strength", saintly and vintage.', 'Gertrud', 'GER-troot', 14),
('Ingeborg', 'german', 'girl', 'protected by Ing, the god Ing''s fortress', 'Norse-Germanic name under the god Ing''s protection.', 'Ingeborg', 'ING-uh-borg', 12),
('Anneliese', 'german', 'girl', 'grace and God is my oath', 'Compound of Anna and Liese, "grace and oath of God". Sweetly vintage.', 'Anneliese', 'AH-nuh-lee-zuh', 36),
('Lieselotte', 'german', 'girl', 'God is my oath and free woman', 'Compound of Liesel and Lotte, charmingly old-Berlin.', 'Lieselotte', 'LEE-zuh-lot-tuh', 16),
('Margarete', 'german', 'girl', 'pearl', 'German form of Margaret, "pearl". Classic and literary (Goethe''s Gretchen).', 'Margarete', 'mar-gah-REH-tuh', 22),
('Ursula', 'german', 'girl', 'little she-bear', 'Latin for "little she-bear", saintly and vintage.', 'Ursula', 'OOR-zoo-lah', 20),
('Helga', 'german', 'girl', 'blessed, holy, prosperous', 'Old Norse-Germanic for "holy and blessed".', 'Helga', 'HEL-gah', 18),
('Inge', 'german', 'girl', 'belonging to Ing, the god Ing''s own', 'Short Nordic-German name of the god Ing.', 'Inge', 'ING-uh', 14),
('Renate', 'german', 'girl', 'reborn, born again', 'From Latin renatus, "born again". Vintage mid-century.', 'Renate', 'reh-NAH-tuh', 16),
('Monika', 'german', 'girl', 'advise, alone, unique', 'German spelling of Monica, warm mid-century classic.', 'Monika', 'MO-nee-kah', 26),
('Petra-German', 'german', 'girl', 'rock, stone', 'German usage of Petra, solid and steadfast.', 'Petra', 'PEH-trah', 22),
('Karin', 'german', 'girl', 'pure', 'Scandinavian-German form of Katherine, "pure".', 'Karin', 'KAH-rin', 28),
('Silke', 'german', 'girl', 'silky, gentle, of the forest', 'A soft German name possibly from Silvia roots.', 'Silke', 'ZIL-kuh', 14),
('Britta', 'german', 'girl', 'exalted one, strength', 'Nordic-German short form of Birgitta, crisp and bright.', 'Britta', 'BRIT-tah', 18),
('Anke', 'german', 'girl', 'grace, favor', 'Frisian-German short form of Anna, "grace".', 'Anke', 'AHN-kuh', 14),
('Meike', 'german', 'girl', 'little Maria', 'Frisian-German diminutive of Maria, "little Mary".', 'Meike', 'MY-kuh', 14),
('Antje', 'german', 'girl', 'grace, favor', 'Frisian form of Anna, distinctly northern German.', 'Antje', 'AHN-tyuh', 12),
('Jule', 'german', 'girl', 'youthful, downy-bearded', 'German short form of Julia, breezy and young.', 'Jule', 'YOO-luh', 28),
('Franziska', 'german', 'girl', 'from France, free one', 'German feminine of Francis, lively and classic.', 'Franziska', 'fran-TSIS-kah', 32),
('Angelika', 'german', 'girl', 'angelic, messenger', 'German form of Angelica, "angelic".', 'Angelika', 'ahn-GAY-lee-kah', 20),
('Beate', 'german', 'girl', 'blessed, happy', 'From Latin beatus, "blessed". Vintage classic.', 'Beate', 'beh-AH-tuh', 16),
('Nadine', 'german', 'girl', 'hope', 'French-Slavic adoption common in Germany, "hope".', 'Nadine', 'nah-DEEN', 32),
('Judith', 'german', 'girl', 'woman of Judea, praised', 'Biblical name meaning "praised", steady in Germany.', 'Judith', 'YOO-dit', 24),
('Kerstin', 'german', 'girl', 'follower of Christ', 'Scandinavian-German form of Christina.', 'Kerstin', 'KER-stin', 18),
('Maren', 'german', 'girl', 'of the sea', 'Frisian-Danish form of Marina, "of the sea".', 'Maren', 'MAH-ren', 34),
('Nele', 'german', 'girl', 'shining light, cornelia''s own', 'Low German short form of Cornelia, hugely popular.', 'Nele', 'NAY-luh', 52),
('Marlene', 'german', 'girl', 'beloved of the sea, star of the sea', 'Compound of Maria and Magdalene, glamorized by Marlene Dietrich.', 'Marlene', 'mar-LAY-nuh', 32),
('Mira', 'german', 'girl', 'wonder, admirable, peace', 'Short international name popular in Germany, "wonderful".', 'Mira', 'MEE-rah', 46),
('Alina', 'german', 'girl', 'bright, beautiful, noble', 'Pan-European name popular in Germany, "bright and noble".', 'Alina', 'ah-LEE-nah', 58),
('Lara', 'german', 'girl', 'citadel, well-spoken, cheerful', 'Popular in Germany via Russian Larisa, melodious.', 'Lara', 'LAH-rah', 50),
('Vanessa', 'german', 'girl', 'butterfly, of Venus', 'Invented by Jonathan Swift, butterfly-bright.', 'Vanessa', 'vah-NEH-sah', 30),
('Melissa', 'german', 'girl', 'bee, honeybee', 'Greek for "bee", busy and sweet.', 'Melissa', 'meh-LIS-sah', 28),
('Jessica', 'german', 'girl', 'God beholds, foresighted', 'Shakespearean coinage, widely used in 90s Germany.', 'Jessica', 'JES-ih-kah', 32),
('Michelle', 'german', 'girl', 'who is like God?', 'French feminine of Michael, adopted widely in Germany.', 'Michelle', 'mee-SHEL', 28),
('Jennifer', 'german', 'girl', 'white wave, fair and smooth', 'Cornish origin, a 90s staple in Germany.', 'Jennifer', 'JEN-ih-fer', 26),
('Sarah-German', 'german', 'girl', 'princess, noblewoman', 'German usage of Sarah, enduring favorite.', 'Sarah', 'ZAH-rah', 48),
('Laura', 'german', 'girl', 'laurel, crowned with laurel', 'From the laurel of victory, graceful and popular.', 'Laura', 'LOW-rah', 56),
('Marie-German', 'german', 'girl', 'beloved, star of the sea, bitter-turned-sweet', 'German usage of Marie, timeless middle name of choice.', 'Marie', 'mah-REE', 60),
('Klara-German', 'german', 'girl', 'bright, clear, famous', 'German usage of Klara, luminous classic.', 'Klara', 'KLAH-rah', 62),
('Paula', 'german', 'girl', 'small, humble', 'Feminine of Paul, modest and sweet.', 'Paula', 'POW-lah', 44),
('Lina-German', 'german', 'girl', 'tender, gentle, little', 'German usage of Lina, soft and hugely popular.', 'Lina', 'LEE-nah', 72),
('Ella', 'german', 'girl', 'other, fairy, bright', 'Short form of Eleanor and Elisabeth, sparkling.', 'Ella', 'EL-lah', 68),
('Ida', 'german', 'girl', 'industrious, diligent', 'Old German for "work and industry", vintage revival.', 'Ida', 'EE-dah', 46),
('Romy', 'german', 'girl', 'rosemary, dew of the sea', 'Beloved through actress Romy Schneider, sprightly.', 'Romy', 'ROH-mee', 38),
('Amelie', 'german', 'girl', 'industrious, striving', 'German form of Amélie, "hardworking". Charming.', 'Amélie', 'AH-meh-lee', 62),
('Fine', 'german', 'girl', 'fine, slender, delicate', 'German short form of Josefine, delicate and modern.', 'Fine', 'FEE-nuh', 30),
('Lotte-German', 'german', 'girl', 'free woman', 'German usage of Lotte, spirited classic.', 'Lotte', 'LOT-tuh', 58),
('Tilda', 'german', 'girl', 'mighty in battle', 'Short form of Mathilda, strong and sweet.', 'Tilda', 'TIL-dah', 40),
('Elsa', 'german', 'girl', 'God is my oath, noble', 'Short form of Elisabeth, made global by Frozen.', 'Elsa', 'EL-sah', 44),
('Wilhelmine', 'german', 'girl', 'resolute protector', 'Feminine of Wilhelm, royal Prussian heritage.', 'Wilhelmine', 'vil-hel-MEE-nuh', 14),
('Theresa', 'german', 'girl', 'harvester, summer', 'German form of Teresa, "the harvester".', 'Theresa', 'teh-REH-zah', 28),
('Verena', 'german', 'girl', 'true, authentic, defender', 'Old German-Swiss saint''s name, "true and steadfast".', 'Verena', 'feh-REH-nah', 20)
ON CONFLICT (root, lower(name)) DO NOTHING;
