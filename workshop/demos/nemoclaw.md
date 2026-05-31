# Demo: "nemoclaw" — OpenClaw running on NVIDIA Nemotron (via Token Factory)

Shows that the chief-of-staff runtime is model-agnostic: swap the brain to
`nvidia/Nemotron-…` served by Nebius Token Factory, no code change.

## Setup (already applied to the `clawchief` container)

```bash
# Token Factory provider is configured (key lives only in the clawchief-state volume).
# Create a friendly alias:
docker compose -f docker/docker-compose.yml exec -T clawchief \
  node openclaw.mjs models aliases add nemoclaw tokenfactory/nvidia/Nemotron-3-Nano-Omni
```

## Run

```bash
docker compose -f docker/docker-compose.yml exec -T clawchief \
  node openclaw.mjs agent --agent main \
  --model tokenfactory/nvidia/Nemotron-3-Nano-Omni \
  --message "As Anton (Richard's chief of staff at Pied Piper), give Richard a crisp 3-line standup for today: the single top priority, one risk to watch (Hooli or Jian Yang), and what you'll handle yourself. Under 60 words."
```

## Verified output (2026-05-31)

```
Top priority – approve pricing tiers for the first paying-user launch.
Risk – Hooli's litigation/press move could stall our demo.
I'll process this week's dev-tool outreach replies and prep the term-sheet review.
```

## Teaching point

The same workspace (priority-map, tasks, skills) drives Kimi-K2.6 **or** Nemotron.
Attendees learn that the "chief of staff" is the *workspace + skills + policies* —
the model is a swappable component selected per-run with `--model` or per-agent
with an alias.
