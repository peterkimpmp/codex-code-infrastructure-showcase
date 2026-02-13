# Legacy Claude Policy

## Policy Decision
`.claude/` 디렉터리는 당분간 **read-only legacy reference**로 유지한다.

## Rationale
- 과거 운영 지식(훅/설정/명령 템플릿) 보존 가치가 있음
- 즉시 삭제 시 회귀 검증/비교가 어려움
- Codex 전환 기간 동안 참조 소스로 필요

## Operating Rules
- 신규 기능/문서는 `.claude/`에 추가하지 않는다.
- 기본 온보딩/문서 링크는 Codex 경로를 사용한다.
- `.claude/` 변경은 레거시 보존 또는 긴급 수정에 한해 허용한다.

## Sunset Conditions
아래 조건을 모두 만족하면 `.claude/`를 아카이브 또는 제거 검토:
1. Codex 경로에서 핵심 시나리오(백엔드/프론트/테스트)가 안정적으로 재현됨
2. README 및 통합 가이드에서 Claude 기본 경로 의존이 제거됨
3. 팀 합의된 대체 운영 절차가 문서화됨

