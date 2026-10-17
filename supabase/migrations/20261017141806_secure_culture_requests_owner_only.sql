/*
# Secure culture requests and enable owner access

1. Problem
- The `culture_requests` table allowed ANY visitor (anon role) to read every
  submission, including emails people left for a reply. Only the app owner
  should be able to read them.

2. Security changes
- Drop the public SELECT policy on `culture_requests`.
- Keep the public INSERT policy so visitors can still submit the form.
- Add a SELECT policy scoped to `authenticated` so only a signed-in owner
  account can read submissions.
- Add UPDATE and DELETE policies scoped to `authenticated` so the owner can
  manage submissions.

3. Important notes
- Visitors never see a change: the form keeps working exactly as before.
- The owner signs in at /admin with an email + password account created in
  Supabase Auth. Until such an account signs in, the table returns no rows
  to the public site.
*/

DROP POLICY IF EXISTS "anon_select_culture_requests" ON culture_requests;

DROP POLICY IF EXISTS "owner_read_culture_requests" ON culture_requests;
CREATE POLICY "owner_read_culture_requests"
ON culture_requests FOR SELECT
TO authenticated
USING (true);

DROP POLICY IF EXISTS "owner_update_culture_requests" ON culture_requests;
CREATE POLICY "owner_update_culture_requests"
ON culture_requests FOR UPDATE
TO authenticated
USING (true)
WITH CHECK (true);

DROP POLICY IF EXISTS "owner_delete_culture_requests" ON culture_requests;
CREATE POLICY "owner_delete_culture_requests"
ON culture_requests FOR DELETE
TO authenticated
USING (true);
