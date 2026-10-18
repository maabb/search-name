/*
# Warmer name descriptions (fixed)

1. Plain-English explanation
- Every name card now opens with a warm, personal line before the
  factual description, written like a small wish rather than an
  encyclopedia entry.
- This is the corrected version of the previous attempt: the template
  pick now uses an absolute hash value, so no name can end up with a
  null description. Rows already updated are detected by their prefix
  and skipped, so nothing is ever double-prefixed.
- The full-text and fuzzy search indexes are generated directly from
  the description column, so they refresh automatically.

2. Tables modified
- `names`: the `description` column of every row is rewritten as
  "<warm wish line> <original description>". The original factual text
  (etymology, history, usage) is fully preserved.

3. Security changes
- None. Data update only, performed on the server.
*/

DO $$
DECLARE
  r record;
  m text;
  lead text;
  templates text[] := array[
    'A quiet wish for a lifetime: %s.',
    'Cherished for what it means — %s — a name that feels like a warm room.',
    'At its heart, this name speaks of %s.',
    'A little letter of a name; it whispers of %s.',
    'Rooted in %s, the kind of name that grows with its person.',
    'A name to whisper at bedtime: %s.',
    'Given in love, it means %s.',
    'Soft-spoken but lasting, this name is all about %s.'
  ];
  prefixes text[] := array[
    'A quiet wish for a lifetime:%',
    'Cherished for what it means%',
    'At its heart, this name speaks of %',
    'A little letter of a name%',
    'Rooted in %, the kind of name%',
    'A name to whisper at bedtime:%',
    'Given in love, it means %',
    'Soft-spoken but lasting%'
  ];
  idx int;
BEGIN
  FOR r IN
    SELECT id, name, meaning, description FROM names
    WHERE NOT (description LIKE ANY (prefixes))
  LOOP
    m := trim(split_part(coalesce(r.meaning, ''), ',', 1));
    IF m = '' THEN
      CONTINUE;
    END IF;
    idx := (abs(hashtext(r.name)) % array_length(templates, 1)) + 1;
    lead := replace(templates[idx], '%s', m);
    UPDATE names
    SET description = lead || ' ' || r.description
    WHERE id = r.id;
  END LOOP;
END $$;
