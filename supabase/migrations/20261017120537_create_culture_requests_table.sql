/*
# Create culture_requests table for user-submitted suggestions

1. Plain-English explanation
   The baby-name app currently covers English, German, Turkish and Arabic
   names. Users may want names from other cultures (Persian, Hindi,
   Spanish, Nigerian, ...). This table stores every culture or feedback
   suggestion a visitor submits through the "Suggest a culture" form so
   the owner can see what users want and add new cultures later.

2. New Tables
   - `culture_requests`
     - `id` (uuid, primary key, auto-generated)
     - `culture_name` (text, not null) — the culture the user wants, e.g. "Persian"
     - `message` (text, nullable) — optional extra comment from the user
     - `email` (text, nullable) — optional contact if the user wants a reply
     - `status` (text, not null, default 'new') — 'new' | 'reviewed' | 'added',
       lets the owner track which requests have been handled
     - `created_at` (timestamptz, defaults to now)

3. Security
   - RLS enabled on `culture_requests`.
   - Single-tenant app with no sign-in: policies are scoped TO anon,
     authenticated.
   - Anyone can INSERT a suggestion (with check true).
   - Anyone can SELECT suggestions (intentionally public/shared so the
     form and any future "most requested" display work with the anon key).
   - No UPDATE/DELETE for anon users: visitors cannot edit or remove
     other people's suggestions; only the owner (via a privileged
     connection) manages status.

4. Notes
   - This is intentionally open by design: it collects public feedback,
     contains no personal data beyond an optional email the user chose
     to give, and no ownership model applies.
*/

CREATE TABLE IF NOT EXISTS culture_requests (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  culture_name text NOT NULL,
  message text,
  email text,
  status text NOT NULL DEFAULT 'new',
  created_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE culture_requests ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "anon_insert_culture_requests" ON culture_requests;
CREATE POLICY "anon_insert_culture_requests" ON culture_requests
FOR INSERT
TO anon, authenticated
WITH CHECK (true);

DROP POLICY IF EXISTS "anon_select_culture_requests" ON culture_requests;
CREATE POLICY "anon_select_culture_requests" ON culture_requests
FOR SELECT
TO anon, authenticated
USING (true);
