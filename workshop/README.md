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

## Map

- `ROADMAP.md` — the council-decided v0.1→v2.0 release plan
- `releases/vX.md` — per-release plan (one git worktree per release)
- `PROGRESS.md` — numbered tick log (resume anchor)
- `HANDOFF.md` — full state for another agent to pick up
- `council/` — PM council proposals + decision record
- `demos/` — nemoclaw + Tavily demo configs/scripts
