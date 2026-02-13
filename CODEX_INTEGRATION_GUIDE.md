# Codex Integration Guide

## Overview
This repository is a reference library. Integrate only the pieces you need into your target project, with Codex as the primary agent runtime.

## Quick Start
1. Copy `AGENTS.md` into your project root and adjust trigger rules for your paths.
2. Copy needed skills from `skills/`.
3. Copy needed agents from `agents/`.
4. Copy needed workflow templates from `templates/`.
5. Validate with your project checks (`typecheck`, `build`, test commands).

## Integrating Skills
- Recommended minimum:
  - `skills/backend-dev-guidelines`
  - `skills/frontend-dev-guidelines`
  - `skills/error-tracking`
- Optional:
  - `skills/route-tester`
  - `skills/skill-developer`

### Path Customization
- Replace example path assumptions with your real project paths in your project `AGENTS.md`.
- Keep rules explicit, for example:
  - Backend: `apps/api/**`, `services/**`, `backend/**`
  - Frontend: `apps/web/**`, `frontend/**`, `client/**`

## Integrating Agents
- Agents are markdown-based operating procedures in `agents/`.
- Copy only what you use and update hardcoded paths/commands to your environment.

## Replacing Claude Hooks
This Codex version intentionally avoids Claude event hooks. Use explicit workflow steps:
1. Skill selection via `AGENTS.md` rules.
2. Change tracking with git + optional script (`scripts/changed-files.sh`).
3. End-of-task validation by running checks.

## Dev Docs Workflow
For non-trivial tasks, create:
- `dev/active/<task>/<task>-plan.md`
- `dev/active/<task>/<task>-context.md`
- `dev/active/<task>/<task>-tasks.md`

Use templates under `templates/` as starting points.

## Migration Notes
- Legacy Claude-specific assets remain under `.claude/`.
- Codex-first assets are at root-level directories:
  - `skills/`
  - `agents/`
  - `templates/`
  - `docs/`
  - `scripts/`
- Legacy handling policy:
  - `docs/legacy-claude-policy.md`
