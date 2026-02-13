#!/usr/bin/env bash
set -euo pipefail

# 현재 git 작업 트리에서 변경된 파일 경로를 출력한다.
# 사용법:
#   scripts/changed-files.sh          # 스테이징 전 + 스테이징 후 파일
#   scripts/changed-files.sh --staged # 스테이징된 파일만

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
