# Module: The "WHEN" layer — heartbeat + crons

A reactive bot waits to be asked. A **chief of staff** wakes itself up. This
module turns the agent from request/response into an always-on operator.

## Two clocks

| Mechanism | Cadence | Use |
|---|---|---|
| **Heartbeat** | interval (`30s` … `30m`) | frequent, lightweight "anything need me?" checks; runs the auto-resolver |
| **Cron** | schedule (`*/15 8-21 * * *`) | heavier scheduled jobs: inbox sweep, daily task-prep, BD sourcing |

### Heartbeat (the 30s tick)

```bash
EXEC="docker compose -f docker/docker-compose.yml exec -T clawchief node openclaw.mjs"
$EXEC config set agents.defaults.heartbeat.every '"30s"'
$EXEC config set agents.defaults.heartbeat.model '"tokenfactory/nvidia/Nemotron-3-Nano-Omni"'  # cheap brain for ticks
$EXEC system heartbeat enable
$EXEC system heartbeat last        # → {"reason":"interval","status":"ok-token","silent":true}
```

The heartbeat reads `HEARTBEAT.md`, which is an **orchestrator, not a workflow**:
it points at the priority map, auto-resolver, and tasks, and replies
`HEARTBEAT_OK` when there's nothing to do. Cheap model + silence-by-default =
you can tick every 30s without going broke (cost is a security/ops concern —
see the Gilfoyle module).

### Crons (the scheduled sweeps)

The repo ships `cron/jobs.template.json`. Translate each job into `openclaw cron add`:

```bash
# Executive-assistant sweep, every 15 min during the day
$EXEC cron add --name "EA sweep" --schedule "*/15 8-21 * * *" --tz America/Los_Angeles \
  --session-target main \
  --text "Executive assistant sweep. Use the executive-assistant skill. Only message Richard if there is new actionable information."

# Daily task-prep (isolated session, cheap, silent)
$EXEC cron add --name "Daily task prep" --schedule "0 2 * * *" --tz America/Los_Angeles \
  --session-target isolated --message "Use the daily-task-prep skill." --delivery none

$EXEC cron list
```

> Cron is minute-granularity; sub-minute "ticks" are the heartbeat's job.

> **Security gate (you will hit this):** mutating crons needs the device's
> `operator.admin` scope. A freshly-onboarded local CLI is deliberately scoped to
> `operator.write` only (least privilege — Gilfoyle approves), so the first
> `cron add` triggers a **scope-upgrade approval**:
> `pairing required: device is asking for more scopes than currently approved`.
> Approve the device from an already-admin context (`… devices list` → `… devices
> approve <requestId>`) — note approving is itself an admin op, so do it from the
> gateway owner/admin token, not the write-scoped CLI. This is the right default:
> a write-scoped agent can run your skills but can't silently reschedule itself.

## Design rule

Keep cron prompts **short** and let the **skill** carry the workflow. The cron
says *"do the EA sweep"*; the `executive-assistant` skill knows how. This is why
the same one-line cron survives skill upgrades.

## Exercise

Attendees enable the 30s heartbeat, watch three silent ticks, then add a task
with a near-future due date and watch the next heartbeat surface it.
