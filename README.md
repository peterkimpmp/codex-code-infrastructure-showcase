# Codex Code Infrastructure Showcase

Codex 중심으로 재구성한 AI 코딩 인프라 레퍼런스 저장소입니다.  
실행 앱이 아니라, 프로젝트에 복사/적용하는 운영 템플릿 모음입니다.

## Quick Start (Codex)
1. `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/AGENTS.md`를 읽고 프로젝트 규칙을 맞춥니다.
2. 필요한 스킬을 `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/skills`에서 선택합니다.
3. 필요한 에이전트를 `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/agents`에서 선택합니다.
4. 반복 작업은 `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/templates` 템플릿으로 시작합니다.
5. 작업 종료 전 `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/scripts/changed-files.sh`와 프로젝트 검증 명령을 실행합니다.

## Repository Layout (Codex-first)
- `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/AGENTS.md`
  - Codex 스킬 트리거/가드레일/작업 프로토콜
- `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/skills/`
  - 도메인 지식 기반 가이드(백엔드/프론트/테스트/에러 트래킹/스킬 개발)
- `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/agents/`
  - 복잡 작업용 전문 에이전트 지시문
- `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/templates/`
  - 계획/컨텍스트 업데이트/라우트 리서치 템플릿
- `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/docs/`
  - 마이그레이션 인벤토리, 레거시 정책 문서
- `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/scripts/`
  - 운영 보조 스크립트

## Integration Docs
- Codex 통합 가이드: `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/CODEX_INTEGRATION_GUIDE.md`
- 마이그레이션 계획서: `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/migration-plan-claude-to-codex.md`
- 요약 문서: `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/summary.md`

## Legacy (Claude)
- 기존 Claude 전용 자산은 `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/.claude`에 보존되어 있습니다.
- 기본 경로는 Codex이며, `.claude`는 레거시 참조 전용입니다.
- 정책 상세: `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/docs/legacy-claude-policy.md`

## License
MIT (`/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/LICENSE`)

