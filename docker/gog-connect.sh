#!/usr/bin/env bash
# Connect Google Workspace to the clawchief container via gog (headless --remote flow).
#
# Prereq: a Google OAuth **Desktop** client JSON (see ../SETUP-GOG.md).
#
# Step 1 — load client + get the consent URL:
#   ./docker/gog-connect.sh /path/to/client_secret.json you@gmail.com
#   → open the printed URL, approve, then copy the FULL localhost redirect URL
#     (it won't load — that's fine; you just need the URL from the address bar).
#
# Step 2 — finish:
#   ./docker/gog-connect.sh --finish you@gmail.com '<pasted redirect URL>'
set -euo pipefail
cd "$(dirname "$0")/.."
COMPOSE=(docker compose -f docker/docker-compose.yml)
SERVICES="gmail,calendar,sheets,drive,docs,contacts"

if [ "${1:-}" = "--finish" ]; then
  EMAIL="${2:?email}"; AUTH_URL="${3:?pasted redirect URL}"
  "${COMPOSE[@]}" exec -T clawchief gog auth add "$EMAIL" --services "$SERVICES" --remote --step 2 --auth-url "$AUTH_URL"
  "${COMPOSE[@]}" exec -T clawchief gog auth list
  "${COMPOSE[@]}" exec -T --user root clawchief rm -f /tmp/cs.json || true
  echo "✅ Google connected for $EMAIL — token is in the encrypted keyring (clawchief-gog volume)."
  echo "   Next: set TOOLS.md emails/sheet id, then enable the gog-dependent crons:"
  echo "   docker compose -f docker/docker-compose.yml exec -T clawchief node openclaw.mjs cron enable \"EA sweep\""
else
  CLIENT="${1:?path to client_secret.json}"; EMAIL="${2:?email}"
  [ -f "$CLIENT" ] || { echo "client json not found: $CLIENT" >&2; exit 1; }
  "${COMPOSE[@]}" cp "$CLIENT" clawchief:/tmp/cs.json
  "${COMPOSE[@]}" exec -T clawchief gog auth credentials set /tmp/cs.json
  echo
  echo "=== Open this URL in your browser, approve, then copy the full localhost redirect URL ==="
  "${COMPOSE[@]}" exec -T clawchief gog auth add "$EMAIL" --services "$SERVICES" --remote --step 1
  echo
  echo ">>> Then run:  ./docker/gog-connect.sh --finish $EMAIL '<pasted redirect URL>'"
fi
