# Rundy Coaching — client portal

Live: https://rundycoaching.netlify.app · Owner: Ryan Rundhawa (@ryan.rundy)

A coaching portal for Ryan's online/in-person clients: the coach builds programs, meal plans, cardio and supplements, and the client logs workouts, steps, water, daily check-ins, weekly check-ins and progress photos.

This folder is an exact copy of the live site as of **2026-10-18** (Netlify deploy `6ac70580f3aaf598aac2acfd`). The only changes: the comment and meta tags Netlify injects into served pages were removed, and the files Netlify doesn't serve back (`_redirects`, `_headers`, the DB schema, the edge function) were rebuilt by hand.

---

## How it's built

**There's no framework, no build step and no package.json.** It's two big single-file HTML pages that call Supabase's REST API directly with `fetch`.

| File | What it is |
|---|---|
| `index.html` | **Coach dashboard** (desktop). Every path serves it, via `_redirects`. Opens on a sign-in screen (Supabase Auth, email + password), then **Today**: a ring counting who has checked in, the daily and weekly check-in rows (weekly first on Sun/Mon, "Late" from Monday), a Message button on every row, unread messages ("Needs a reply", client suggestions tagged "Idea") and this week's wins. Then Clients (rows → client page with the week strip, today's row, the latest weekly check-in, personal bests, plan tabs), Programs, Cardio, Nutrition, Messages (unread first), Payments. Same look as the client app; `DESIGN.md` covers both. |
| `client.html` | **Client app**, shown on screen as "Rebuilt by Ryan". Opened as `client.html?t=<access_token>`; the token comes from `clients.access_token`. The first open shows a welcome screen asking for a short-term and a long-term goal (saved on `clients`, editable from Plan, shown to the coach on the client's page; Skip asks once). Five tabs: **Today** (the day's checklist: session, morning weight, how you feel, steps, water, supplements, meal plan, and the weekly check-in when it's due), **Train** (one row per set: weight × reps × RPE, "Same as last time", finish-workout summary, personal-best sheet), **Plan** (the client's own goals, then what the coach wrote: macros, meals, supplements, cardio), **Progress** (photos first, then lift of the week with a Share button, personal bests, strength trends, weight, weekly check-in form), **Messages** (with a "Suggest" toggle for app ideas). Installable as a PWA, and it saves the token in localStorage under `rc_token`. Titles use the self-hosted font in `fonts/`; the design system is in `DESIGN.md`, product context in `PRODUCT.md`. |
| `manifest.webmanifest`, `sw.js`, `icons/` | PWA install. The manifest deliberately has **no `start_url`**, so the installed app keeps its `?t=` token. `sw.js` is network-first and only touches same-origin requests. |
| `_redirects` | `/*  /index.html  200` |
| `_headers` | Security headers, plus the manifest content type. |
| `supabase/schema.sql` | Full DB schema (structure only, no client data). Run it on a fresh Supabase project to get a sandbox. |
| `supabase/migrations/` | Schema changes made after the snapshot, one file each, in date order. Run each one in the SQL editor on the test project first, then on the live project when the matching app change goes live. `2026-10-19-per-set-logs.sql` adds `exercise_logs.set_index` and `rpe` for the new Train tab. `2026-10-19-row-level-security.sql` turns on RLS everywhere (see "Security" below); create the coach's login **before** running it. `2026-10-20-client-goals.sql` adds the client's own goals (`clients.goal_short_term`, `goal_long_term`, `goals_set_at`) and lets a client write only those three columns of their own row; the welcome screen needs it. Files run in name order. |
| `scripts/build-preview.py` | Builds `dist-preview/`: both apps pointed at a **test** Supabase project (URL and anon key passed on the command line), with relative asset paths so the folder works from a sub-path. The `preview` branch holds that output for GitHub Pages (Settings → Pages → branch `preview`), so a phone can try the app against fake data: `…/client.html?t=<token>` and `…/index.html`. |
| `supabase/test-rls.sh` | Applies the schema and every migration to a throwaway local Postgres and checks the RLS policies (a client sees only their rows, forged writes fail, no token sees nothing). Run it after any schema change. |
| `supabase/functions/steps/` | Edge function for Apple Health step sync. Built but **dormant**: Ryan chose not to roll it out. |

Backend: Supabase project `emrtizvqzjkfrpgyrljn`. `SB_URL` / `SB_KEY` are near the top of each HTML file's `<script>`. The key is the **anon** key; no service-role key appears anywhere in this code.

### Security
- **Coach:** signs in on the dashboard with Supabase Auth (email + password). The session is kept in localStorage (`rc_coach_session`), refreshed a minute before it expires, and its access token replaces the anon key on every request, so the database sees the `authenticated` role. Create the login in the Supabase dashboard: Authentication → Users → Add user → email + password → tick "Auto confirm user". Only Ryan needs one.
- **Clients:** never sign in. The client app sends the portal token as an `x-client-token` header on every request (and on photo uploads), and the RLS policies match it against `clients.access_token` (`current_client_id()` in the migration). A client can read their own plan and write their own logs, check-ins, messages and photos, nothing else; inactive clients get nothing.
- Until `2026-10-19-row-level-security.sql` has been run on a project, that project is still wide open to the anon key, login screen or not.

### Running it locally
```bash
npx serve .
```
Then open `http://localhost:3000/` for the coach view, or `http://localhost:3000/client.html?t=<token>` for a client.

> ⚠️ **As shipped, the HTML points at the LIVE database with real client data.** Before you change anything, create your own free Supabase project, run `supabase/schema.sql` and the files in `supabase/migrations/` in it, add a coach user (Authentication → Users), and swap `SB_URL`/`SB_KEY` in both files to your project's values. Add a test client with the insert at the bottom of the schema file.

---

## Known problems, worst first

### 1. ✅ Database security (fixed Oct 2026, once the migration is run)
Until October 2026, RLS was off on all 19 tables and the anon key is in the page source, so anyone could read or change every client's data. `supabase/migrations/2026-10-19-row-level-security.sql` plus the coach login fix this; see "Security" above. **The live project is still open until that migration has been run there.**

### 2. ✅ Coach login (fixed Oct 2026)
The dashboard now opens on a sign-in screen. The coach's user has to exist in Supabase Auth first (see "Security").

### 3. 🟠 No version control or deploy process
Deploys were manual drag-and-drops, and each one **replaces the whole site**. That already caused one silent regression (an Aug 4 drop wiped two days of work, which had to be recovered by 3-way merging old deploys). From now on, this folder/repo is the source of truth: connect it to Netlify via Git so deploys come from commits.
- If you ever deploy manually, include **every** file (`index.html`, `client.html`, `_redirects`, `_headers`, `manifest.webmanifest`, `sw.js`, `icons/`).
- Netlify never serves `_redirects`/`_headers` back, so they can't be recovered from the live site. Keep them in the repo.

### 4. 🟡 Unit mismatch: `weight_kg` columns hold pounds
The UI shows **lbs**, but the columns are named `weight_kg` (clients, check_ins, exercise_logs, daily_logs). This was a deliberate relabel, not a conversion: each row holds whatever number the client typed. **Don't run a kg→lbs conversion on old rows.** Renaming the columns (e.g. to `weight`) would be a good cleanup, but it touches both HTML files. The client app has `const UNIT='lbs'` and `fmtW()` helpers.

### 5. ✅ Settings that could only be changed with SQL (fixed Oct 2026)
The client-detail screen has an **Edit** button for the goal, the note shown on the client's Today screen (`special_note`), the water goal (`water_goal_l`), status and coach notes.

### 6. 🟡 "Newest wins" ordering
The client app always loads the **newest program** by `created_at`, and meal-plan tabs are ordered `created_at DESC`. There's no "active" flag, so swapping a client back to an older plan means editing timestamps.

### 7. 🟢 Smaller things
- `daily_logs.client_id` is the only FK **without** `on delete cascade`. The coach dashboard deletes a client's daily logs first so the delete works; a migration adding the cascade would still be cleaner.
- Date logic must stay **local time**: both files use a `localDate()` helper. `index.html` used UTC until Aug 2026, which made "logged today" show nobody in the evening; two leftovers (the week range and the Steps tab) were fixed in Oct 2026. Don't reintroduce `toISOString().slice(0,10)`.
- Deletes in the coach dashboard (exercises, supplements, cardio sessions) wait six seconds behind an Undo toast before reaching the database; navigating away or closing the tab commits them.
- One row, "Ryan Rundhawa (coach test)" (status `inactive`), is Ryan's test profile. Exclude it from client counts.
- Sharing a personal best: the client app draws a black 1080×1350 PR card on a canvas (exercise, weight × reps, date, the wordmark) and hands it to the phone's share sheet (`navigator.share` with a file). It falls back to sharing the text, then to copying it. The card is drawn before the tap so Safari accepts the share call.
- Apple Health sync: `HEALTH_SHORTCUT_URL` in client.html is intentionally empty, which keeps the Steps-tab sync card hidden. The `steps` edge function, `log_steps()` and `daily_steps.source` are unused but harmless.
- Both files are very large single files. Splitting them into JS/CSS modules (or a small Vite app) would make review much easier, but it's optional.

---

## Data model cheat sheet
`clients` → `programs` → `workouts` → `exercises` → `exercise_logs` (since Oct 2026 one row per set with `set_index` and `rpe`; older rows are one per exercise per day with reps as a comma list like `"8,8,7"`, and both apps read both shapes)
`clients` → `meal_plans` → `meals` → `meal_foods`; plus `macros` and `supplements`
`clients` → `cardio_protocols` → `cardio_sessions`
Per-client tracking: `check_ins`, `daily_logs`, `daily_steps`, `checklist_completions`, `progress_photos` (storage path in the private `progress-photos` bucket, under `<access_token>/`), `messages`, `payments`.
