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

## What's DONE — workshop COMPLETE
- **Container demo** (PROGRESS ticks 0–12): forked, themed Pied Piper, Dockerized, model wired, verified live; nemoclaw (Nemotron) ✓, Tavily web-search ✓, 30s heartbeat ✓ — all live.
- **Workshop content**: README (front door), `ROADMAP.md` (council decision), 5 modules (`modules/`), 2 verified demos (`demos/`), `INSTRUCTOR.md`, `TROUBLESHOOTING.md`.
- **PM council** (workflow `wf_e8514e65-39e`): 4 PM roadmaps + Tavily research → `ROADMAP.md`; raw in `council/`.
- **5 release worktrees** at `/Users/colin/clawchief-v0.1 … -v2.0` (branches `release/vX`), each with its `workshop/releases/vX.md` lab. All 5 labs also merged onto `piedpiper`.
- **Release labs** (workflow `wf_686688ed-fe2`): one hands-on lab per release, distributed to worktrees + canonicalized on `piedpiper`.
- Gilfoyle = Security Ops & IT infra (priority-map + `modules/security-hardening.md`).

## What's PENDING (optional / user-gated)
1. **Google `gog` auth** — BLOCKED on the user's Google OAuth desktop-client JSON (user opted in; mechanics in `SETUP-GOG.md` + v1.0 lab).
2. **Enable crons** — created commands exist; needs `operator.admin` device scope approval (see `modules/crons-and-heartbeat.md` security note) + gog for real data.
3. **Rotate the Token Factory key** — it was pasted in plaintext; rotate per `modules/security-hardening.md`.
4. **Push** `piedpiper` + `release/*` branches to the fork (not pushed yet).

## Conventions
- Tick-log every work-unit in `PROGRESS.md`.
- Never commit secrets. `.gitignore` covers `docker/.env`, `*client_secret*`, `*credentials*`.
- Per-release worktrees keep release artifacts isolated; merge up to `piedpiper` when a release is accepted.
