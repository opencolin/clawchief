# HANDOFF — resume state for any agent

Read this + the last entry in `PROGRESS.md` to pick up exactly where work stopped.

## Repo
- Path: `/Users/colin/clawchief` · fork: `github.com/opencolin/clawchief`
- Working branch: `piedpiper` (baseline demo). Per-release branches: `release/vX`.
- Worktrees (one per release) live at `/Users/colin/clawchief-vX`.

## Running demo (the thing we're teaching people to build)
- Container `clawchief` (Docker, Colima arm64 daemon). Image `clawchief:local`.
- Compose: `docker compose -f docker/docker-compose.yml …`
- Drive the agent: `docker compose -f docker/docker-compose.yml exec -T clawchief node openclaw.mjs <cmd>`
- Model: Token Factory `tokenfactory/moonshotai/Kimi-K2.6` (key lives ONLY in the `clawchief-state` volume — never in the repo).
- Verified working: `… agent --agent main --message "…"` responds as Anton.

## Environment facts (non-obvious)
- Docker = Colima (linux/arm64). Docker Desktop is uninstalled; `docker compose`/`buildx` are brew-installed and symlinked into `~/.docker/cli-plugins/`.
- `gog` 0.20.0 installed on host (Homebrew). gogcli GHCR image is amd64-only; the container uses the native arm64 release binary baked by `docker/Dockerfile`.

## What's DONE
- Phase 0 foundation (PROGRESS ticks 0–7): forked, themed Pied Piper, Dockerized, model wired, verified.
- Phase 1 demos (ticks 10–12): nemoclaw (Nemotron) ✓, Tavily web-search plugin ✓, 30s heartbeat ✓ — all live in the container.
- Worktree helper: `workshop/scripts/make-release-worktrees.sh v0.1 …` (run once roadmap lands).

## What's PENDING
1. PM council `wf_e8514e65-39e` → `ROADMAP.md` (v0.1→v2.0).
2. Git worktree per release (run the helper); per-release `releases/vX.md` plans.
3. Fanned-out per-release production workflow → content into each worktree.
4. Google `gog` auth — BLOCKED on the user's Google OAuth desktop-client JSON (user opted in earlier).
5. Crons (EA sweep / daily-task-prep / BD).

## Conventions
- Tick-log every work-unit in `PROGRESS.md`.
- Never commit secrets. `.gitignore` covers `docker/.env`, `*client_secret*`, `*credentials*`.
- Per-release worktrees keep release artifacts isolated; merge up to `piedpiper` when a release is accepted.
