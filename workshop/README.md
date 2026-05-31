# Workshop: Build Your Own Chief-of-Staff AI

A hands-on workshop that teaches attendees to build a personal/company "chief of
staff" AI agent, using the **clawchief** pattern as the worked example.

## Stack

| Layer | Choice |
|---|---|
| Agent runtime | **OpenClaw** (gateway, skills, crons, workspace) |
| Model API | **Nebius Token Factory** (OpenAI-compatible; incl. `nvidia/Nemotron-…` → the "nemoclaw" demo) |
| Web search | **Tavily** (MCP / API) |
| Google Workspace | **gog** CLI (Gmail / Calendar / Sheets) |
| Packaging | **Docker** (isolated, reproducible) |
| Worked example | **Pied Piper** — principal *Richard Hendricks*, chief of staff *Anton* |

## What attendees walk away with

- A running OpenClaw chief-of-staff in a container, on their own Token Factory key
- A `priority-map` / `auto-resolver` / `tasks` source-of-truth layer they customize
- Skills (executive-assistant, business-development, daily-task-*), crons, a 30s heartbeat
- A "nemoclaw" demo (OpenClaw on Nemotron) and a Tavily web-search demo
- Security-ops hygiene (secrets, key rotation, container hardening) — the "Gilfoyle" module

## How this workshop was built (meta)

The release plan (v0.1 → v2.0) is decided by a **council of PM agents** (see
`ROADMAP.md`), and each release is produced in its own **git worktree** by a
fanned-out **workflow**. Progress is tick-logged in `PROGRESS.md`; resume state
lives in `HANDOFF.md`.

## Releases (one git worktree each — see `ROADMAP.md`)

| Release | Theme | Lab |
|---|---|---|
| v0.1 | Hello, Agent — a container that texts you back | `releases/v0.1.md` |
| v0.5 | Give it a self — persona + your-data workspace | `releases/v0.5.md` |
| v1.0 | Hands & senses — skills + Tavily + gog | `releases/v1.0.md` |
| v1.5 | It acts on its own — crons + 30s heartbeat | `releases/v1.5.md` |
| v2.0 | The Chief of Staff, shipped — nemoclaw + hardening | `releases/v2.0.md` |

## Teaching modules (reused across releases)

- `modules/00-prerequisites.md` — Docker + key, 5-minute quickstart
- `modules/architecture.md` — the 5 separations (policy is data, workflow is code)
- `modules/make-it-yours.md` — re-theme to your own people/programs
- `modules/crons-and-heartbeat.md` — the WHEN layer
- `modules/security-hardening.md` — the Gilfoyle module (secrets, rotation, hardening)
- `demos/nemoclaw.md`, `demos/tavily-search.md` — the two wow demos

## Run-the-workshop docs

- `ROADMAP.md` — council-decided v0.1→v2.0 plan · `council/` — raw PM proposals + research
- `INSTRUCTOR.md` — run-of-show, live-demo script, timing
- `TROUBLESHOOTING.md` — the 8 issues the room will hit
- `PROGRESS.md` — numbered tick log (resume anchor) · `HANDOFF.md` — full resume state
- `scripts/make-release-worktrees.sh` — create the per-release worktrees
