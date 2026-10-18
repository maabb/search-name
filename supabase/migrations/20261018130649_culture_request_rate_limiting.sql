/*
# Rate limiting for culture suggestions

1. Plain-English explanation
- Protects the "Missing a culture?" suggestion form from spam: a flood
  of fake submissions from one visitor can no longer reach the database.
- Each visitor is allowed 5 suggestions per hour (sliding window) and at
  most 20 per day. Over that, the server politely refuses.
- Suggestions are now sent through a server endpoint that counts recent
  submissions first; the browser can no longer write to the suggestions
  table directly.

2. Schema changes
- New table `suggestion_rate_events`: one row per accepted suggestion,
  storing an anonymized visitor key (hashed IP) and the time. Old rows
  are pruned automatically as part of each check.
- Index on (visitor_key, created_at) so counting a visitor's recent
  events stays fast.

3. Security changes
- Direct browser INSERT on `culture_requests` is REVOKED for anon and
  authenticated; the only write path is the new SECURITY DEFINER
  function `request_culture`, which enforces the rate limits,
  normalizes/validates input length, and stores nothing forgeable.
- RLS on `culture_requests` remains owner-only for reads; the insert
  happens inside the definer function, bypassing RLS by design.

4. Notes
- The visitor key is a SHA-256 hash of the caller's IP, so raw IPs are
  never stored.
*/

CREATE TABLE IF NOT EXISTS suggestion_rate_events (
  id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  visitor_key text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_suggestion_rate_events_visitor_time
  ON suggestion_rate_events (visitor_key, created_at);

ALTER TABLE suggestion_rate_events ENABLE ROW LEVEL SECURITY;

-- No policies: the table is only read/written by the definer function
-- below; anon and authenticated have no direct access at all.

CREATE OR REPLACE FUNCTION request_culture(
  p_culture_name text,
  p_message text DEFAULT NULL,
  p_email text DEFAULT NULL,
  p_visitor_key text DEFAULT NULL
)
RETURNS uuid
LANGUAGE plpgsql SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_culture text;
  v_message text;
  v_email text;
  v_visitor text;
  v_hour_count integer;
  v_day_count integer;
  v_new_id uuid;
BEGIN
  -- Resolve and validate the visitor key (server-provided, hashed IP)
  v_visitor := nullif(trim(coalesce(p_visitor_key, '')), '');
  IF v_visitor IS NULL OR char_length(v_visitor) <> 64 OR v_visitor !~ '^[0-9a-f]+$' THEN
    RAISE EXCEPTION 'INVALID_REQUEST';
  END IF;

  -- Normalize and validate input
  v_culture := nullif(trim(coalesce(p_culture_name, '')), '');
  IF v_culture IS NULL OR char_length(v_culture) > 80 THEN
    RAISE EXCEPTION 'INVALID_REQUEST';
  END IF;

  v_message := nullif(trim(coalesce(p_message, '')), '');
  IF v_message IS NOT NULL AND char_length(v_message) > 500 THEN
    RAISE EXCEPTION 'INVALID_REQUEST';
  END IF;

  v_email := nullif(lower(trim(coalesce(p_email, ''))), '');
  IF v_email IS NOT NULL THEN
    IF char_length(v_email) > 120 OR v_email !~* '^[^@[:space:]]+@[^@[:space:]]+\.[^@[:space:]]+$' THEN
      RAISE EXCEPTION 'INVALID_REQUEST';
    END IF;
  END IF;

  -- Prune stale events (older than 1 day) to keep the table small
  DELETE FROM suggestion_rate_events
  WHERE created_at < now() - interval '24 hours';

  -- Sliding-window counts for this visitor
  SELECT count(*) INTO v_hour_count
  FROM suggestion_rate_events
  WHERE visitor_key = v_visitor
    AND created_at >= now() - interval '1 hour';

  SELECT count(*) INTO v_day_count
  FROM suggestion_rate_events
  WHERE visitor_key = v_visitor
    AND created_at >= now() - interval '24 hours';

  IF v_hour_count >= 5 THEN
    RAISE EXCEPTION 'RATE_LIMITED';
  END IF;
  IF v_day_count >= 20 THEN
    RAISE EXCEPTION 'RATE_LIMITED';
  END IF;

  -- Record the event and the suggestion together
  INSERT INTO suggestion_rate_events (visitor_key) VALUES (v_visitor);

  INSERT INTO culture_requests (culture_name, message, email)
  VALUES (v_culture, v_message, v_email)
  RETURNING id INTO v_new_id;

  RETURN v_new_id;
END;
$$;

REVOKE EXECUTE ON FUNCTION request_culture(text, text, text, text) FROM anon, authenticated;

-- Close the direct write path: only the definer function may insert
REVOKE INSERT ON culture_requests FROM anon, authenticated;
