# TOOLS.md - Local Notes (Pied Piper)

Use this file for environment-specific details that should *not* live in public skills.

## Communication defaults

- Principal name: `Richard Hendricks` (Founder & CEO, Pied Piper)
- Assistant name: `Anton` (clawchief / OpenClaw chief of staff)
- Primary assistant email: `{{ASSISTANT_EMAIL}}`
- Primary work email / calendar: `{{PRIMARY_WORK_EMAIL}}`
- Personal email: `{{PERSONAL_EMAIL}}`
- Time zone: `America/Los_Angeles`
- Primary proactive update route: `{{PRIMARY_UPDATE_CHANNEL}} -> {{PRIMARY_UPDATE_TARGET}}`

## Calendars to check

List the calendars that should be treated as real availability constraints.

- `{{PRIMARY_WORK_EMAIL}}` (Richard's Pied Piper calendar — default write calendar)
- `{{PERSONAL_EMAIL}}` (personal, conflict source)

## Outreach tracker

- Live tracker / sheet id: `{{GOOGLE_SHEET_ID}}`
- Treat this as the source of truth for developer-adoption / partnership outreach state.
- Document the current expected columns here if the sheet is customized.

## Business-development playbook

- Geography: the SF Bay Area
- Primary segment: engineering and infrastructure teams (large data / media / backup workloads)
- Secondary segment: dev-tool and hosting companies open to an integration partnership
- Daily new leads: 10
- Verify a working website + a real public email before adding a lead
- Pitch angle: middle-out compression that cuts storage and bandwidth cost without changing the customer's stack
- Default outreach tone: warm, brief, founder-led, no hard sell

## Notes

- `gog` is the Google Workspace CLI used for Gmail, Calendar, and Sheets work. Inside the container it reads credentials from `GOG_HOME` with the encrypted file keyring.
- Competitor to watch: Hooli (Gavin Belson). Treat anything Hooli-related as sensitive.
