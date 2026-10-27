-- Deny-by-default access for the identity tables Laravel creates.
-- Apply this on Supabase after `php artisan migrate`.
-- The anon and authenticated roles cannot read another person's profile.
-- There is no insert, update, or delete policy, so those actions stay denied.
-- Laravel's database role must not be a superuser if this second check
-- should apply to the API connection as well. The service-role key bypasses
-- RLS and must stay on the server.

alter table public.profiles enable row level security;
alter table public.profiles force row level security;

drop policy if exists profiles_select_own on public.profiles;
create policy profiles_select_own on public.profiles
  for select to authenticated
  using (id = auth.uid());

alter table public.roles enable row level security;
alter table public.roles force row level security;

alter table public.permissions enable row level security;
alter table public.permissions force row level security;

alter table public.permission_role enable row level security;
alter table public.permission_role force row level security;

alter table public.profile_role enable row level security;
alter table public.profile_role force row level security;
