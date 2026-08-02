#!/usr/bin/env bash
set -Eeuo pipefail

STAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="${BACKUP_DIR:-./backups}"
mkdir -p "$BACKUP_DIR"

: "${POSTGRES_DB:?POSTGRES_DB missing}"
: "${POSTGRES_USER:?POSTGRES_USER missing}"

docker compose -f deploy/docker-compose.yml exec -T postgres \
  pg_dump -U "$POSTGRES_USER" "$POSTGRES_DB" | gzip > "$BACKUP_DIR/db-$STAMP.sql.gz"

tar -czf "$BACKUP_DIR/n8n-$STAMP.tar.gz" deploy 2>/dev/null || true
find "$BACKUP_DIR" -type f -mtime +14 -delete
printf 'Backup completed: %s\n' "$STAMP"
