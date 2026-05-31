# syntax=docker/dockerfile:1
#
# clawchief — OpenClaw + gog (Google Workspace CLI) + the Pied Piper chief-of-staff pack,
# baked into one image so the operator's required binaries exist at image-build time
# (installing them at runtime would be lost on container restart).
#
FROM ghcr.io/openclaw/openclaw:latest

# ---------------------------------------------------------------------------
# 1) Bake in the `gog` Google Workspace CLI, native to the build architecture.
# ---------------------------------------------------------------------------
ARG TARGETARCH
ARG GOGCLI_VERSION=0.20.0
USER root
RUN set -eux; \
    case "${TARGETARCH:-amd64}" in \
      amd64) gogarch=amd64 ;; \
      arm64) gogarch=arm64 ;; \
      *) echo "unsupported TARGETARCH: ${TARGETARCH}" >&2; exit 1 ;; \
    esac; \
    curl -fsSL -o /tmp/gog.tgz \
      "https://github.com/openclaw/gogcli/releases/download/v${GOGCLI_VERSION}/gogcli_${GOGCLI_VERSION}_linux_${gogarch}.tar.gz"; \
    tar -xzf /tmp/gog.tgz -C /usr/local/bin gog; \
    rm -f /tmp/gog.tgz; \
    chmod 0755 /usr/local/bin/gog; \
    gog --version

# ---------------------------------------------------------------------------
# 2) Stage the Pied Piper clawchief pack (skills + source-of-truth workspace).
#    clawchief-up.sh overlays /opt/clawchief into the live workspace after the
#    gateway is onboarded, so onboarding can't clobber these files.
# ---------------------------------------------------------------------------
COPY --chown=node:node skills    /opt/clawchief/skills
COPY --chown=node:node clawchief /opt/clawchief/clawchief
COPY --chown=node:node workspace /opt/clawchief/workspace

USER node
