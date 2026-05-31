# Workshop Roadmap — v0.1 → v2.0 (council decision)

> Decided by a council of PM agents (MVP · DX · Security/Gilfoyle · Curriculum),
> Tavily-grounded. Raw proposals: `council/PROPOSALS.md`. Facts: `council/RESEARCH.md`.

**Workshop:** Build Your Own Chief-of-Staff AI (OpenClaw + Token Factory + Tavily,
worked example: Pied Piper).

## The arc

Each release is independently runnable (MVP rule), copy-paste friendly (DX rule),
carries a security thread (Gilfoyle rule), and has explicit learning outcomes
(Curriculum rule). One **git worktree per release** at `/Users/colin/clawchief-vX`.

| Release | Theme | The one-line promise | Min |
|---|---|---|---|
| **v0.1** | Hello, Agent | a container that texts you back | 50 |
| **v0.5** | Give it a self | persona + workspace = *your* assistant, on *your* data | 60 |
| **v1.0** | Hands & senses | skills + web search (Tavily) + Google (gog) | 75 |
| **v1.5** | It acts on its own | crons + the 30s heartbeat (proactive) | 60 |
| **v2.0** | The Chief of Staff, shipped | nemoclaw brain-swap + hardening + ship | 80 |

## Releases

### v0.1 — Hello, Agent
- **Goal:** stand up OpenClaw in Docker on a Token Factory key and get a first reply — without leaking the key.
- **Modules:** `00-prerequisites`, `architecture` (intro)
- **Demo:** `agent --agent main --message "ping"` → reply; `models status` → usable.
- **Security (Gilfoyle):** loopback gateway bind, no published ports, key injected into the state volume (never the repo), `.gitignore` in place.
- **Deliverables:** running `clawchief` container; verified model turn.

### v0.5 — Give it a self
- **Goal:** make it *yours* — persona + the source-of-truth workspace, themed (Pied Piper: Richard + Anton).
- **Modules:** `make-it-yours`, `architecture` (the 5 separations)
- **Demo:** "introduce yourself + today's top 3 priorities" → reads `priority-map.md` + `tasks.md`.
- **Security:** secrets hygiene; identity/role separation; nothing personal in `skills/`.
- **Deliverables:** themed `priority-map.md`, `tasks.md`, `IDENTITY.md`, `USER.md`.

### v1.0 — Hands & senses
- **Goal:** let the agent touch the real world — the four skills, **Tavily** web search, **gog** Google Workspace.
- **Modules:** skills overview, `demos/tavily-search`, `SETUP-GOG`
- **Demo:** live Tavily search with a source; (optional) `gog` calendar read.
- **Security:** least-privilege gog OAuth scopes; `--gmail-no-send`; Tavily key in state volume.
- **Deliverables:** Tavily plugin enabled; (optional) gog authed; skills ✓ ready.

### v1.5 — It acts on its own
- **Goal:** proactive operation — crons (sweeps) + the **30s heartbeat**, driven by `auto-resolver.md`.
- **Modules:** `crons-and-heartbeat`, auto-resolver policy
- **Demo:** `system heartbeat last` ticking on Nemotron; a cron EA sweep.
- **Security:** cheap heartbeat model, silent-by-default, `heartbeat disable` kill switch; cost-as-ops-risk.
- **Deliverables:** 30s heartbeat live; EA-sweep + daily-task-prep crons.

### v2.0 — The Chief of Staff, shipped
- **Goal:** portable, hardened, demo-ready — swap the brain (**nemoclaw**), harden the box, ship it.
- **Modules:** `demos/nemoclaw`, `security-hardening`, `INSTRUCTOR`
- **Demo:** same workspace on Nemotron; secrets-scan clean; key-rotation drill.
- **Security:** container hardening, supply-chain (pinned image + checksummed gog), audit posture, key rotation.
- **Deliverables:** nemoclaw alias; security checklist passed; full workshop runnable end-to-end.

## Decision notes (tradeoffs the council made)

- **5 releases, not 6+.** MVP + DX outvoted the finer-grained curriculum/security
  splits — fewer, independently-shippable steps beat micro-stages for a live workshop.
- **Security is a thread, not a release.** Gilfoyle wanted a dedicated hardening
  release; the council wove his requirements into every release and kept the
  *capstone* (v2.0) as the production-posture checkpoint.
- **Demo/storytelling lens** (the 5th PM, still researching at close) is covered by
  `demos/nemoclaw.md` + `demos/tavily-search.md` and the v0.5 "wow" beat.
- **Token Factory throughout; Nemotron is the v2.0 reveal** — teaches model-portability
  last, once the workspace/skills are stable.
