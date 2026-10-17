/*
# Prevent duplicate names per culture

1. Plain-English explanation
- Adds a uniqueness safeguard so the same name can never appear twice within
  the same culture (root). Names are compared case-insensitively, so "Ayla"
  and "ayla" count as the same entry. The same name in two different cultures
  (e.g. Felix in English and German) remains allowed.

2. Schema changes
- Creates a unique index `uq_names_root_name_lower` on `names (root, lower(name))`.

3. Security changes
- None. Row Level Security policies are untouched.

4. Important notes
- Pre-existing exact duplicates (Ibrahim, Sami, Zainab in Arabic) were merged
  before this migration in a separate data cleanup, keeping the earliest copy.
*/

CREATE UNIQUE INDEX IF NOT EXISTS uq_names_root_name_lower
  ON names (root, lower(name));
