# Codex 활용 매뉴얼

## 1. 문서 목적
이 문서는 `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase`를 실제 프로젝트에 적용할 때 필요한 최소 운영 절차를 제공합니다.

## 2. 핵심 구성요소
- 운영 규칙: `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/AGENTS.md`
- 스킬: `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/skills`
- 에이전트: `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/agents`
- 템플릿: `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/templates`
- 통합 가이드: `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/CODEX_INTEGRATION_GUIDE.md`
- 변경 파일 확인 스크립트: `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/scripts/changed-files.sh`

## 3. 시작 절차 (처음 10분)
1. 대상 프로젝트 루트에 `AGENTS.md`를 배치하거나 병합합니다.
2. 필요한 스킬만 `skills/`에서 선택해 복사합니다.
3. 필요한 에이전트만 `agents/`에서 선택해 복사합니다.
4. 반복 작업이 많다면 `templates/` 파일을 함께 복사합니다.
5. 프로젝트 검증 명령을 확인합니다.
   - 예: `npm run typecheck`, `npm run build`, `npm test`

## 4. 스킬 사용법
### 언제 쓰는가
- 백엔드 작업: `skills/backend-dev-guidelines`
- 프론트 작업: `skills/frontend-dev-guidelines`
- 인증 라우트 테스트: `skills/route-tester`
- 에러 모니터링: `skills/error-tracking`
- 스킬 설계/개선: `skills/skill-developer`

### 사용 순서
1. 해당 스킬의 `SKILL.md`를 먼저 읽습니다.
2. 필요한 경우 `resources/` 문서를 추가로 읽습니다.
3. 코드 수정 후 검증 명령을 실행합니다.

## 5. 에이전트 사용법
### 권장 흐름
1. 작업 성격에 맞는 에이전트를 하나 선택합니다.
2. 에이전트 문서 내 경로/명령을 현재 프로젝트에 맞게 수정합니다.
3. 결과물 파일 경로(예: `dev/active/...`)를 명시하고 실행합니다.
4. 최종 보고에 변경 파일/검증 결과를 포함합니다.

### 자주 쓰는 에이전트
- 아키텍처 리뷰: `agents/code-architecture-reviewer.md`
- 리팩터 계획: `agents/refactor-planner.md`
- TS 오류 자동 복구: `agents/auto-error-resolver.md`

## 6. 템플릿 사용법
- 계획 수립: `templates/dev-docs.template.md`
- 세션 정리/업데이트: `templates/dev-docs-update.template.md`
- 라우트 리서치/테스트 준비: `templates/route-research-for-testing.template.md`

복잡한 작업은 아래 구조를 유지합니다.
- `dev/active/<task>/<task>-plan.md`
- `dev/active/<task>/<task>-context.md`
- `dev/active/<task>/<task>-tasks.md`

## 7. 일일 운영 루틴 (권장)
1. 오늘 작업 범위를 한 줄로 정의합니다.
2. 해당 스킬을 선택하고 `SKILL.md`를 확인합니다.
3. 코드 수정을 진행합니다.
4. 변경 파일을 확인합니다.
   - `scripts/changed-files.sh`
5. 검증 명령을 실행합니다.
6. 비단순 작업이면 `dev/active/...` 문서를 업데이트합니다.

## 8. 품질 체크리스트
- [ ] 스킬 선택 근거가 명확한가
- [ ] 변경 파일 목록을 확인했는가
- [ ] `typecheck/build/test` 중 필요한 검증을 실행했는가
- [ ] 결과/다음 액션이 문서화되었는가

## 9. 레거시(.claude) 정책
- `.claude/`는 기본 경로가 아니라 레거시 참조입니다.
- 정책 문서: `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/docs/legacy-claude-policy.md`
- 신규 기능/문서는 Codex 경로(`AGENTS.md`, `skills/`, `agents/`, `templates/`)에만 추가합니다.

## 10. 빠른 트러블슈팅
- 스킬 적용이 애매할 때:
  - `AGENTS.md` 트리거 규칙을 먼저 확인/수정
- 에이전트가 프로젝트와 안 맞을 때:
  - 하드코딩 경로/명령부터 수정
- 검증이 자주 누락될 때:
  - 작업 종료 루틴에 `scripts/changed-files.sh` + 검증 명령을 고정

