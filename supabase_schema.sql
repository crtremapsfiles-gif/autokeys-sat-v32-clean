-- AUTOKEYS SAT V3.2 EASY - STOCK + DISTRIBUIDORES + FILE SERVICE
-- Ejecutar en Supabase > SQL Editor > New query > Run

create table if not exists orders (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz default now(),
  ot_number text unique,
  client_name text,
  client_phone text,
  vehicle_brand text,
  vehicle_model text,
  vehicle_plate text,
  module_type text,
  status text default 'Recibido',
  technician_main text,
  income_service numeric default 0,
  expense_parts numeric default 0,
  paid boolean default false,
  notes text
);

create table if not exists stock_items (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz default now(),
  category text default 'Módulo',
  item_type text,
  brand text,
  model text,
  reference text,
  serial_number text,
  frequency text,
  transponder text,
  compatibility text,
  status text default 'Disponible',
  quantity integer default 1,
  min_quantity integer default 0,
  purchase_price numeric default 0,
  sale_price numeric default 0,
  location text,
  supplier text,
  notes text
);

create table if not exists distributors (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz default now(),
  name text not null,
  contact_person text,
  phone text,
  email text,
  province text,
  distributor_type text default 'Taller',
  tariff text,
  status text default 'Activo',
  notes text
);

create table if not exists file_services (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz default now(),
  fs_number text unique,
  distributor_name text,
  vehicle_brand text,
  vehicle_model text,
  engine text,
  ecu text,
  hw text,
  sw text,
  tool_read text,
  service_requested text,
  status text default 'Recibido',
  price numeric default 0,
  internal_cost numeric default 0,
  paid boolean default false,
  original_file_name text,
  modified_file_name text,
  notes text
);

alter table orders enable row level security;
alter table stock_items enable row level security;
alter table distributors enable row level security;
alter table file_services enable row level security;

drop policy if exists "allow all orders easy" on orders;
create policy "allow all orders easy" on orders for all using (true) with check (true);

drop policy if exists "allow all stock easy" on stock_items;
create policy "allow all stock easy" on stock_items for all using (true) with check (true);

drop policy if exists "allow all distributors easy" on distributors;
create policy "allow all distributors easy" on distributors for all using (true) with check (true);

drop policy if exists "allow all files easy" on file_services;
create policy "allow all files easy" on file_services for all using (true) with check (true);
