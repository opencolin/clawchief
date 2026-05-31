# Module: Security Ops & IT Infrastructure (the "Gilfoyle" module)

> Owner persona: **Bertram Gilfoyle — Security Ops & IT infrastructure.**
> "Your chief of staff can read your email and spend your money. Treat its
> credentials accordingly."

This module is woven through the workshop, not bolted on. Every release that
touches a secret reinforces these rules.

## 1. Secrets never live in the repo

What we did in this build, and what attendees must copy:

- **Model + search keys live in the container's state volume, never in git.**
  Token Factory (`models.providers.tokenfactory.apiKey`) and Tavily
  (`plugins.entries.tavily.config.webSearch.apiKey`) were injected via a
  temporary batch file that was deleted from host **and** container immediately
  after `config set`.
- **`.gitignore` blocks the obvious leaks**: `docker/.env`, `*client_secret*.json`,
  `*credentials*.json`, `gog-home/`, `.gog/`.
- Verify before every commit: `git status` + `git diff --staged | grep -iE 'sk-|tvly-|v1\.|BEGIN .*KEY'`.

## 2. Key rotation

- Treat any key that has been pasted into a chat, terminal, or ticket as
  **compromised** — rotate it. (In this very session a Token Factory key was
  pasted in plaintext; the runbook is to rotate it in the Token Factory console
  and re-inject the new value into the state volume.)
- Rotation drill: `config set models.providers.tokenfactory.apiKey <new>` →
  `restart` → `models status` (confirm `usable`) → revoke the old key.

## 3. Least privilege

- **gog OAuth scopes:** request only what the skills use. Start read-mostly
  (`gmail.readonly`, `calendar.readonly`, `sheets`) and widen only when a skill
  needs send/write. The `--gmail-no-send` flag hard-blocks Gmail sends as a
  belt-and-suspenders agent guard.
- **One service account / one project** per deployment so a leak is contained
  and auditable.

## 4. Container hardening

- Runs as the non-root **`node`** user (uid 1000) — never root.
- Gateway binds **loopback** inside the container; **no host ports published**
  by default. Drive it via `docker exec`, not an exposed dashboard.
- State + secrets isolated in named volumes (`clawchief-state`, `clawchief-gog`),
  not bind-mounted from sensitive host paths.

## 5. Supply chain

- Base image pinned to `ghcr.io/openclaw/openclaw:latest` (pin to a digest for
  production).
- `gog` baked from the **official GitHub release**, architecture-matched
  (`linux_arm64`/`linux_amd64`) — not curl-pipe-to-shell. Add checksum
  verification against `checksums.txt` for production.

## 6. Cost is a security/ops concern

- The 30s heartbeat runs on cheap **Nemotron**, not the primary model, and stays
  **silent** unless something is actionable. Runaway agent loops are a
  availability + billing risk: `system heartbeat disable` is the kill switch.

## Exercise

Attendees run `git diff` + a secret-scan grep on their own fork and prove zero
secrets are tracked, then perform one key-rotation drill end to end.
