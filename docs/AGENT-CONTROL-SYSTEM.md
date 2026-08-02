# Global AI Media — Agent Control System

## Goal
Run the media company in the cloud without requiring the owner's computer to stay on.

## Core agents
1. Executive Agent: sets daily budget, channel priorities and stop rules.
2. Research Agent: finds topic opportunities and records sources.
3. Channel Strategist: assigns each idea to exactly one audience and channel.
4. Script Agent: creates an original structured script.
5. Production Agent: prepares voice, music, visuals, subtitles and render jobs.
6. Quality Agent: checks originality, factual risk, copyright evidence and repetition.
7. Publishing Agent: prepares metadata and schedules approved videos.
8. Analytics Agent: evaluates results after 24h, 72h, 7d and 28d.
9. Cost Controller: blocks jobs that exceed daily or per-video budgets.
10. Reliability Agent: detects failures, retries safe operations and sends alerts.

## Decision gates
A video may move to publishing only when all mandatory gates pass:
- original_value_score >= 85
- script_score >= 80
- audio_visual_match >= 80
- thumbnail_score >= 80
- copyright_status = cleared
- factual_risk = acceptable
- duplicate_check = passed
- budget_check = passed

## Stop rules
The system must automatically pause publishing when:
- a copyright or policy risk is detected
- the same template or asset is repeated beyond limits
- daily spend exceeds the configured budget
- YouTube authentication fails
- upload failure repeats three times
- render output is missing, silent, corrupted or below minimum duration
- a channel receives a platform warning

## Human control
Initial mode: approval_required.
Later modes:
- trusted_formats_only
- supervised_automation
- full_automation_for_whitelisted_formats

No agent may bypass the quality, policy, copyright or budget gates.
