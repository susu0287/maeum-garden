-- Supabase SQL Editor reference
create table if not exists public.emotion_garden_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  records jsonb not null default '[]'::jsonb,
  custom_themes jsonb not null default '[]'::jsonb,
  bundles jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.emotion_garden_data enable row level security;
drop policy if exists "Users can read their own garden" on public.emotion_garden_data;
create policy "Users can read their own garden" on public.emotion_garden_data for select using (auth.uid() = user_id);
drop policy if exists "Users can insert their own garden" on public.emotion_garden_data;
create policy "Users can insert their own garden" on public.emotion_garden_data for insert with check (auth.uid() = user_id);
drop policy if exists "Users can update their own garden" on public.emotion_garden_data;
create policy "Users can update their own garden" on public.emotion_garden_data for update using (auth.uid() = user_id) with check (auth.uid() = user_id);