#!/usr/bin/env bash
# clawchief-up.sh — build and stand up the Pied Piper clawchief in Docker.
#
# Usage (from the repo root):
#   ./docker/clawchief-up.sh build        # build the image
#   ./docker/clawchief-up.sh onboard      # one-time gateway onboarding (no model = skip)
#   ./docker/clawchief-up.sh overlay      # copy the clawchief pack into the workspace
#   ./docker/clawchief-up.sh up           # start the gateway
#   ./docker/clawchief-up.sh status       # show gateway + skills status
#   ./docker/clawchief-up.sh cli ...      # run any openclaw CLI command in the container
#   ./docker/clawchief-up.sh all          # build + onboard + overlay + up
set -euo pipefail

cd "$(dirname "$0")/.."
COMPOSE=(docker compose -f docker/docker-compose.yml)

# Run a one-off openclaw CLI command (own container, shared volumes).
cc_run() { "${COMPOSE[@]}" run --rm --entrypoint node clawchief openclaw.mjs "$@"; }
# Run an openclaw CLI command inside the already-running gateway container.
cc() { "${COMPOSE[@]}" exec clawchief node openclaw.mjs "$@"; }

build()   { "${COMPOSE[@]}" build; }

onboard() {
  # Stand up local gateway config. Model auth is skipped here; wire it later
  # with `cli models ...` or by re-onboarding with a provider key.
  cc_run onboard \
    --non-interactive --accept-risk \
    --flow quickstart \
    --auth-choice skip \
    --gateway-bind loopback \
    --no-install-daemon \
    --skip-health
}

overlay() {
  # Overlay the baked Pied Piper pack into the live workspace (idempotent).
  "${COMPOSE[@]}" run --rm --entrypoint sh clawchief -c '
    set -eux
    mkdir -p /home/node/.openclaw/workspace/skills \
             /home/node/.openclaw/workspace/clawchief \
             /home/node/.openclaw/workspace/memory
    cp -r /opt/clawchief/skills/.    /home/node/.openclaw/workspace/skills/
    cp -r /opt/clawchief/clawchief/. /home/node/.openclaw/workspace/clawchief/
    cp -r /opt/clawchief/workspace/. /home/node/.openclaw/workspace/
    echo "workspace now contains:"
    ls -1 /home/node/.openclaw/workspace
    echo "skills:"
    ls -1 /home/node/.openclaw/workspace/skills
  '
}

up()      { "${COMPOSE[@]}" up -d; }
status()  { cc status || true; cc skills list || true; }
cli()     { cc "$@"; }

cmd="${1:-all}"; shift || true
case "$cmd" in
  build)   build ;;
  onboard) onboard ;;
  overlay) overlay ;;
  up)      up ;;
  status)  status ;;
  cli)     cli "$@" ;;
  all)     build; onboard; overlay; up; sleep 3; status ;;
  *) echo "unknown command: $cmd" >&2; exit 1 ;;
esac
