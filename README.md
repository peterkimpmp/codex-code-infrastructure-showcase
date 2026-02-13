# Codex Code Infrastructure Showcase

Codex 중심으로 재구성한 AI 코딩 인프라 레퍼런스 저장소입니다.  
실행 앱이 아니라, 프로젝트에 복사/적용하는 운영 템플릿 모음입니다.

## Quick Start (Codex)
1. `AGENTS.md`를 읽고 프로젝트 규칙을 맞춥니다.
2. 필요한 스킬을 `skills/`에서 선택합니다.
3. 필요한 에이전트를 `agents/`에서 선택합니다.
4. 반복 작업은 `templates/` 템플릿으로 시작합니다.
5. 작업 종료 전 `scripts/changed-files.sh`와 프로젝트 검증 명령을 실행합니다.

## Repository Layout (Codex-first)
- `AGENTS.md`
  - Codex 스킬 트리거/가드레일/작업 프로토콜
- `skills/`
  - 도메인 지식 기반 가이드(백엔드/프론트/테스트/에러 트래킹/스킬 개발)
- `agents/`
  - 복잡 작업용 전문 에이전트 지시문
- `templates/`
  - 계획/컨텍스트 업데이트/라우트 리서치 템플릿
- `docs/`
  - 마이그레이션 인벤토리, 레거시 정책 문서
- `scripts/`
  - 운영 보조 스크립트

## Integration Docs
- 활용 매뉴얼: `USAGE_MANUAL.md`
  - 시작 절차(첫 10분)
  - 스킬/에이전트/템플릿 사용법
  - 일일 운영 루틴
  - 품질 체크리스트
  - 레거시 `.claude` 정책
  - 빠른 트러블슈팅
- Codex 통합 가이드: `CODEX_INTEGRATION_GUIDE.md`
- 마이그레이션 계획서: `migration-plan-claude-to-codex.md`
- 요약 문서: `summary.md`

## Legacy (Claude)
- 기존 Claude 전용 자산은 `.claude/`에 보존되어 있습니다.
- 기본 경로는 Codex이며, `.claude`는 레거시 참조 전용입니다.
- 정책 상세: `docs/legacy-claude-policy.md`

## License
MIT (`LICENSE`)
