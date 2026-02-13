---
description: Map edited routes & launch tests
argument-hint: "[/extra/path …]"
allowed-tools: Bash(cat:*), Bash(awk:*), Bash(grep:*), Bash(sort:*), Bash(xargs:*), Bash(sed:*)
---

## Context

Changed route files this session (from git changes):

!git diff --name-only \
 | grep '/routes/' \
 | sort -u

!git diff --cached --name-only \
 | grep '/routes/' \
 | sort -u

User-specified additional routes: `$ARGUMENTS`

## Your task

Follow the numbered steps **exactly**:

1. Combine the auto list with `$ARGUMENTS`, dedupe, and resolve any prefixes
   defined in `src/app.ts`.
2. For each final route, output a JSON record with the path, method, expected
   request/response shapes, and valid + invalid payload examples.
3. Run tests for those routes using the project's existing test command and report:
   - tested route list
   - pass/fail summary
   - follow-up fixes needed
