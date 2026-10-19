-- The client's own goals, set on the welcome screen the first time they open the app (and editable on Plan).
-- Run after 2026-10-19-row-level-security.sql. Safe to re-run.
alter table public.clients
  add column if not exists goal_short_term text,
  add column if not exists goal_long_term text,
  add column if not exists goals_set_at timestamptz;

-- A client may write these three columns of their own row and nothing else: column-level grant plus a row policy.
revoke update on public.clients from anon;
grant update (goal_short_term, goal_long_term, goals_set_at) on public.clients to anon;
drop policy if exists client_goals on public.clients;
create policy client_goals on public.clients for update to anon
  using (id = public.current_client_id()) with check (id = public.current_client_id());
