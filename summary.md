# codex-code-infrastructure-showcase 요약

## 1) 저장소 목적
- 이 저장소는 **실행 가능한 앱**이 아니라, Claude Code 운영 경험을 바탕으로 만든 **인프라 레퍼런스 라이브러리**다.
- 핵심 가치는 다음 4가지다.
  - 스킬 자동 활성화(Hook + 규칙 파일)
  - 모듈형 스킬 설계(컨텍스트 절약용 Progressive Disclosure)
  - 복잡 작업용 전문 에이전트
  - 세션 리셋 대응용 Dev Docs 패턴

## 2) 최상위 주요 파일
- `README.md`: 저장소 전체 개요, 구성요소 카탈로그, 빠른 시작 안내.
- `CLAUDE_INTEGRATION_GUIDE.md`: Claude 기준 통합 절차(호환성 확인, 파일 복사, 설정 커스터마이징, 검증).
- `dev/README.md`: 장기/복잡 작업을 위한 문서화 패턴(Plan/Context/Tasks 3파일 구조).
- `LICENSE`: MIT 라이선스.

## 3) 핵심 디렉터리 구조
- `.claude/skills/`
  - 5개 스킬(백엔드/프론트엔드/에러추적/라우트테스트/스킬개발)과 `skill-rules.json` 포함.
  - 역할: 프롬프트/파일/코드 패턴을 기반으로 어떤 스킬을 제안 또는 강제할지 정의.
- `.claude/hooks/`
  - `skill-activation-prompt`(UserPromptSubmit), `post-tool-use-tracker`(PostToolUse) 등 자동화 훅 스크립트.
  - 선택적으로 `tsc-check`, `trigger-build-resolver` 등 Stop 훅 제공.
- `.claude/agents/`
  - 코드 아키텍처 리뷰, 리팩터링, 문서화, 에러 해결, 웹 리서치 등 10개 전문 에이전트 정의.
- `.claude/commands/`
  - `/dev-docs`, `/dev-docs-update`, `/route-research-for-testing` 명령 템플릿 제공.
- `.claude/settings.json`
  - MCP 서버 활성화/권한/훅 등록 등 Claude 런타임 설정 예시.

## 4) 동작 핵심 원리
- 자동 활성화 흐름:
  1. UserPromptSubmit 시 훅 실행
  2. `skill-rules.json` 트리거(키워드/의도 정규식/파일경로/콘텐츠 패턴) 매칭
  3. 관련 스킬을 제안(suggest)하거나 차단(block) 형태로 적용
- 컨텍스트 최적화:
  - 스킬 본문과 리소스를 분리해 필요 시에만 세부 문서를 로딩하는 구조.
- 작업 연속성:
  - `dev/active/<task>/` 하위 `-plan.md`, `-context.md`, `-tasks.md` 3개 문서로 세션 리셋 후 재개를 용이하게 함.

## 5) 현재 저장소의 기술적 성격
- Claude 특화 요소가 명확하다.
  - `.claude/` 네임스페이스
  - Claude Hook 이벤트(`UserPromptSubmit`, `PostToolUse`, `Stop`)
  - Claude slash command 템플릿
  - Claude용 통합 가이드 문서
- 즉, 이 레포는 "애플리케이션 코드"보다 "**AI 코딩 에이전트 운영체계 템플릿**"에 가깝다.

## 6) Codex 전환 관점에서 중요한 포인트
- 재사용 가능:
  - 스킬 본문의 도메인 지식(아키텍처 원칙, 패턴, 체크리스트)
  - Dev Docs 방법론
  - 에이전트 역할 정의 문서의 업무 분해 방식
- 재설계 필요:
  - Claude 전용 Hook/Command/Settings 형식
  - `skill-rules.json` 기반 자동 주입 방식
  - Claude 전용 실행/권한 모델
- 결론:
  - **콘텐츠(지식/프로세스)는 높은 재사용성**, **실행 메커니즘(훅/설정)은 Codex에 맞게 치환**이 필요하다.

