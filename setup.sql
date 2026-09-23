-- Run this once in Supabase's SQL Editor

create table public.signups (
  id bigint generated always as identity primary key,
  email text not null unique,
  created_at timestamptz not null default now()
);

-- Row Level Security must be on before the public (anon) key can touch this table
alter table public.signups enable row level security;

-- Allow anyone to INSERT a row...
create policy "public can insert signups"
  on public.signups
  for insert
  to anon
  with check (true);

-- ...but there is deliberately NO select policy, so the anon key
-- can never read the list back. Only you can, from the dashboard
-- or with the service_role key, which never goes in the webpage.
