# Module 0: Prerequisites & 5-minute setup

## What attendees bring

| Need | Why | Get it |
|---|---|---|
| **Docker** (running) | the chief of staff runs in a container | Docker Desktop / Colima / OrbStack |
| **Token Factory API key** | the model brain (OpenAI-compatible) | studio/console → API keys (`v1.…`) |
| Tavily API key *(optional)* | live web search | tavily.com → `tvly-…` |
| Google OAuth desktop client *(optional)* | Gmail/Calendar/Sheets via `gog` | Google Cloud Console (see `../../SETUP-GOG.md`) |
| Git | fork + per-release worktrees | preinstalled on macOS/Linux |

No model runs locally — the laptop only needs Docker + a key. That's the whole
point of using Token Factory: a strong agent brain with zero local GPU.

## 5-minute quickstart

```bash
# 1. Fork + clone
gh repo fork snarktank/clawchief --clone        # → your-name/clawchief
cd clawchief

# 2. Configure
cp docker/.env.example docker/.env              # set GOG_KEYRING_PASSWORD
#   (model + Tavily keys are injected into the state volume, not .env — see security module)

# 3. Build + stand up (build → onboard → overlay → start)
./docker/clawchief-up.sh all

# 4. Wire your Token Factory model (one-time)
EXEC="docker compose -f docker/docker-compose.yml exec -T clawchief node openclaw.mjs"
$EXEC config set models.providers.tokenfactory '{"baseUrl":"https://api.tokenfactory.nebius.com/v1/","api":"openai-completions","apiKey":"<YOUR_KEY>","models":[{"id":"moonshotai/Kimi-K2.6","name":"Kimi-K2.6","input":["text"],"contextWindow":262144}]}' --strict-json
$EXEC models set tokenfactory/moonshotai/Kimi-K2.6

# 5. Talk to your chief of staff
$EXEC agent --agent main --message "Introduce yourself and give me today's top 3 priorities."
```

> Inject the key with `config set … <key>` from your shell so it lands in the
> container **state volume**, never in a tracked file. (Production: use a
> SecretRef / file batch instead of a literal on the command line.)

## Check-for-understanding

You're ready when `… agent --message "ping"` returns a reply and
`… models status` shows your Token Factory model as `usable`.
