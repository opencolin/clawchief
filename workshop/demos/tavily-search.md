# Demo: Tavily web search inside the chief-of-staff

Gives Anton live web access via the OpenClaw **Tavily plugin** — so the agent can
research prospects, competitors (Hooli), and market facts in real time.

## Setup (already applied to the `clawchief` container)

OpenClaw ships a first-party Tavily plugin. It's enabled in the container with a
Tavily API key stored only in the `clawchief-state` volume:

```jsonc
// plugins.entries.tavily
{ "enabled": true, "config": { "webSearch": { "apiKey": "tvly-…" } } }
```

Verify it loaded:

```bash
docker compose -f docker/docker-compose.yml exec -T clawchief \
  node openclaw.mjs plugins list | grep -i tavily      # → enabled
```

## Run

```bash
docker compose -f docker/docker-compose.yml exec -T clawchief \
  node openclaw.mjs agent --agent main \
  --message "Use your web search capability to find one recent, real development about Nebius or AI agent frameworks. Give me a 2-sentence summary and include the source URL."
```

## Verified output (2026-05-31)

```
Nebius Group posted first-quarter 2026 revenue of $399 million, up roughly 684%
year over year on booming demand for AI cloud infrastructure. It also signed a
new AI infrastructure deal with Meta in March to accelerate capacity buildout.

Source: https://www.reuters.com/technology/nebius-reports-higher-quarterly-capex-ai-cloud-expansion-2026-05-13
```

## Teaching point

Web search turns the chief of staff from "knows your files" into "knows your
files **and** the live world." In the business-development skill, this is how
Anton verifies a prospect's real website/email before adding them to the tracker.
