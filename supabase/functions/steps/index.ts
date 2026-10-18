// Apple Health step sync for the Rundy Coaching iOS Shortcut.
// GET/POST /functions/v1/steps?t=<client access_token>&steps=<today's steps>&date=<yyyy-MM-dd>
// Auth is the client's personal access_token, checked inside public.log_steps(), so the Shortcut
// needs no headers. Replies in plain text because Shortcuts shows the reply when run by hand.
// Deployed with verify_jwt = false.

const SB_URL = Deno.env.get('SUPABASE_URL')!;
const SB_KEY = Deno.env.get('SUPABASE_ANON_KEY')!;

const reply = (msg: string, status = 200) =>
  new Response(msg + '\n', { status, headers: { 'Content-Type': 'text/plain; charset=utf-8' } });

Deno.serve(async (req: Request) => {
  const q = new URL(req.url).searchParams;
  const token = (q.get('t') || '').trim();
  // Shortcuts may send the Health value as "8,123", "8123.0" or "8123 steps" — take the first number.
  const rawSteps = (q.get('steps') || '').replace(/,/g, '');
  const m = rawSteps.match(/\d+(\.\d+)?/);
  const date = (q.get('date') || '').trim();

  if (!token) return reply('❌ Missing sync code. Open the Rundy app → Steps tab and copy your code into the shortcut.', 400);
  if (!m) return reply('No steps found in Apple Health yet today — try again later.', 400);
  const steps = Math.round(parseFloat(m[0]));
  const validDate = /^\d{4}-\d{2}-\d{2}$/.test(date) ? date : null;

  const r = await fetch(SB_URL + '/rest/v1/rpc/log_steps', {
    method: 'POST',
    headers: { apikey: SB_KEY, Authorization: 'Bearer ' + SB_KEY, 'Content-Type': 'application/json' },
    body: JSON.stringify({ p_token: token, p_steps: steps, p_date: validDate }),
  });
  if (!r.ok) {
    const err = await r.text();
    if (err.includes('unknown code')) return reply('❌ Sync code not recognized. Copy it again from the Rundy app → Steps tab.', 401);
    console.error('log_steps failed', r.status, err);
    return reply('❌ Couldn’t sync right now — it will try again next time.', 500);
  }
  const out = await r.json();
  return reply(`✅ ${Number(out.steps).toLocaleString('en-CA')} steps synced for ${out.date}`);
});
