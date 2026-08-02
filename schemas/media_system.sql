create extension if not exists pgcrypto;

create table if not exists channels (
  id uuid primary key default gen_random_uuid(),
  platform text not null default 'youtube',
  name text not null,
  niche text not null,
  language text not null,
  external_channel_id text unique,
  status text not null default 'testing' check (status in ('testing','active','paused','blocked','archived')),
  daily_publish_limit integer not null default 2 check (daily_publish_limit between 0 and 50),
  daily_budget_eur numeric(10,2) not null default 5,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists content_items (
  id uuid primary key default gen_random_uuid(),
  channel_id uuid references channels(id) on delete set null,
  content_type text not null check (content_type in ('long_video','short','song','story','thumbnail','social_cut')),
  topic text not null,
  title text,
  language text not null,
  status text not null default 'idea' check (status in ('idea','researched','scripted','producing','quality_review','approval','scheduled','published','rejected','failed','paused')),
  originality_score integer check (originality_score between 0 and 100),
  script_score integer check (script_score between 0 and 100),
  hook_score integer check (hook_score between 0 and 100),
  av_sync_score integer check (av_sync_score between 0 and 100),
  thumbnail_score integer check (thumbnail_score between 0 and 100),
  copyright_passed boolean not null default false,
  factcheck_passed boolean not null default false,
  human_approved boolean not null default false,
  estimated_cost_eur numeric(10,4) not null default 0,
  actual_cost_eur numeric(10,4) not null default 0,
  publish_at timestamptz,
  external_video_id text,
  failure_reason text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists agent_runs (
  id uuid primary key default gen_random_uuid(),
  content_id uuid references content_items(id) on delete cascade,
  agent_name text not null,
  status text not null check (status in ('started','passed','failed','blocked','skipped')),
  input_summary text,
  output_summary text,
  cost_eur numeric(10,4) not null default 0,
  duration_ms integer,
  error_code text,
  created_at timestamptz not null default now()
);

create table if not exists alerts (
  id uuid primary key default gen_random_uuid(),
  severity text not null check (severity in ('info','warning','critical')),
  source text not null,
  title text not null,
  message text not null,
  content_id uuid references content_items(id) on delete set null,
  acknowledged boolean not null default false,
  telegram_message_id text,
  created_at timestamptz not null default now(),
  acknowledged_at timestamptz
);

create table if not exists daily_metrics (
  metric_date date not null,
  channel_id uuid not null references channels(id) on delete cascade,
  published_count integer not null default 0,
  views bigint not null default 0,
  watch_time_minutes numeric(14,2) not null default 0,
  subscribers_gained integer not null default 0,
  revenue_eur numeric(12,2) not null default 0,
  cost_eur numeric(12,2) not null default 0,
  primary key (metric_date, channel_id)
);

create index if not exists idx_content_status on content_items(status);
create index if not exists idx_content_publish_at on content_items(publish_at);
create index if not exists idx_agent_runs_content on agent_runs(content_id);
create index if not exists idx_alerts_unacknowledged on alerts(acknowledged, severity);

create or replace function enforce_publish_gate()
returns trigger language plpgsql as $$
begin
  if new.status in ('scheduled','published') then
    if coalesce(new.originality_score,0) < 85
       or coalesce(new.script_score,0) < 80
       or coalesce(new.hook_score,0) < 80
       or coalesce(new.av_sync_score,0) < 80
       or coalesce(new.thumbnail_score,0) < 85
       or not new.copyright_passed
       or not new.factcheck_passed
       or not new.human_approved then
      raise exception 'Publish gate failed for content %', new.id;
    end if;
  end if;
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_enforce_publish_gate on content_items;
create trigger trg_enforce_publish_gate
before insert or update on content_items
for each row execute function enforce_publish_gate();
