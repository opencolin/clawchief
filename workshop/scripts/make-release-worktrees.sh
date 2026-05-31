#!/usr/bin/env bash
# Create one git branch + worktree per release version, off the current baseline.
# Demonstrates the "worktree per release" pattern (one isolated tree per version).
#
# Usage: ./workshop/scripts/make-release-worktrees.sh v0.1 v0.5 v1.0 v1.5 v2.0
set -euo pipefail
cd "$(git -C "$(dirname "$0")/../.." rev-parse --show-toplevel)"
BASE="$(git branch --show-current)"
ROOT="$(pwd)"; PARENT="$(dirname "$ROOT")"
[ "$#" -ge 1 ] || { echo "usage: $0 v0.1 v0.5 v1.0 v1.5 v2.0" >&2; exit 1; }
for v in "$@"; do
  branch="release/$v"
  wt="$PARENT/clawchief-$v"
  git show-ref --verify --quiet "refs/heads/$branch" || git branch "$branch" "$BASE"
  if [ -d "$wt" ]; then echo "worktree exists: $wt"; else
    git worktree add "$wt" "$branch" >/dev/null && echo "created worktree: $wt  (branch $branch)"
  fi
done
echo "---"; git worktree list
