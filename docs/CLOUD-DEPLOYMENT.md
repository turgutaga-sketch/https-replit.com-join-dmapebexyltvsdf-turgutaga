# Cloud Deployment Blueprint

## Objective
Operate continuously while the owner's Mac and iPhone are off.

## Recommended production layout
- Managed VPS: Docker host for n8n and worker services
- PostgreSQL: durable job, asset, cost and analytics records
- Object storage: rendered video, audio, images and subtitle files
- n8n: orchestration, schedules, API integrations and alerts
- FFmpeg workers: deterministic rendering and format conversion
- Reverse proxy with HTTPS: protected access to n8n and dashboard
- Automated encrypted backups: database and workflow exports

## Services
1. orchestrator
2. postgres
3. redis queue
4. render-worker
5. scheduler
6. monitoring
7. reverse-proxy

## Reliability rules
- restart failed containers automatically
- health checks every minute
- preserve jobs across server restarts
- retry transient failures with exponential backoff
- never retry copyright, policy or quality failures automatically
- keep failed assets for diagnosis, then clean them after retention period
- daily database backup
- weekly restore test

## Deployment phases
### Phase 1 — Safe prototype
Research, script generation, quality scoring, Telegram alerts and approval queue.

### Phase 2 — Production
Voice, asset collection, FFmpeg rendering, subtitles, thumbnails and YouTube draft upload.

### Phase 3 — Controlled scale
Multiple channels, worker queue, per-channel budgets and analytics feedback.

### Phase 4 — Autonomous trusted formats
Only proven and whitelisted formats may publish without manual approval.

## Owner involvement
One-time account authorization remains necessary for YouTube and paid providers. Daily operation does not require the owner's computer or manual uploads.
