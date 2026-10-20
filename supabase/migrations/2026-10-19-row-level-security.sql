-- Row-level security for Rebuilt by Ryan.
--
-- Before this, the public anon key could read and change every row. After it:
--   * the coach signs in to the dashboard (Supabase Auth, email + password) and the `authenticated` role can do everything;
--   * a client never signs in: the client app sends their portal token in an `x-client-token` header, and the `anon`
--     role can only see and write rows that belong to the client with that token.
-- Run once in the SQL editor (Supabase dashboard → SQL → New query → paste → Run). Safe to re-run.
-- Create the coach's login first: Authentication → Users → Add user → email + password, tick "Auto confirm user".

-- The token the client app sends, and the client it belongs to.
create or replace function public.client_token() returns text
  language sql stable as $$
  select nullif(current_setting('request.headers', true)::json ->> 'x-client-token', '')
$$;

-- security definer so the lookup works even though clients itself is protected.
create or replace function public.current_client_id() returns uuid
  language sql stable security definer set search_path = public as $$
  select id from public.clients where access_token = public.client_token() and status <> 'inactive'
$$;

-- Tables with a client_id column: the client may read theirs; the ones listed under `writable` they may also insert/update/delete.
do $$
declare
  t text;
  writable text[] := array['check_ins','checklist_completions','daily_logs','daily_steps','exercise_logs','messages','progress_photos'];
begin
  foreach t in array array['programs','macros','meal_plans','supplements','cardio_protocols','check_ins','checklist_completions',
                           'daily_logs','daily_steps','exercise_logs','messages','progress_photos'] loop
    execute format('alter table public.%I enable row level security', t);
    execute format('drop policy if exists coach_all on public.%I', t);
    execute format('create policy coach_all on public.%I for all to authenticated using (true) with check (true)', t);
    execute format('drop policy if exists client_read on public.%I', t);
    execute format('create policy client_read on public.%I for select to anon using (client_id = public.current_client_id())', t);
    execute format('drop policy if exists client_write on public.%I', t);
    if t = any(writable) then
      execute format('create policy client_write on public.%I for all to anon using (client_id = public.current_client_id()) with check (client_id = public.current_client_id())', t);
    end if;
  end loop;
end $$;

-- payments: coach only; the client app never shows them.
alter table public.payments enable row level security;
drop policy if exists coach_all on public.payments;
create policy coach_all on public.payments for all to authenticated using (true) with check (true);
drop policy if exists client_read on public.payments;
drop policy if exists client_write on public.payments;

-- clients: the client may read their own row only.
alter table public.clients enable row level security;
drop policy if exists coach_all on public.clients;
create policy coach_all on public.clients for all to authenticated using (true) with check (true);
drop policy if exists client_read on public.clients;
create policy client_read on public.clients for select to anon using (id = public.current_client_id());

-- Child tables reach the client through their parent.
alter table public.workouts enable row level security;
drop policy if exists coach_all on public.workouts;
create policy coach_all on public.workouts for all to authenticated using (true) with check (true);
drop policy if exists client_read on public.workouts;
create policy client_read on public.workouts for select to anon
  using (exists (select 1 from public.programs p where p.id = program_id and p.client_id = public.current_client_id()));

alter table public.exercises enable row level security;
drop policy if exists coach_all on public.exercises;
create policy coach_all on public.exercises for all to authenticated using (true) with check (true);
drop policy if exists client_read on public.exercises;
create policy client_read on public.exercises for select to anon
  using (exists (select 1 from public.workouts w join public.programs p on p.id = w.program_id where w.id = workout_id and p.client_id = public.current_client_id()));

alter table public.meals enable row level security;
drop policy if exists coach_all on public.meals;
create policy coach_all on public.meals for all to authenticated using (true) with check (true);
drop policy if exists client_read on public.meals;
create policy client_read on public.meals for select to anon
  using (exists (select 1 from public.meal_plans m where m.id = meal_plan_id and m.client_id = public.current_client_id()));

alter table public.meal_foods enable row level security;
drop policy if exists coach_all on public.meal_foods;
create policy coach_all on public.meal_foods for all to authenticated using (true) with check (true);
drop policy if exists client_read on public.meal_foods;
create policy client_read on public.meal_foods for select to anon
  using (exists (select 1 from public.meals ml join public.meal_plans mp on mp.id = ml.meal_plan_id where ml.id = meal_id and mp.client_id = public.current_client_id()));

alter table public.cardio_sessions enable row level security;
drop policy if exists coach_all on public.cardio_sessions;
create policy coach_all on public.cardio_sessions for all to authenticated using (true) with check (true);
drop policy if exists client_read on public.cardio_sessions;
create policy client_read on public.cardio_sessions for select to anon
  using (exists (select 1 from public.cardio_protocols c where c.id = protocol_id and c.client_id = public.current_client_id()));

-- Progress photos live in the private bucket under <portal token>/...
-- The project's older storage policies let any valid token touch any folder; progress-photos is the only bucket, so drop them all first.
do $$
declare p record;
begin
  for p in select policyname from pg_policies where schemaname = 'storage' and tablename = 'objects' loop
    execute format('drop policy %I on storage.objects', p.policyname);
  end loop;
end $$;
drop policy if exists coach_photos on storage.objects;
create policy coach_photos on storage.objects for all to authenticated
  using (bucket_id = 'progress-photos') with check (bucket_id = 'progress-photos');
drop policy if exists client_photos on storage.objects;
create policy client_photos on storage.objects for all to anon
  using (bucket_id = 'progress-photos' and (storage.foldername(name))[1] = public.client_token())
  with check (bucket_id = 'progress-photos' and (storage.foldername(name))[1] = public.client_token());
