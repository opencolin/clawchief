# Troubleshooting (from real issues hit building this)

Every item here actually bit us during the build. Hand this to attendees.

## `brew install steipete/tap/gogcli` → "No available formula"
The tap moved. `gog` is now in homebrew-core (and `openclaw/tap`):
```bash
brew install gogcli           # homebrew-core
# or: brew install openclaw/tap/gogcli
```

## `docker: unknown command: docker compose`
Docker Desktop was removed, leaving broken plugin symlinks; the standalone
`docker` CLI ships no compose. Install the plugins via brew and point the CLI at
them:
```bash
brew install docker-compose docker-buildx
ln -sf "$(brew --prefix)/lib/docker/cli-plugins/docker-compose" ~/.docker/cli-plugins/docker-compose
ln -sf "$(brew --prefix)/lib/docker/cli-plugins/docker-buildx"  ~/.docker/cli-plugins/docker-buildx
docker compose version        # should print a version
```

## gog runs slowly / "exec format" in the container
The gogcli GHCR image is amd64-only, and the classic Docker builder leaves
`TARGETARCH` empty (defaults to amd64) — so on Apple Silicon you bake an amd64
binary that runs under emulation. Fix: build with **buildx** (sets `TARGETARCH`),
so the Dockerfile pulls the matching `linux_arm64`/`linux_amd64` release binary.
Verify: `docker run --rm --entrypoint sh clawchief:local -c 'head -c19 /usr/local/bin/gog|od -An -tx1|tr -d " \n"|tail -c2'` → `b7` = aarch64, `3e` = x86-64.

## Onboarding: "Gateway did not become reachable … ECONNREFUSED 18789"
Expected when onboarding in a one-off `run` container — the gateway runs as a
separate service. Pass `--skip-health` to onboarding; start the gateway with
`docker compose up -d` afterward.

## Agent turn: "No target session selected"
Pass `--agent main` (or `--session-key …`):
```bash
… node openclaw.mjs agent --agent main --message "…"
```

## `models status` shows the model but turns fail
The provider key didn't resolve. Re-check `models status` shows the provider as
`usable`; confirm `agents.defaults.model` (or `models set`) points at a
`provider/model` you actually configured. Restart the gateway after config changes.

## Tavily plugin enabled but no web results
Confirm `plugins list | grep tavily` shows **enabled**, the key is present
(`plugins.entries.tavily.config.webSearch.apiKey`), and you restarted the gateway
after setting it.

## Heartbeat hammering credits
30s ticks on a pricey model add up. Set `agents.defaults.heartbeat.model` to a
cheap model (Nemotron) and `system heartbeat disable` when idle.
