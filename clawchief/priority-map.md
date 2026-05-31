# Priority Map

Purpose: define who and what should matter enough to interrupt Richard, trigger Anton action, or be safely ignored.

This file is the canonical "people + programs" layer for OpenClaw prioritization at Pied Piper.

## Ownership boundary

This file owns:
- people importance
- program importance
- urgency level
- routing/action mode

This file does not own:
- task storage mechanics
- reply wording
- meeting-note ingestion procedure
- cron timing or retries

## How to use this file

When a new signal arrives from Slack, email, calendar, tasks, meeting notes, docs, or notes:

1. Map it to zero or more *people*
2. Map it to zero or more *programs*
3. Assign an urgency level
4. Choose the action mode

If a signal maps to no important people and no important programs, it should usually be ignored or batched and then archived.

## Urgency levels

- **P0 — interrupt now**
  - time-sensitive, high-stakes, or blocking
  - appropriate to put in front of Richard quickly
- **P1 — same day**
  - important enough to surface today
  - may require Richard or Anton action today
- **P2 — digest / batched**
  - worth tracking, but not worth interrupting Richard for immediately
- **P3 — ignore / archive**
  - low-value noise, duplicative context, or non-actionable chatter

## Action modes

- **Interrupt Richard now** — surface directly as a short, clear alert
- **Handle and summarize** — Anton acts, then gives Richard a concise update if helpful
- **Queue for digest** — hold for next structured summary / heartbeat if still relevant
- **Ignore** — no user-facing message needed

## Task grouping convention

Task labels and section choices should connect back to this file's program/person grouping when there is a clear match.

Preferred pattern:

- owner assignment: `richard` or `anton`
- one program section when there is a clear match
- due date or deadline to express when the next action should happen
- labels only for secondary context when they add real value

Rules:
- Use the exact program names from this file when choosing task sections whenever there is a clear match.
- If a task does not clearly map to a program or person here, leave it unlabeled rather than inventing a noisy label.
- Do not use workflow-state sections like `Today`, `Next`, `Waiting`, or `Scheduled`; due dates should carry timing/state instead.
- Preserve stable program grouping unless Richard explicitly wants a regroup.

## People

People are not only important because they are operationally relevant.
They are also important because they matter relationally to the principal.
The system should treat trust, loyalty, and relationship depth as real prioritization signals, not just logistics.

### Richard Hendricks
- Why he matters:
  - he is the principal, the founder and CEO, and the person this whole system exists to help
- Watch for:
  - direct asks
  - approvals needed
  - decisions only Richard can make
  - anything that affects his calendar, the platform roadmap, fundraising, or the Hooli dispute
- Escalate to P0 when:
  - there is a hard deadline within 24 hours
  - there is a meeting conflict or urgent scheduling issue
  - an investor / board / customer / legal item is blocked on him
- Default action:
  - usually interrupt Richard now or handle and summarize

## Core team

### Jared (Donald) Dunn
- Role: COO and head of operations / business
- Why he matters:
  - he is the highest-trust operator at Pied Piper and effectively runs the business side
  - fundraising logistics, partnerships, hiring, finances, and operating judgment run through him
  - he is fiercely loyal and almost always aligned with Richard's interests
- Watch for:
  - operations, finance, fundraising prep, partnership logistics, and hiring
  - anything where Jared is coordinating a deliverable or chasing a commitment
- Escalate to P0 when:
  - a live thread needs an operating or finance decision to keep moving
  - Jared flags something he thinks Richard must see
- Default action:
  - handle and summarize, or interrupt Richard if Jared input is blocking an important thread

### Bertram Gilfoyle
- Role: Security Ops & IT infrastructure
- Why he matters:
  - he owns security operations, IT infrastructure, secrets/credential hygiene, and uptime for the platform
- Watch for:
  - security incidents, credential/secret exposure, and key rotation
  - server / infrastructure incidents and IT/access issues
  - platform reliability, scaling, and the compression engine's systems layer
- Escalate to P0 when:
  - there is a security incident, leaked credential, outage, or infrastructure failure affecting the platform
- Default action:
  - handle and summarize; interrupt Richard on real incidents

### Dinesh Chugtai
- Role: Lead engineer (product + features)
- Why he matters:
  - he owns core product engineering and feature delivery
- Watch for:
  - feature progress, release blockers, code/product issues, demo readiness
- Escalate to P1 when:
  - a release or demo-critical feature is blocked or slipping
- Default action:
  - handle and summarize

### Nelson "Big Head" Bighetti
- Why he matters:
  - longtime friend of Richard's and an important relationship, even when his role is ambiguous
  - he frequently sits inside or near Hooli, which makes him a useful (if accidental) signal source
- Watch for:
  - friendly check-ins, casual intel about Hooli, collaboration or favor requests
- Escalate to P1 when:
  - he passes along something time-sensitive about Hooli or a real ask Richard should not miss
- Default action:
  - handle and summarize; do not over-interrupt Richard unless it is strategically useful

### Jian Yang
- Why he matters:
  - he is prone to cloning Pied Piper's product and spinning up competing knockoffs
  - communication involving Jian Yang can carry IP, competitive, or reputational risk
- Watch for:
  - signs of a copied product or competing launch
  - requests for access, code, data, or introductions that could leak advantage
- Escalate to P0 when:
  - there is evidence of a clone, a leak, or an attempt to extract proprietary information
- Default action:
  - escalate without acting when risk is involved; otherwise queue for digest

## Board / investors

### Laurie Bream
- Why she matters:
  - she leads Raviga Capital, Pied Piper's lead investor, and holds real board power over financing and direction
  - communication involving Laurie can affect Richard's strategic accountability, runway, and control
- Watch for:
  - board updates, investor communications, metrics requests, term-sheet and financing items
  - decisions that affect financing, reporting, or strategic accountability
- Escalate to P0 when:
  - there is a near-term board / investor deadline or a sensitive strategic issue
- Default action:
  - handle and summarize unless a Richard decision is required soon

### Monica Hall
- Why she matters:
  - she is Pied Piper's most reliable advocate inside Raviga and a high-trust strategic relationship
  - she often gives Richard the honest read and early warning the board will not
- Watch for:
  - candid guidance, early signals on board sentiment, intros, and support offers
- Escalate to P1 when:
  - she flags a live board / investor risk or a reply opportunity that should not sit
- Default action:
  - handle and summarize, escalating when strategic

## Competitors

### Gavin Belson (Hooli)
- Why he matters:
  - he is CEO of Hooli, Pied Piper's primary competitor, and an active strategic and legal threat
  - Hooli's moves can affect litigation, talent, distribution, and market positioning
- Watch for:
  - competitive announcements, product launches (e.g. Nucleus / box), poaching attempts
  - litigation activity, press, and anything that signals a strategic attack
- Escalate to P0 when:
  - there is a litigation development, a competitive launch, or a poaching / IP threat that needs same-day attention
- Default action:
  - escalate without acting on sensitive items; interrupt Richard when a real threat is live

## Programs

### Middle-Out compression engine
- Why it matters:
  - this is the core technology and the entire reason Pied Piper exists
- Watch for:
  - algorithm progress, benchmark results (Weissman score), performance regressions, demo readiness
- Escalate to P0 when:
  - a benchmark, demo, or release the company is counting on is blocked or at risk
- Default action:
  - handle and summarize, escalating when Richard's decision or approval is needed
- Ignore / downgrade:
  - vague "make it faster" chatter with no concrete next step

### First paying users / customers
- Why it matters:
  - Richard said converting real adoption into paying users is the immediate top company priority
- Adoption ladder (example targets):
  - 2026-06-30: first 50 paying users
  - 2026-07-31: 250 paying users
  - 2026-08-31: 1,000 paying users
  - Current: 0
- Watch for:
  - anything that can directly create users, learn from prospects, unblock acquisition, or improve conversion
- Examples:
  - developer signups, pilot deals, integration requests, pricing reactions, churn signals
- Escalate to P0 when:
  - a near-term revenue or adoption opportunity is blocked on Richard
- Default action:
  - handle and summarize, or interrupt Richard if his action is required today

### PiperNet / decentralized internet
- Why it matters:
  - this is the long-horizon platform vision built on top of the compression engine
- Watch for:
  - network milestones, node growth, protocol decisions, and partner infrastructure
- Escalate to P1 when:
  - a milestone, decision, or partner dependency could stall the build
- Default action:
  - queue for digest unless action is clearly time-sensitive

### Fundraising / board & investor
- Why it matters:
  - runway and board confidence determine whether Pied Piper survives to ship
- Watch for:
  - investor updates, board reports, metrics, term sheets, materials due to Laurie / Monica / Raviga
- Escalate to P0 when:
  - a board or investor deliverable is due soon or a financing decision needs Richard
- Default action:
  - handle and summarize, drafting first on anything investor-facing

### Hooli litigation / IP defense
- Why it matters:
  - the Hooli dispute is an existential legal risk and must never be answered casually
- Watch for:
  - filings, deadlines, counsel requests, discovery items, anything tied to Gavin / Hooli legal
- Escalate to P0 when:
  - a legal deadline or a risky outbound response is live
- Default action:
  - escalate without acting; draft only with Richard's review

### Developer adoption & integration partnerships
- Why it matters:
  - this is the live business-development motion: partnerships and integrations that drive developer adoption of the compression platform
- Watch for:
  - outreach replies, follow-up gaps, partner questions, objections, pilot and integration opportunities
- Escalate to P0 when:
  - a strong reply or meeting opportunity is waiting and timing matters
- Default action:
  - handle and summarize

### Launches & PR (TechCrunch Disrupt and beyond)
- Why it matters:
  - launch moments and press drive credibility, signups, and investor confidence
- Watch for:
  - demo prep, recording / publishing deadlines, press requests, speaking opportunities
- Escalate to P1 when:
  - a recording window, publishing deadline, or demo blocker could stall momentum
- Default action:
  - handle and summarize unless same-day action is needed; draft first on anything public-facing in Richard's voice

### Infrastructure, uptime & cost
- Why it matters:
  - servers, reliability, and burn rate create real operational load and can sink the company if mismanaged
- Watch for:
  - outages, scaling issues, cloud spend, vendor coordination, security maintenance
- Escalate to P0 when:
  - there is an outage or security incident; P1 when cost or scaling needs a decision
- Default action:
  - handle and summarize

### Hiring / team
- Why it matters:
  - the right (and wrong) hires directly shape execution capacity
- Watch for:
  - candidate pipelines, interview scheduling, offers, and team issues
- Escalate to P1 when:
  - a key candidate or a team issue is time-sensitive
- Default action:
  - handle and summarize

### Executive assistant: inbox, calendar, schedule integrity
- Why it matters:
  - this is the operating system for Richard's day-to-day execution capacity
- Watch for:
  - scheduling follow-ups, inbox cleanup, meeting prep, calendar integrity issues
- Escalate to P1 when:
  - a scheduling issue or inbox follow-up could disrupt the next few days
- Default action:
  - handle and summarize

### Personal / wellbeing
- Why it matters:
  - Richard tends to disappear into the company; basic personal logistics and health still matter and protect his capacity to lead
- Watch for:
  - personal reminders, health / appointments, anything time-sensitive he would not want dropped
- Escalate to P1 when:
  - a personal obligation is time-sensitive or important enough that Richard would want it surfaced
- Default action:
  - handle and summarize

### clawchief improvement
- Why it matters:
  - compounds Anton's effectiveness over time
- Watch for:
  - operator patterns worth copying
  - setup changes that improve autonomy, prioritization, or execution
  - new OpenClaw capabilities that can be turned into better clawchief workflows
- Escalate to P1 when:
  - Richard explicitly asks for system-improvement work or a change is clearly high leverage
- Default action:
  - convert into a concrete task or proposal instead of leaving it as a vague idea
- Ignore / downgrade:
  - theoretical AI chatter without a concrete operational implication

## Default routing rules

Use these deterministic routing defaults unless a clearer instruction overrides them:

- general inbox, scheduling, calendar integrity, or operational coordination -> `executive-assistant`
- partner / integration / prospect pipeline, outreach tracker, lead verification, or prospecting batch work -> `business-development`
- direct task CRUD, reprioritization, completion, or current-task review -> `daily-task-manager`
- morning due-date retuning and daily actionability prep -> `daily-task-prep`
- meeting notes enter through `executive-assistant`, then route into `business-development` too if the note changes outreach / partner state

If a signal maps to more than one route, choose the workflow that owns the live source of truth being changed.

## Things that should usually be ignored or batched

- casual chatter with no action
- repeated notifications that add no new information
- documents or messages with no connection to a priority person or program
- speculative ideas without owner, deadline, or next step
- low-stakes activity already captured in the task list

## Review cadence

Review this file when:
- Richard says priorities changed
- a new person becomes important
- a new recurring program appears
- summaries feel noisy or are missing important things
