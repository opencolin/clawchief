#!/usr/bin/env bash
# Rotate the Token Factory API key in the clawchief container (key lives only in
# the state volume). Reads the new key from a prompt — never argv/history.
#
# Usage: ./docker/rotate-tf-key.sh
#   1. Mint a NEW key in the Token Factory console first.
#   2. Run this, paste the new key.
#   3. Revoke the OLD key in the console afterwards.
set -euo pipefail
cd "$(dirname "$0")/.."
COMPOSE=(docker compose -f docker/docker-compose.yml)

read -rsp "Paste the NEW Token Factory key (input hidden): " NEW; echo
[ -n "$NEW" ] || { echo "no key entered" >&2; exit 1; }

"${COMPOSE[@]}" exec -T clawchief node openclaw.mjs config set models.providers.tokenfactory.apiKey "$NEW" >/dev/null
unset NEW
"${COMPOSE[@]}" restart >/dev/null
sleep 5
echo "=== provider status after rotation ==="
"${COMPOSE[@]}" exec -T clawchief node openclaw.mjs models status 2>/dev/null | grep -iE 'tokenfactory|usable|default' | head -3
echo
echo "✅ Container key rotated (state volume only)."
echo "   Still TODO (your console / host):"
echo "   • Revoke the OLD key in the Token Factory console."
echo "   • If your host ~/.openclaw/openclaw.json used the same key, rotate it there too."
