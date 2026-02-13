#!/usr/bin/env bash
set -euo pipefail

# Print changed file paths for the current git working tree.
# Usage:
#   scripts/changed-files.sh          # unstaged + staged
#   scripts/changed-files.sh --staged # staged only

mode="${1:-all}"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Not inside a git repository." >&2
  exit 1
fi

case "$mode" in
  --staged)
    git diff --cached --name-only
    ;;
  all)
    {
      git diff --name-only
      git diff --cached --name-only
      git ls-files --others --exclude-standard
    } | awk 'NF' | sort -u
    ;;
  *)
    echo "Unknown option: $mode" >&2
    echo "Usage: scripts/changed-files.sh [--staged]" >&2
    exit 2
    ;;
esac
