#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

info(){ printf '\033[1;34m[GLOBAL MEDIA]\033[0m %s\n' "$*"; }
fail(){ printf '\033[1;31m[HATA]\033[0m %s\n' "$*" >&2; exit 1; }

command -v docker >/dev/null 2>&1 || fail "Docker bulunamadı. Sunucuya Docker kurulmalı."
docker compose version >/dev/null 2>&1 || fail "Docker Compose bulunamadı."

if [[ ! -f .env ]]; then
  cp .env.example .env
  fail ".env oluşturuldu. Güvenli değerleri doldurup komutu tekrar çalıştır."
fi

for key in POSTGRES_PASSWORD N8N_ENCRYPTION_KEY N8N_HOST; do
  value="$(grep -E "^${key}=" .env | cut -d= -f2- || true)"
  [[ -n "$value" ]] || fail "$key boş bırakılamaz."
  [[ "$value" != CHANGE_ME* ]] || fail "$key örnek değerle bırakılamaz."
done

info "Docker imajları indiriliyor..."
docker compose pull

info "PostgreSQL, Redis, n8n ve worker başlatılıyor..."
docker compose up -d

info "Servis durumu:"
docker compose ps

info "Kurulum başladı. n8n adresi: https://$(grep '^N8N_HOST=' .env | cut -d= -f2-)"
info "İlk açılışta n8n sahibi hesabını oluştur, Telegram credential ekle ve workflows/ dosyalarını içe aktar."
