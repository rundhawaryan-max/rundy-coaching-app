-- Rundy Coaching — database schema (structure only, NO client data).
-- Exported from the live Supabase project on 2026-10-18.
-- Run this in a FRESH Supabase project's SQL editor to get a sandbox copy to develop against.
-- Note: RLS is intentionally shown as it is live (disabled) — fixing that is item #1 in README.md.

create extension if not exists pgcrypto;

-- ── Core ─────────────────────────────────────────────────────────
create table public.clients (
  id uuid not null default gen_random_uuid(),
  name text not null,
  email text,
  phone text,
  goal text,
  status text default 'active'::text,
  start_date date default now(),
  weight_kg numeric,            -- NOTE: holds whatever unit the client typed; app displays it as lbs
  body_fat numeric,
  notes text,
  created_at timestamp with time zone default now(),
  access_token text,            -- the client's login: client.html?t=<access_token>
  step_goal integer default 8000,
  water_goal_l numeric default 4,
  special_note text,            -- speech bubble on client Home/Workout tabs (no coach UI yet)
  constraint clients_pkey primary key (id),
  constraint clients_access_token_key unique (access_token)
);

create or replace function public.set_client_access_token()
 returns trigger language plpgsql as $$
begin
  if new.access_token is null then
    new.access_token := encode(gen_random_bytes(16), 'hex');
  end if;
  return new;
end; $$;

create trigger trg_set_access_token before insert on public.clients
  for each row execute function set_client_access_token();

-- ── Training ─────────────────────────────────────────────────────
create table public.programs (
  id uuid not null default gen_random_uuid(),
  name text not null,
  client_id uuid,
  weeks integer default 8,
  goal text,
  created_at timestamp with time zone default now(),
  constraint programs_pkey primary key (id),
  constraint programs_client_id_fkey foreign key (client_id) references clients(id) on delete cascade
);

create table public.workouts (
  id uuid not null default gen_random_uuid(),
  program_id uuid,
  name text not null,
  day_of_week text,
  order_index integer default 0,
  created_at timestamp with time zone default now(),
  constraint workouts_pkey primary key (id),
  constraint workouts_program_id_fkey foreign key (program_id) references programs(id) on delete cascade
);

create table public.exercises (
  id uuid not null default gen_random_uuid(),
  workout_id uuid,
  name text not null,
  sets integer default 3,
  reps text default '8-12'::text,
  rest_seconds integer default 90,
  notes text,
  order_index integer default 0,
  constraint exercises_pkey primary key (id),
  constraint exercises_workout_id_fkey foreign key (workout_id) references workouts(id) on delete cascade
);

create table public.exercise_logs (
  id uuid not null default gen_random_uuid(),
  exercise_id uuid,
  client_id uuid,
  date date default current_date,
  weight_kg numeric,
  reps_completed text,          -- text on purpose: "8" or "8,8,7"
  notes text,
  created_at timestamp with time zone default now(),
  constraint exercise_logs_pkey primary key (id),
  constraint exercise_logs_client_id_fkey foreign key (client_id) references clients(id) on delete cascade,
  constraint exercise_logs_exercise_id_fkey foreign key (exercise_id) references exercises(id) on delete cascade
);

create table public.cardio_protocols (
  id uuid not null default gen_random_uuid(),
  name text not null,
  client_id uuid,
  weeks integer default 8,
  goal text,
  created_at timestamp with time zone default now(),
  constraint cardio_protocols_pkey primary key (id),
  constraint cardio_protocols_client_id_fkey foreign key (client_id) references clients(id) on delete cascade
);

create table public.cardio_sessions (
  id uuid not null default gen_random_uuid(),
  protocol_id uuid,
  name text not null,
  day_of_week text,
  modality text default 'Incline Walk'::text,
  duration_minutes integer default 30,
  intensity text default 'Zone 2'::text,
  notes text,
  order_index integer default 0,
  created_at timestamp with time zone default now(),
  constraint cardio_sessions_pkey primary key (id),
  constraint cardio_sessions_protocol_id_fkey foreign key (protocol_id) references cardio_protocols(id) on delete cascade
);

-- ── Nutrition ────────────────────────────────────────────────────
create table public.macros (
  id uuid not null default gen_random_uuid(),
  client_id uuid,
  calories integer,
  protein_g integer,
  carbs_g integer,
  fat_g integer,
  effective_date date default now(),
  notes text,
  constraint macros_pkey primary key (id),
  constraint macros_client_id_fkey foreign key (client_id) references clients(id) on delete cascade
);

create table public.meal_plans (
  id uuid not null default gen_random_uuid(),
  client_id uuid,
  name text not null,
  day_label text,
  created_at timestamp with time zone default now(),
  constraint meal_plans_pkey primary key (id),
  constraint meal_plans_client_id_fkey foreign key (client_id) references clients(id) on delete cascade
);

create table public.meals (
  id uuid not null default gen_random_uuid(),
  meal_plan_id uuid,
  name text not null,
  time_label text,
  order_index integer default 0,
  constraint meals_pkey primary key (id),
  constraint meals_meal_plan_id_fkey foreign key (meal_plan_id) references meal_plans(id) on delete cascade
);

create table public.meal_foods (
  id uuid not null default gen_random_uuid(),
  meal_id uuid,
  food_name text not null,
  amount_g numeric,
  calories integer,
  protein_g numeric,
  carbs_g numeric,
  fat_g numeric,
  order_index integer default 0,
  constraint meal_foods_pkey primary key (id),
  constraint meal_foods_meal_id_fkey foreign key (meal_id) references meals(id) on delete cascade
);

create table public.supplements (
  id uuid not null default gen_random_uuid(),
  client_id uuid,
  name text not null,
  dosage text,
  timing text default 'Morning'::text,
  notes text,
  order_index integer default 0,
  created_at timestamp with time zone default now(),
  constraint supplements_pkey primary key (id),
  constraint supplements_client_id_fkey foreign key (client_id) references clients(id) on delete cascade
);

-- ── Tracking ─────────────────────────────────────────────────────
create table public.check_ins (
  id uuid not null default gen_random_uuid(),
  client_id uuid,
  date date default now(),
  weight_kg numeric,
  body_fat numeric,
  energy integer,
  sleep_quality integer,
  notes text,
  photos text[],
  created_at timestamp with time zone default now(),
  win_of_week text,
  improve_next_week text,
  waist_cm numeric,
  skinfolds text,
  blood_pressure text,
  constraint check_ins_pkey primary key (id),
  constraint check_ins_client_id_fkey foreign key (client_id) references clients(id) on delete cascade
);

create table public.daily_logs (
  id uuid not null default gen_random_uuid(),
  client_id uuid,
  date date default current_date,
  refreshed boolean,
  desire_to_train integer,
  digestive_issue text,
  untracked_food text,
  created_at timestamp with time zone default now(),
  weight_kg numeric,
  constraint daily_logs_pkey primary key (id),
  constraint daily_logs_client_id_fkey foreign key (client_id) references clients(id)   -- note: no ON DELETE CASCADE, unlike every other table
);

create table public.daily_steps (
  id uuid not null default gen_random_uuid(),
  client_id uuid,
  date date default current_date,
  steps integer not null,
  created_at timestamp with time zone default now(),
  source text not null default 'manual'::text,
  constraint daily_steps_pkey primary key (id),
  constraint daily_steps_client_id_date_key unique (client_id, date),
  constraint daily_steps_client_id_fkey foreign key (client_id) references clients(id) on delete cascade
);

create table public.checklist_completions (
  id uuid not null default gen_random_uuid(),
  client_id uuid,
  date date default current_date,
  item_type text not null,
  item_id text not null,
  completed boolean default true,
  created_at timestamp with time zone default now(),
  constraint checklist_completions_pkey primary key (id),
  constraint checklist_completions_client_id_date_item_type_item_id_key unique (client_id, date, item_type, item_id),
  constraint checklist_completions_client_id_fkey foreign key (client_id) references clients(id) on delete cascade
);

create table public.progress_photos (
  id uuid not null default gen_random_uuid(),
  client_id uuid,
  check_in_id uuid,
  url text not null,            -- storage path inside the progress-photos bucket, not a URL
  label text,
  taken_at date default now(),
  created_at timestamp with time zone default now(),
  constraint progress_photos_pkey primary key (id),
  constraint progress_photos_check_in_id_fkey foreign key (check_in_id) references check_ins(id) on delete set null,
  constraint progress_photos_client_id_fkey foreign key (client_id) references clients(id) on delete cascade
);

-- ── Coach ↔ client ───────────────────────────────────────────────
create table public.messages (
  id uuid not null default gen_random_uuid(),
  client_id uuid,
  sender text not null,
  body text not null,
  read boolean default false,
  created_at timestamp with time zone default now(),
  constraint messages_pkey primary key (id),
  constraint messages_client_id_fkey foreign key (client_id) references clients(id) on delete cascade
);

create table public.payments (
  id uuid not null default gen_random_uuid(),
  client_id uuid,
  amount_cad numeric not null,
  status text default 'pending'::text,
  description text,
  due_date date,
  paid_date date,
  created_at timestamp with time zone default now(),
  constraint payments_pkey primary key (id),
  constraint payments_client_id_fkey foreign key (client_id) references clients(id) on delete cascade
);

-- ── Indexes ──────────────────────────────────────────────────────
create index idx_supplements_client on public.supplements using btree (client_id);
create index idx_exercise_logs_client on public.exercise_logs using btree (client_id, exercise_id);
create index idx_checklist_client_date on public.checklist_completions using btree (client_id, date);

-- ── Apple Health step sync (dormant — Ryan chose not to roll it out) ──
create or replace function public.log_steps(p_token text, p_steps integer, p_date date default null)
 returns json language plpgsql security definer set search_path to 'public' as $$
declare cid uuid; d date := coalesce(p_date, current_date); out_steps integer;
begin
  select id into cid from clients where access_token = p_token;
  if cid is null then raise exception 'unknown code'; end if;
  if p_steps is null or p_steps < 0 or p_steps > 150000 then raise exception 'invalid step count'; end if;
  insert into daily_steps (client_id, date, steps, source) values (cid, d, p_steps, 'health')
  on conflict (client_id, date) do update
    set steps = greatest(daily_steps.steps, excluded.steps),
        source = case when excluded.steps >= daily_steps.steps then 'health' else daily_steps.source end
  returning steps into out_steps;
  return json_build_object('date', d, 'steps', out_steps);
end $$;

-- ── Storage: private progress-photos bucket, files under <access_token>/ ──
insert into storage.buckets (id, name, public) values ('progress-photos', 'progress-photos', false);

create policy "progress photos: read by client folder" on storage.objects for select to anon, authenticated
  using (bucket_id = 'progress-photos' and (storage.foldername(name))[1] in (select access_token from public.clients));
create policy "progress photos: upload to client folder" on storage.objects for insert to anon, authenticated
  with check (bucket_id = 'progress-photos' and (storage.foldername(name))[1] in (select access_token from public.clients));
create policy "progress photos: delete in client folder" on storage.objects for delete to anon, authenticated
  using (bucket_id = 'progress-photos' and (storage.foldername(name))[1] in (select access_token from public.clients));

-- ── Optional: one test client so client.html has something to load ──
-- insert into public.clients (name, status) values ('Test Client', 'active') returning access_token;
-- then open client.html?t=<that token>
