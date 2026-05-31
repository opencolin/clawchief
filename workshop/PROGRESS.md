# PROGRESS — tick log

Append-only. Each tick ≈ one unit of work. Newest at the bottom. Any agent can
read the last tick + `HANDOFF.md` and resume.

> Tick cadence note: the OpenClaw heartbeat ticks every 30s in the demo
> (`workspace/HEARTBEAT.md` + cron). `ScheduleWakeup` has a 60s floor, so the
> orchestrator (this agent) checkpoints per work-unit rather than per wall-clock 30s.

## Phase 0 — Foundation (clawchief Pied Piper demo)
- [tick 0] Forked snarktank/clawchief → opencolin/clawchief; cloned to /Users/colin/clawchief (branch `piedpiper`).
- [tick 1] Installed `gog` (gogcli 0.20.0); fixed stale `steipete/tap/gogcli` → `gogcli` (homebrew-core).
- [tick 2] Themed all content as Pied Piper: priority-map, tasks, partners, TOOLS, IDENTITY (Anton), USER (Richard).
- [tick 3] Built `clawchief:local` Docker image (native arm64): OpenClaw + gog + pack baked in.
- [tick 4] Onboarded gateway, overlaid pack, started container. All 4 skills ✓ ready.
- [tick 5] Wired Nebius Token Factory provider (Kimi-K2.6 default) into container state volume.
- [tick 6] VERIFIED: live agent turn — Anton introduced itself + read tasks/priority-map. Working.
- [tick 7] Gilfoyle role set to "Security Ops & IT infrastructure".

## Phase 1 — Workshop scaffolding + PM council
- [tick 8] Scaffolded `workshop/` (README, PROGRESS, HANDOFF). Goal: workshop on building a chief-of-staff AI.
- [tick 9] Launching PM-council workflow (Tavily research → 5 PM personas propose → council chair decides v0.1→v2.0 roadmap).

- [tick 10] nemoclaw demo VERIFIED: agent turn on `nvidia/Nemotron-3-Nano-Omni` → real Anton standup. Alias `nemoclaw` added. (`demos/nemoclaw.md`)
- [tick 11] Tavily plugin replicated into container (key → state volume); VERIFIED live web search (Nebius Q1'26 result + source). (`demos/tavily-search.md`)
- [tick 12] 30s heartbeat configured (`agents.defaults.heartbeat.every=30s`, model=Nemotron) and observed ticking (`reason: interval`, silent).

## Phase 2 — Council, roadmap, worktrees, release labs
- [tick 13] Foundational modules written: architecture, 00-prerequisites, crons-and-heartbeat, make-it-yours, security-hardening; plus TROUBLESHOOTING + INSTRUCTOR.
- [tick 14] PM council workflow `wf_e8514e65-39e` ran (Tavily research + 4 PM roadmaps: MVP/DX/Security/Curriculum). 5th PM was slow → stopped after 5/6 results (enough). Raw saved to `council/`.
- [tick 15] Synthesized `ROADMAP.md` — 5 releases v0.1→v2.0 (Hello Agent / Give it a self / Hands & senses / It acts on its own / Shipped).
- [tick 16] Created 5 git worktrees: `/Users/colin/clawchief-v0.1 … -v2.0` on `release/vX` branches.
- [tick 17] Launched release-labs workflow `wf_686688ed-fe2` (one agent/release → `releases/vX.md`). Note: workflow `args` came through undefined → inline the data in the script instead.

- [tick 18] Release-labs workflow `wf_686688ed-fe2` produced hands-on labs. Distributed + committed into worktrees: v0.1, v1.0, v1.5, v2.0 (each on its `release/vX` branch). v0.5 pending (agent verbose).
- [tick 19] Set up crons (EA sweep / daily-task-prep / BD) — hit the `operator.admin` scope-upgrade gate; documented as a security teaching point. Heartbeat already proves proactivity.
- [tick 20] README turned into front-door index (releases + modules + run docs).

- [tick 21] All 5 release labs distributed to worktrees + merged/canonicalized onto `piedpiper`. v0.5 synced to the canonical (more accurate) version.
- [tick 22] HANDOFF marked complete. Workshop deliverables done.

## DONE — goal complete
Workshop "Build Your Own Chief-of-Staff AI" is built: running container demo (OpenClaw + Token Factory/Kimi + nemoclaw/Nemotron + Tavily + 30s heartbeat), full curriculum (README/ROADMAP/5 modules/2 demos/INSTRUCTOR/TROUBLESHOOTING), council-decided roadmap, and 5 release labs each in its own git worktree.

## Optional follow-ups (user-gated)
- Connect Google (`gog` auth) — needs the user's OAuth desktop-client JSON.
- Enable crons (needs `operator.admin` scope approval + gog).
- Rotate the Token Factory key (pasted in plaintext).
- Push `piedpiper` + `release/*` to the fork.

## Demo runbook (verified commands)
```
EXEC="docker compose -f docker/docker-compose.yml exec -T clawchief node openclaw.mjs"
$EXEC agent --agent main --message "…"                     # chief-of-staff turn (Kimi-K2.6)
$EXEC agent --agent main --model tokenfactory/nvidia/Nemotron-3-Nano-Omni --message "…"   # nemoclaw
$EXEC plugins list | grep tavily                            # Tavily enabled
$EXEC system heartbeat last                                 # 30s tick
$EXEC system heartbeat disable                              # stop ticks (cost control)
```
