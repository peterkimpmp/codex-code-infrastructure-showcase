# AGENTS.md

## Purpose
Codex-first operating rules for this repository. This file replaces Claude hook-based auto-activation with explicit trigger rules and repeatable workflows.

## Skill Trigger Rules
- Use `skills/backend-dev-guidelines` when task includes API routes, controllers, services, repositories, Prisma, middleware, or backend validation.
- Use `skills/frontend-dev-guidelines` when task includes React components, MUI, routing, data fetching, frontend state, or UI performance.
- Use `skills/route-tester` when task includes authenticated endpoint testing, cookie/JWT auth, or route verification.
- Use `skills/error-tracking` when task includes Sentry setup, exception capture, monitoring, or production-debug context.
- Use `skills/skill-developer` when creating/updating skills, trigger rules, or capability packaging.

## Guardrail Rules (Codex)
- Before frontend code edits, verify MUI version compatibility and avoid legacy v5/v6 API patterns.
- Before major backend edits, enforce layered boundaries: route -> controller -> service -> repository.
- Before finishing a task, run available project checks (at minimum `typecheck` and `build` if defined).
- 코드 주석은 기본적으로 한글로 작성한다.

## Working Protocol
1. Identify applicable skill(s) from trigger rules.
2. Read only required skill sections/resources (progressive disclosure).
3. Apply changes.
4. Run validation commands.
5. Record outcomes and next actions in `dev/active/<task>/` when work is non-trivial.

## Templates
- Planning: `templates/dev-docs.template.md`
- Context update: `templates/dev-docs-update.template.md`
- Route testing research: `templates/route-research-for-testing.template.md`
