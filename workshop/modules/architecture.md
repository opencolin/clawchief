# Module: The Anatomy of a Chief-of-Staff AI

The big idea: **a chief of staff is not a model. It's a workspace + skills +
policies, with a swappable model as the brain and a clock to wake it up.**

```
                ┌─────────────────────────────────────────────┐
   inbox  ─┐    │  OpenClaw Gateway (the always-on runtime)    │
 calendar ─┼──▶ │                                              │
   sheets ─┘    │   ┌── reads ──────────────────────────────┐  │
   tasks  ─┐    │   │ clawchief/priority-map.md  WHO/WHAT    │  │
   notes  ─┼──▶ │   │ clawchief/auto-resolver.md WHAT TO DO  │  │
   web    ─┘    │   │ clawchief/tasks.md         STATE       │  │
 (Tavily)       │   │ workspace/TOOLS.md         ENV         │  │
                │   └───────────────────────────────────────┘  │
                │   skills/  HOW (executive-assistant,         │
                │            business-development, daily-*)     │
                │   model:   BRAIN (Token Factory: Kimi / Nemotron)
                │   heartbeat + cron: WHEN (30s tick, sweeps)  │
                └─────────────────────────────────────────────┘
                         │ proactive update
                         ▼  (Slack / Telegram / CLI)
                      principal (Richard)
```

## The five separations (this is what we teach)

| Concern | Lives in | Why separate |
|---|---|---|
| **WHO/WHAT matters** | `priority-map.md` | People + programs + urgency. Change priorities without touching workflow code. |
| **WHAT to do** | `auto-resolver.md` | Act vs. draft vs. escalate vs. ignore. The judgment policy. |
| **STATE** | `tasks.md` (+ `tasks-completed.md`) | One canonical live source of truth across sessions. |
| **HOW** | `skills/` | Reusable, shareable workflow procedures. No personal data. |
| **WHO am I / WHO is the boss** | `IDENTITY.md` / `USER.md` | Persona (Anton) + principal (Richard). |
| **WHEN** | heartbeat + crons | The clock that makes it proactive, not reactive. |

Keeping these apart is the entire lesson: you can re-theme the example from a
divorce-help startup to **Pied Piper** by editing data files only — the skills
never changed.

## Why this matters for the build

- **Model-agnostic:** the same workspace drove Kimi-K2.6 and Nemotron
  (see `demos/nemoclaw.md`). The brain is a config line.
- **Tool-extensible:** adding Tavily (web search) was a plugin config, not a code
  change (see `demos/tavily-search.md`).
- **Proactive:** the 30s heartbeat reads the policy files and acts/escalates per
  `auto-resolver.md` — it doesn't re-implement the workflow.

## Exercise

Attendees draw the same diagram for *their own* life/company, then fill
`priority-map.md` with their real people and programs — that single file is 80%
of "making it yours."
