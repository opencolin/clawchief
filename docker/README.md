# clawchief in Docker (Pied Piper edition)

Runs OpenClaw + the `gog` Google Workspace CLI + the Pied Piper chief-of-staff
pack as an isolated container, separate from any OpenClaw install on the host.

**Principal:** Richard Hendricks (CEO) · **Chief of staff:** Anton ·
**Company:** Pied Piper

## What's in the image

- `ghcr.io/openclaw/openclaw:latest` (the OpenClaw gateway, Debian 12 / Node 24)
- `gog` (Google Workspace CLI), baked native to the build arch
- the four skills (`executive-assistant`, `business-development`,
  `daily-task-manager`, `daily-task-prep`) staged at `/opt/clawchief`
- the `clawchief/` source-of-truth files + `IDENTITY.md` / `USER.md` /
  `TOOLS.md` / `HEARTBEAT.md`, themed as Pied Piper

## Quick start

```bash
cp docker/.env.example docker/.env     # set a GOG_KEYRING_PASSWORD (+ a model key when ready)
./docker/clawchief-up.sh all           # build + onboard + overlay + start the gateway
./docker/clawchief-up.sh status        # gateway + skills list
```

State persists in the `clawchief-state` and `clawchief-gog` Docker volumes.

## Wire a model provider

The gateway onboards with `--auth-choice skip` so it stands up without a model.
To actually run agent turns, add a provider key to `docker/.env` and re-onboard
or set it via the CLI:

```bash
./docker/clawchief-up.sh cli models status
```

## Connect Google Workspace (gog)

You need a Google OAuth **desktop** client JSON (see `../SETUP-GOG.md`).

```bash
# load the OAuth client into the container
docker compose -f docker/docker-compose.yml cp /path/to/client_secret.json clawchief:/tmp/cs.json
./docker/clawchief-up.sh cli ... # (auth steps; gog supports a headless --remote flow)
```

`gog` stores tokens in the encrypted file keyring under `GOG_HOME=/home/node/.gog`
(volume `clawchief-gog`), unlocked by `GOG_KEYRING_PASSWORD`.

## Useful commands

```bash
docker compose -f docker/docker-compose.yml logs -f          # gateway logs
docker compose -f docker/docker-compose.yml exec clawchief node openclaw.mjs status
docker compose -f docker/docker-compose.yml exec clawchief gog auth list
docker compose -f docker/docker-compose.yml down             # stop (keeps volumes)
```
