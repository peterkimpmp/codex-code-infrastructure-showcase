# Agents (Codex)

복잡한 다단계 작업을 분리 실행하기 위한 에이전트 지시문 모음입니다.

## 사용 원칙
1. 작업 목적에 맞는 에이전트 하나를 먼저 선택합니다.
2. 에이전트 문서의 경로/명령이 현재 프로젝트와 맞는지 확인합니다.
3. 실행 후 결과물 파일 경로와 검증 명령을 반드시 남깁니다.

## 에이전트 목록
- `code-architecture-reviewer.md`
- `code-refactor-master.md`
- `documentation-architect.md`
- `frontend-error-fixer.md`
- `plan-reviewer.md`
- `refactor-planner.md`
- `web-research-specialist.md`
- `auth-route-tester.md`
- `auth-route-debugger.md`
- `auto-error-resolver.md`

## 커스터마이징이 필요한 항목
- `auth-route-tester.md`, `auth-route-debugger.md`
  - JWT cookie 인증 방식/서비스 URL을 프로젝트 기준으로 수정
- `auto-error-resolver.md`
  - 타입 에러 캐시 경로/검증 명령을 프로젝트 기준으로 수정
- `frontend-error-fixer.md`
  - 스크린샷/로그 경로를 프로젝트 기준으로 수정

## 권장 검증
- 경로 하드코딩 검사:
```bash
rg -n "/Users/|~/.claude|CLAUDE_PROJECT_DIR|CLAUDE.md" /Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/agents
```
- 실행 전 변경 파일 확인:
```bash
/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/scripts/changed-files.sh
```

