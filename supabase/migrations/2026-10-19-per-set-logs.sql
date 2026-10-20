-- Per-set workout logging: one exercise_logs row per set, with an RPE (effort) rating.
-- Older rows (one per exercise per day, reps as "8,8,7") keep working: set_index and rpe stay null.
-- Run this in the Supabase SQL editor on the TEST project first, then on the LIVE project when the new client app ships.

alter table public.exercise_logs
  add column if not exists set_index integer,   -- 1-based set number within that day's session
  add column if not exists rpe numeric;         -- rate of perceived exertion, 1-10 (clients pick 6-10)

create index if not exists idx_exercise_logs_client_date on public.exercise_logs (client_id, date);
