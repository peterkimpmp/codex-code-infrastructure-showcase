# Migration Inventory (Claude -> Codex)

## Scope Summary
- Source namespace: `.claude/`
- Target namespace: root-level `skills/`, `agents/`, `templates/`, `docs/`, `scripts/`

## File Group Classification

| Source | Count | Decision | Target |
|---|---:|---|---|
| `.claude/skills/*` | 5 skill sets + resources | Migrate | `skills/` |
| `.claude/agents/*.md` | 10 + README | Migrate | `agents/` |
| `.claude/commands/*.md` | 3 | Convert to templates | `templates/` |
| `.claude/hooks/*` | shell/ts configs | Replace by workflow/scripts | `scripts/` + docs |
| `.claude/settings*.json` | 2 | Replace by policy docs | `AGENTS.md` |
| `CLAUDE_INTEGRATION_GUIDE.md` | 1 | Keep as legacy reference | add `CODEX_INTEGRATION_GUIDE.md` |

## Current Migration Status
- `skills/` created and 5 skill sets copied.
- `skills/README.md` added (Codex-first entry point).
- `skills/skill-developer/SKILL.md` rewritten for Codex usage.
- `agents/` created and agent markdown files copied.
- `agents/README.md` rewritten for Codex usage.
- `templates/` created from command docs.
- `templates/route-research-for-testing.template.md` updated to git-based route discovery flow.
- `AGENTS.md` created with Codex trigger/guardrail rules.
- `CODEX_INTEGRATION_GUIDE.md` created.
- `README.md` switched to Codex-first onboarding.
- Legacy policy documented in `docs/legacy-claude-policy.md`.

## Remaining Work
- Normalize any remaining Claude-specific phrasing in selected deep docs when those docs become active maintenance targets.
- Replace additional hook-dependent examples with script-based or explicit command workflows where needed.
- Decide archive timing for `.claude/` after Codex path stabilization.
