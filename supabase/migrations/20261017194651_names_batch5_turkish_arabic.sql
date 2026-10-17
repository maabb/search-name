/*
# Add unique names batch 5 - Turkish and Arabic (final batch to 1,000)

1. Plain-English explanation
- Adds the last 57 names (30 Turkish, 27 Arabic) with meaning, story,
  pronunciation and popularity, bringing the catalog to exactly 1,000.
- Every name was checked against the existing catalog; the unique
  per-culture guard means a repeat can never insert twice.

2. Schema changes
- None. Data-only migration into the existing `names` table.

3. Security changes
- None.
*/

INSERT INTO names (name, root, gender, meaning, description, native_script, pronunciation, popularity) VALUES
-- Turkish
('Alara','turkish','girl','water fairy, one who captivates beauty','From a legendary water fairy of Turkish folklore, one of the fastest-rising names for girls.','Alara','ah-LAH-rah',68),
('Aleyna','turkish','girl','the flag raised high, noble banner','From the standard of the crescent flag, popular and proud across Turkey.','Aleyna','ah-LEY-nah',62),
('Asya','turkish','girl','Asia, the rising continent','The Turkish form of Asia, vast and dawning.','Asya','ahs-YAH',48),
('Aybike','turkish','girl','lady of the moon','Ay moon plus bike lady, a poetic Turkic title.','Aybike','eye-bee-KEH',32),
('Bensu','turkish','girl','a thousand waters','Ben thousand plus su water, fresh and flowing.','Bensu','ben-SOO',30),
('Beste','turkish','girl','melody, musical composition','Persian besteh, a composed melody, beloved by musicians.','Beste','bes-TEH',34),
('Büşra','turkish','girl','good tidings','From the Arabic bushra, glad news. A warm favorite in Turkey.','Büşra','buush-RAH',52),
('Ceylin','turkish','girl','young gazelle, graceful','From the gazelle, swift and graceful.','Ceylin','jay-LIN',40),
('Dicle','turkish','girl','the Tigris river','The Turkish name of the Tigris, the great river of Mesopotamia.','Dicle','dee-JLEH',36),
('Eda','turkish','girl','appearance, elegant bearing','Turkish for graceful demeanor, short and chic.','Eda','eh-DAH',50),
('Gizem','turkish','girl','mystery, secret','Turkish for mystery, alluring and deep.','Gizem','gih-ZEM',38),
('Gülşah','turkish','girl','rose garden breeze','Gul rose plus shah breeze, the wind through the rose garden.','Gülşah','guul-SHAH',36),
('Hazal','turkish','girl','autumn colors, amber-toned','From the hazel-amber leaves of early autumn.','Hazal','hah-ZAHL',40),
('Melike','turkish','girl','queen, sovereign lady','From the Arabic malika, queen, long loved in Anatolia.','Melike','meh-lee-KEH',42),
('Meltem','turkish','girl','sea breeze, summer wind','Turkish for the gentle onshore breeze of summer.','Meltem','mel-TEM',34),
('Neslihan','turkish','girl','of noble lineage, dynasty flower','Nesil lineage plus han lady, aristocratic and warm.','Neslihan','nes-lee-HAHN',44),
('Özge','turkish','girl','different, other, distinctive','Turkish for the other one, unlike any other.','Özge','oez-GEH',44),
('Rüya','turkish','girl','dream','Turkish for dream, soft as sleep itself.','Rüya','ruu-YAH',46),
('Sedef','turkish','girl','mother-of-pearl','Turkish for nacre, the shimmer inside the shell.','Sedef','seh-DEF',30),
('Şirin','turkish','girl','sweet, charming','Persian for sweet, famous from the love story of Ferhat and Sirin.','Şirin','shi-REEN',38),
('Aybars','turkish','boy','moon lord, tiger of the moon','Ay moon plus bars leopard, a name of Turkic khans.','Aybars','eye-BAHRS',30),
('Barış','turkish','boy','peace','Turkish for peace itself, calm and strong.','Barış','bah-RISH',46),
('Buğra','turkish','boy','first-born camel, young bull','An ancient Turkic title of leadership, borne by the Karakhanid kings.','Buğra','buug-RAH',28),
('Cengiz','turkish','boy','ocean, vast and strong','The Turkish form of Genghis, from the Turkic tengiz, sea.','Cengiz','jen-GEEZ',34),
('Çağlar','turkish','boy','flowing flood, streaming age','Turkish for the rushing stream of time.','Çağlar','chaah-LAHR',30),
('Egemen','turkish','boy','sovereign ruler','Ege domain plus hemen ruler, fully sovereign.','Egemen','eh-geh-MEN',38),
('Furkan','turkish','boy','the criterion, the distinguisher','One of the Quran''s names for itself, the guide between truth and falsehood.','Furkan','foor-KAHN',48),
('Koray','turkish','boy','ember moon, blazing moon','Kor ember plus ay moon, the glowing moon.','Koray','koh-RYE',38),
('Sarp','turkish','boy','steep, rugged, mighty','Turkish for sheer and strong like a mountain face.','Sarp','SAHRP',40),
('Ziya','turkish','boy','light, radiance','From the Arabic ziya, light and splendor.','Ziya','ZEE-yah',36),
-- Arabic
('Anwar','arabic','boy','luminous, most radiant','The intensifying form of nur, light itself.','أنور','ahn-WAHR',54),
('Bashar','arabic','boy','bringer of glad tidings','From bashara, to bring good news, human and hopeful.','بشار','bah-SHAHR',46),
('Fadi','arabic','boy','savior, redeemer','From fada, to save and ransom, a protector''s name.','فادي','FAH-dee',48),
('Hadi','arabic','boy','guide, one who leads rightly','From hada, to guide. A calm leadership name.','هادي','HAH-dee',56),
('Hamid','arabic','boy','praising, praiseworthy','From hamida, to praise. Grateful at its root.','حامد','hah-MEED',58),
('Jawad','arabic','boy','generous, open-handed','From jud, generosity at its fullest.','جواد','jah-WAHD',52),
('Khalifa','arabic','boy','successor, steward','One who carries on, a name of history and stewardship.','خليفة','kha-LEE-fah',50),
('Munir','arabic','boy','luminous, shining','From nara, to give light. The illuminating one.','منير','moo-NEER',50),
('Nadim','arabic','boy','companion, drinking friend','The trusted friend of gatherings, warm and loyal.','نديم','nah-DEEM',40),
('Qusay','arabic','boy','distant, far-reaching','The name of the Prophet''s ancestor, keeper of Mecca.','قصي','koo-SYE',38),
('Rashad','arabic','boy','right guidance, good sense','From rashada, to be rightly guided.','رشاد','rah-SHAHD',52),
('Riyad','arabic','boy','gardens, meadows','The plural of rawda, gardens of paradise.','رياض','ree-YAHD',50),
('Tamim','arabic','boy','complete, perfect','From tamama, to be whole and complete.','تميم','tah-MEEM',42),
('Walid','arabic','boy','newborn','From walada, to be born, the new life itself.','وليد','wah-LEED',54),
('Zaki','arabic','boy','pure, innocent, quick-witted','From zaka, to be pure and to grow.','زكي','ZAH-kee',46),
('Amani','arabic','girl','wishes, aspirations','The plural of umniya, hopes and dreams.','أماني','ah-MAH-nee',54),
('Arwa','arabic','girl','graceful mountain gazelle','From the mountain of Arwa, elegance and poise.','أروى','AHR-wah',50),
('Aziza','arabic','girl','precious, cherished, mighty','The feminine of Aziz, dear and powerful.','عزيزة','ah-ZEE-zah',46),
('Basma','arabic','girl','smile','From basama, to smile. Joy in a single word.','بسمة','BAS-mah',52),
('Dunya','arabic','girl','the world, earthly life','The world itself, from adna, nearer and lower.','دنيا','DOON-yah',44),
('Hanan','arabic','girl','mercy, compassion','From hann, tenderness of heart.','حنان','hah-NAHN',50),
('Manal','arabic','girl','achievement, attainment','From nala, to attain one''s goal.','منال','mah-NAHL',46),
('Menna','arabic','girl','grace, kindness bestowed','From minna, grace and favor.','منة','MEN-nah',42),
('Naima','arabic','girl','comfort, bliss, tranquil joy','From nama, to live in ease and delight.','نعيمة','nah-EE-mah',42),
('Noura','arabic','girl','light, radiant one','The diminutive of nur, a small tender light.','نورة','NOO-rah',58),
('Ranya','arabic','girl','gazing intently, beautiful eyes','From rana, to gaze with delight.','رانية','RAHN-yah',46),
('Shaima','arabic','girl','a beauty mark, sign of grace','The mole of distinction, an emblem of rare beauty.','شيماء','shy-MAH',44)
ON CONFLICT (root, lower(name)) DO NOTHING;
