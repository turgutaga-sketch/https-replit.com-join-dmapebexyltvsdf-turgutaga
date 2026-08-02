# Telegram Alert Plan

Telegram is the primary operational alert channel for version 1.

## Alert levels

### CRITICAL
Send immediately and pause the affected publishing queue.
- YouTube authorization expired or rejected
- channel warning, strike or policy signal
- copyright check failed
- daily budget exceeded
- database unavailable
- upload failed three times
- rendered video corrupted, empty or silent

### WARNING
Send immediately but continue safe independent jobs.
- generation provider temporarily unavailable
- render slower than expected
- quality score below threshold
- duplicate topic or visual detected
- channel daily upload limit approached

### INFO
Group into one daily report.
- videos researched
- scripts generated
- renders completed
- videos waiting for approval
- published long videos and Shorts
- total daily cost
- best and weakest channel result

## Message format

🚨 GLOBAL AI MEDIA — CRITICAL
Channel: {{channel}}
Workflow: {{workflow}}
Problem: {{error}}
Action: {{automatic_action}}
Time: {{timestamp}}
Execution: {{execution_url}}

## Owner commands planned
/status — current system status
/today — today's production and spend
/pause — pause all publishing
/resume — resume approved publishing
/approve <id> — approve an item
/reject <id> — reject an item
/budget — today's budget status

## Security
- Bot token is stored only in the server credential vault.
- Secrets are never written to GitHub, Telegram messages or execution logs.
- The bot accepts control commands only from the configured owner chat ID.
- Destructive commands require confirmation.
