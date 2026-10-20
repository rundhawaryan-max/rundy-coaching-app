#!/bin/zsh
# Dry-run schema.sql + every migration on a throwaway local Postgres (needs `brew install postgresql@15`), then prove the
# RLS policies isolate clients. Run: zsh supabase/test-rls.sh  — every "expect" line should match, and the forged insert must error.
set -u
REPO="$(cd "$(dirname "$0")/.." && pwd)"; D="$(mktemp -d)"; PORT=54329
export PGHOST=127.0.0.1 PGPORT=$PORT PGUSER=postgres
export LC_ALL=${LC_ALL:-en_US.UTF-8}
initdb -D "$D" -U postgres --auth=trust -E UTF8 >/dev/null 2>&1 || { echo initdb failed; exit 1; }
pg_ctl -D "$D" -o "-p $PORT -c unix_socket_directories='' -c log_min_messages=fatal" -l "$D/log" -w start >/dev/null || { echo start failed; cat "$D/log"; exit 1; }
trap 'pg_ctl -D "$D" -m fast stop >/dev/null 2>&1; rm -rf "$D"' EXIT
psql -qc "create database rc" >/dev/null
Q() { psql -d rc -v ON_ERROR_STOP=1 -q "$@"; }
# the pieces Supabase provides out of the box
Q <<'SQL'
create extension if not exists pgcrypto;
create role anon nologin; create role authenticated nologin;
create schema storage;
create table storage.buckets(id text primary key, name text, public boolean default false);
create table storage.objects(id uuid default gen_random_uuid(), bucket_id text, name text);
alter table storage.objects enable row level security;
create policy "old loose policy" on storage.objects for all to anon using (bucket_id = 'progress-photos');   -- what the live project has today
create function storage.foldername(name text) returns text[] language sql immutable as $$
  select (string_to_array(name,'/'))[1:array_length(string_to_array(name,'/'),1)-1] $$;
grant usage on schema public, storage to anon, authenticated;
SQL
echo "== schema.sql";            Q -f "$REPO/supabase/schema.sql" && echo ok
# Supabase's default: both roles may do anything to every table; the migrations then narrow that.
Q -c "grant all on all tables in schema public, storage to anon, authenticated; grant usage, select on all sequences in schema public to anon, authenticated;"
for f in "$REPO"/supabase/migrations/*.sql; do echo "== $(basename "$f")"; Q -f "$f" && echo ok; done
echo "== tables without RLS (should be none):"
Q -Atc "select string_agg(tablename, ', ') from pg_tables where schemaname='public' and not rowsecurity"
echo "== policy test"
psql -d rc -q <<'SQL'
\set ON_ERROR_STOP off
insert into clients(name, access_token, status) values ('Alice','tokA','active'), ('Bob','tokB','active'), ('Zed','tokZ','inactive');
insert into messages(client_id, sender, body) select id, 'coach', 'hi '||name from clients;
insert into programs(client_id, name) select id, name||' plan' from clients;
insert into workouts(program_id, name) select id, name||' day' from programs;
insert into storage.objects(bucket_id, name) values ('progress-photos','tokA/front.jpg'), ('progress-photos','tokB/front.jpg');
insert into payments(client_id, amount_cad, status) select id, 100, 'paid' from clients;
select id as bob from clients where name='Bob' \gset
\echo '-- storage policies now in place:'
select policyname, roles from pg_policies where tablename='objects';

\echo '-- coach (authenticated) sees everything:'
set role authenticated;
select count(*) as clients, (select count(*) from messages) as messages, (select count(*) from workouts) as workouts, (select count(*) from storage.objects) as photos from clients;
reset role;

\echo '-- anon with Alice''s token: only Alice'
set role anon; select set_config('request.headers', '{"x-client-token":"tokA"}', false);
select name from clients;
select body from messages;
select name from workouts;
select name from storage.objects;
\echo '-- Alice writes her own message (expect 1 row):'
insert into messages(client_id, sender, body) select id, 'client', 'from alice' from clients where name='Alice' returning body;
\echo '-- Alice tries to write for Bob (expect a policy error):'
insert into messages(client_id, sender, body) values (:'bob', 'client', 'forged');
\echo '-- Alice sets her own goals (expect 1 row):'
update clients set goal_purpose='Lose 5 lb', goal_measure='Scale weight', goal_end_date='2027-06-01', goal_commitment=4, goals_set_at=now() returning name;
\echo '-- Alice tries to change her status (expect a permission error):'
update clients set status='inactive';
\echo '-- Alice reads payments (expect 0):'
select count(*) from payments;
\echo '-- Alice tries to change her plan (expect 0 rows):'
update programs set name='hacked' returning name;
\echo '-- Alice tries to delete Bob''s photo (expect 0 rows):'
delete from storage.objects where name like 'tokB/%' returning name;
reset role;

\echo '-- anon with no token (expect 0 everywhere):'
set role anon; select set_config('request.headers', '{}', false);
select count(*) as clients, (select count(*) from messages) as messages, (select count(*) from exercises) as exercises from clients;
reset role;

\echo '-- anon with an inactive client''s token (expect 0):'
set role anon; select set_config('request.headers', '{"x-client-token":"tokZ"}', false);
select count(*) from clients;
reset role;
SQL
