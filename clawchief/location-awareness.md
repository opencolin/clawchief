# Location Awareness

Status: v1
Purpose: make clawchief location-aware so Richard's task list, reminders, and appointment triage reflect where he physically is and whether a task is actually doable from that place.

## Ownership boundary

This file owns:
- place-based actionability
- travel-aware task interpretation
- location constraints that affect scheduling or task visibility

This file does not own:
- urgency ranking
- task-system schema
- inbox reply procedure
- meeting-note ingestion

## Core principle

Do not present a task as actionable if Richard cannot physically do it from his current location.

Location is part of task context, not a nice-to-have.
A good daily plan should distinguish between:
- can do anywhere
- can do while traveling
- requires being at the Pied Piper office
- requires being at a specific meeting location (e.g. Raviga, a customer site, court)
- can be delegated by Anton

## Current known anchor

- Home base is the Pied Piper office in Palo Alto.
- On-site engineering, hardware/server, and in-person demo tasks default to the office unless explicitly noted otherwise.

## Operating rules

1. When Richard is traveling (investor roadshow, conference, court, customer visit), suppress or reframe office-only tasks as blocked, delegated, or rescheduled instead of showing them as normal active tasks.
2. When a task clearly depends on a place, add the location constraint into the task text.
3. When an appointment or meeting is time-bound and location-bound, preserve both in the task text when known.
4. If Richard's travel status creates a conflict with an existing task, update the task in the same turn.
5. If a task is still important but cannot be done from Richard's current location, choose one of these states:
   - blocked while traveling
   - delegate to someone else (e.g. Jared, Gilfoyle, Dinesh)
   - reschedule to the next plausible date/location window
6. Prefer specific language over implicit assumptions. Example: "blocked while Richard is traveling; office task" is better than silently leaving the task open.
7. Use calendar/travel context plus explicit statements from Richard as the source of truth for current location assumptions.
8. For scheduling decisions, any shared travel/conflict calendar is a required source of truth, not optional supporting context.
9. If location is uncertain and it changes whether the task is actionable or whether Richard can take a meeting, ask or mark the assumption clearly and do not book.

## Integration points

- Task wording, section, due date, and labels should reflect location constraints when relevant.
- `clawchief/priority-map.md` already treats travel and schedule integrity as priority context.
- `daily-task-prep` should use this rule when curating `## Today`.
- Heartbeat check-ins should avoid nudging Richard about tasks he cannot physically do from where he is.
- The executive-assistant workflow should use this rule before offering times or treating travel windows as available.

## Examples

- "Swap the failing server / on-site infra task" while Richard is traveling -> move out of `## Today`, mark blocked while traveling, delegate to Gilfoyle, and make the office constraint visible.
- "Call with Monica" while traveling -> still actionable because location does not block it.
- "Investor pitch at Raviga" -> location-bound; preserve the place and time in the task.
- "Review the compression benchmark doc" while traveling -> still actionable if it can be done online.

## Follow-through

When a new recurring place-based pattern appears, compile it into clawchief instead of relying on chat memory.
