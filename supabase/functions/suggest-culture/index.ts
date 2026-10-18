import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

async function sha256Hex(input: string): Promise<string> {
  const data = new TextEncoder().encode(input);
  const digest = await crypto.subtle.digest("SHA-256", data);
  return Array.from(new Uint8Array(digest))
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");
}

function clientIp(req: Request): string {
  const forwarded = req.headers.get("x-forwarded-for");
  if (forwarded) return forwarded.split(",")[0].trim();
  return req.headers.get("x-real-ip") ?? "unknown";
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    if (req.method !== "POST") {
      return new Response(
        JSON.stringify({ error: "Method not allowed" }),
        { status: 405, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      );
    }

    const body = await req.json().catch(() => null);
    if (
      !body ||
      typeof body.cultureName !== "string" ||
      (body.message !== undefined && body.message !== null && typeof body.message !== "string") ||
      (body.email !== undefined && body.email !== null && typeof body.email !== "string")
    ) {
      return new Response(
        JSON.stringify({ error: "INVALID_REQUEST" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      );
    }

    const pepper = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "bolt-pepper";
    const visitorKey = await sha256Hex(`${clientIp(req)}:${pepper}`);

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    );

    const { data, error } = await supabase.rpc("request_culture", {
      p_culture_name: body.cultureName,
      p_message: body.message ?? null,
      p_email: body.email ?? null,
      p_visitor_key: visitorKey,
    });

    if (error) {
      const msg = String(error.message ?? "");
      if (msg.includes("RATE_LIMITED")) {
        return new Response(
          JSON.stringify({ error: "RATE_LIMITED" }),
          { status: 429, headers: { ...corsHeaders, "Content-Type": "application/json" } },
        );
      }
      // Never echo internal detail to the caller
      console.error("request_culture failed", msg);
      return new Response(
        JSON.stringify({ error: "INVALID_REQUEST" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      );
    }

    return new Response(JSON.stringify({ id: data }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (err) {
    console.error("suggest-culture error", err);
    return new Response(
      JSON.stringify({ error: "Something went wrong, please try again." }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } },
    );
  }
});
