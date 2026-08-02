#!/usr/bin/env bash
set -Eeuo pipefail

failures=0
check(){
  local name="$1"; shift
  if "$@" >/dev/null 2>&1; then
    printf '[OK] %s\n' "$name"
  else
    printf '[FAIL] %s\n' "$name" >&2
    failures=$((failures+1))
  fi
}

check "Docker" docker info
check "n8n" curl -fsS "${N8N_HEALTH_URL:-http://localhost:5678/healthz}"
check "PostgreSQL container" docker compose -f deploy/docker-compose.yml ps postgres
check "Redis container" docker compose -f deploy/docker-compose.yml ps redis
check "n8n worker" docker compose -f deploy/docker-compose.yml ps n8n-worker

if (( failures > 0 )); then
  printf '%s service checks failed\n' "$failures" >&2
  exit 1
fi
