-- profiles: 1:1 extension of auth.users, holds public-facing account info
create table public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  username text unique not null,
  display_name text,
  avatar_url text,
  created_at timestamptz not null default now()
);

-- books: shared catalog, keyed against OpenLibrary so lookups can be cached
create table public.books (
  id uuid primary key default gen_random_uuid(),
  open_library_id text unique,
  title text not null,
  author text,
  cover_url text,
  created_at timestamptz not null default now()
);

-- reads: a user's relationship to a book (shelf status, rating, review)
create table public.reads (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles (id) on delete cascade,
  book_id uuid not null references public.books (id) on delete cascade,
  status text not null default 'read'
    check (status in ('want_to_read', 'reading', 'read')),
  rating smallint check (rating between 1 and 5),
  review text,
  finished_at date,
  created_at timestamptz not null default now(),
  unique (user_id, book_id)
);

alter table public.profiles enable row level security;
alter table public.books enable row level security;
alter table public.reads enable row level security;

-- profiles: readable by anyone, editable only by the owner
create policy "profiles are viewable by everyone"
  on public.profiles for select
  using (true);

create policy "users can update their own profile"
  on public.profiles for update
  using (auth.uid() = id)
  with check (auth.uid() = id);

-- books: shared catalog, readable by anyone, any signed-in user can add one
create policy "books are viewable by everyone"
  on public.books for select
  using (true);

create policy "authenticated users can add books"
  on public.books for insert
  to authenticated
  with check (true);

-- reads: readable by anyone (social feed), writable only by the owner
create policy "reads are viewable by everyone"
  on public.reads for select
  using (true);

create policy "users can manage their own reads"
  on public.reads for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- auto-create a profile row whenever a new auth user signs up
create function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.profiles (id, username)
  values (
    new.id,
    coalesce(new.raw_user_meta_data ->> 'username', split_part(new.email, '@', 1))
  );
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();
