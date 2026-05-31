# Instructor guide / run-of-show

A facilitator's companion. The release sequence (v0.1→v2.0) comes from
`ROADMAP.md`; this guide covers delivery, timing, and the live-demo script.

## Pre-flight (instructor, day before)

- Build the reference container and confirm all four checkpoints pass:
  ```bash
  ./docker/clawchief-up.sh all
  EXEC="docker compose -f docker/docker-compose.yml exec -T clawchief node openclaw.mjs"
  $EXEC agent --agent main --message "ping"                 # model usable
  $EXEC plugins list | grep tavily                          # tavily enabled
  $EXEC agent --agent main --model tokenfactory/nvidia/Nemotron-3-Nano-Omni --message "say hi"  # nemoclaw
  $EXEC system heartbeat last                               # 30s tick
  ```
- Have spare Token Factory keys for attendees who arrive without one.
- Skim `TROUBLESHOOTING.md` — those eight issues are the ones the room will hit.

## Module map (the teaching units)

| Order | Module | Outcome |
|---|---|---|
| 0 | `modules/00-prerequisites.md` | Docker + key; container talks back |
| 1 | `modules/architecture.md` | The 5 separations; "policy is data, workflow is code" |
| 2 | `modules/make-it-yours.md` | Replace Pied Piper with their own people/programs |
| 3 | `modules/crons-and-heartbeat.md` | Make it proactive (30s tick + sweeps) |
| 4 | `modules/security-hardening.md` | Secrets, rotation, hardening (Gilfoyle) |
| ★ | `demos/nemoclaw.md`, `demos/tavily-search.md` | Swap the brain; add live web search |

## Live-demo script (10 min, the hook)

1. "Meet Anton." Run the intro/priorities turn → reads the Pied Piper workspace.
2. "Swap his brain." Re-run on Nemotron (`nemoclaw`) — same person, different model.
3. "Give him the web." Tavily search for a live fact with a source.
4. "He wakes himself up." Show `system heartbeat last` ticking every 30s.
5. "Now make it *you*." Open `priority-map.md`, swap in a real name, restart, re-ask.

## Timing & facilitation

- Front-load the wow (live demo) before theory; attendees build faster when they've
  seen the destination.
- The single most important hands-on beat is Module 2 (`make-it-yours`) — protect
  the most time for it. If you cut anything, cut depth in crons, not customization.
- Pair attendees: one drives Docker, one edits the workspace files.

## "What good looks like" checkpoints

- v-early: their container answers "today's priorities" from *their* data.
- v-mid: a 30s heartbeat surfaces a due task; a Tavily search returns a real source.
- v-late: secrets scan is clean; a key-rotation drill completed; (optional) gog reads their real calendar.
