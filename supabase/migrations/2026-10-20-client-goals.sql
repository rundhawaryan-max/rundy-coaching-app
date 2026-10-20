-- Onboarding: Ryan's five intake questions, answered by the client on the welcome screen the first time they open
-- the app (editable later from Plan). Ryan reads them on the client's page.
-- Run after 2026-10-19-row-level-security.sql (files run in name order). Safe to re-run.
alter table public.clients
  add column if not exists goal_purpose text,        -- 1. specific goal / purpose for training with Ryan
  add column if not exists goal_measure text,        -- 2. how it's measurable (weight, pain-free, posture, a lift…)
  add column if not exists goal_relevance text,      -- 3. why it matters in their life now, and the obstacles in the way
  add column if not exists goal_end_date date,       -- 4. the date they want the transformation done by
  add column if not exists goal_commitment smallint  -- 5. willingness to commit, 1–5
    check (goal_commitment between 1 and 5),
  add column if not exists goals_set_at timestamptz; -- when they answered (or skipped); null = show the welcome screen

-- A client may write these columns of their own row and nothing else: a column-level grant plus a row policy.
revoke update on public.clients from anon;
grant update (goal_purpose, goal_measure, goal_relevance, goal_end_date, goal_commitment, goals_set_at) on public.clients to anon;
drop policy if exists client_goals on public.clients;
create policy client_goals on public.clients for update to anon
  using (id = public.current_client_id()) with check (id = public.current_client_id());
