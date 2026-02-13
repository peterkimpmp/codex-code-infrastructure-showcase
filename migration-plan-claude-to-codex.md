# Claude 전용 요소 → Codex 구조 마이그레이션 계획서

## 1) 목표
- 현재 저장소의 Claude 특화 인프라(`.claude/` 중심)를 Codex에서 재사용 가능한 구조로 전환한다.
- 전환 원칙:
  - 도메인 지식(스킬 콘텐츠)은 최대한 보존
  - 실행 메커니즘(훅/명령/설정)은 Codex 방식으로 재구성
  - 단계적 전환(병행 운영 가능)으로 리스크 최소화

## 2) 범위
- 포함:
  - `.claude/skills/`, `.claude/hooks/`, `.claude/agents/`, `.claude/commands/`
  - `CLAUDE_INTEGRATION_GUIDE.md` 및 관련 운영 문서
- 제외:
  - 외부 서비스/실행 환경(예: 실제 프로덕션 앱 배포 파이프라인) 변경
  - 비즈니스 로직 코드 자체 리팩터링

## 3) 매핑 전략 (핵심)

| Claude 전용 요소 | 현재 위치 | Codex 대응 구조 | 전환 방식 |
|---|---|---|---|
| Claude 설정 파일 | `.claude/settings.json`, `.claude/settings.local.json` | `AGENTS.md` + Codex 실행 정책 문서 | 설정 키를 직접 이식하지 않고 운영 원칙으로 재정의 |
| Skill 정의 | `.claude/skills/*` | `$CODEX_HOME/skills/<skill>/SKILL.md` 또는 레포 내 `skills/` | 콘텐츠 이관 + Codex 트리거 규칙(AGENTS.md)으로 연결 |
| skill-rules 자동 활성화 | `.claude/skills/skill-rules.json` | `AGENTS.md`의 트리거 규칙 + 작업별 체크리스트 | JSON 룰 엔진 의존 제거, 텍스트 규칙화 |
| Hook(UserPromptSubmit/PostToolUse/Stop) | `.claude/hooks/*` | Codex 작업 프로토콜(명시적 단계, 명령 실행 스크립트) | 이벤트 훅 제거, 표준 워크플로우로 치환 |
| Slash Commands | `.claude/commands/*` | Codex용 템플릿 문서(`templates/`) + 프롬프트 패턴 | 명령 이름 의존 제거, 템플릿 기반으로 전환 |
| Specialized Agents | `.claude/agents/*.md` | `agents/` 문서 유지 + Codex 지시문으로 호출 | 문서 대부분 재사용, 툴/경로 참조만 수정 |
| Dev Docs 패턴 | `dev/README.md` | 동일 유지 (`dev/active/<task>/...`) | 그대로 유지(호환성 높음) |

## 4) 단계별 실행 계획

### Phase 1. 구조 준비 (반나절)
- 작업:
  - `skills/`, `agents/`, `templates/`, `docs/` 디렉터리 생성
  - Claude 명칭 의존이 강한 문서 목록 작성
- 산출물:
  - Codex 기준 디렉터리 스켈레톤
  - 파일 이관 매핑 인벤토리
- 완료 기준:
  - 주요 파일 100%가 "이관 대상/폐기/보류"로 분류됨

### Phase 2. 스킬 콘텐츠 이관 (1일)
- 작업:
  - `.claude/skills/*`를 Codex 스킬 포맷으로 복사/정리
  - `SKILL.md` 내 Claude 고유 표현(툴명/이벤트명) 중립화
  - `skill-rules.json` 규칙을 `AGENTS.md` 트리거 규칙으로 재서술
- 산출물:
  - Codex 스킬 디렉터리
  - 업데이트된 `AGENTS.md`
- 완료 기준:
  - 각 스킬이 Codex 세션에서 호출 가능
  - 트리거 규칙이 문서로 명확히 정의됨

### Phase 3. 훅/명령 대체 (1일)
- 작업:
  - `.claude/hooks/*` 의존 흐름을 단계형 운영 절차로 변환
  - `.claude/commands/*`를 템플릿 문서로 변환
  - Stop 시점 빌드/타입체크는 수동/자동 스크립트로 분리
- 산출물:
  - `templates/dev-docs.md`, `templates/dev-docs-update.md` 등
  - `scripts/` 기반 점검 명령(필요 시)
- 완료 기준:
  - Claude Hook 없이 동일 목적(활성화/추적/검증) 달성 가능

### Phase 4. 에이전트/문서 정합성 정리 (반나절)
- 작업:
  - `.claude/agents/*.md`의 경로/도구/지시문을 Codex 기준으로 수정
  - `README.md`, 통합 가이드 문서를 Codex 중심으로 재작성
- 산출물:
  - Codex 버전 README
  - Codex 통합 가이드
- 완료 기준:
  - 신규 사용자가 Claude 전제 없이 온보딩 가능

### Phase 5. 검증 및 컷오버 (반나절)
- 작업:
  - 샘플 시나리오(스킬 호출, 문서화, 에이전트 실행) 회귀 검증
  - 실패 케이스와 우회 절차 문서화
  - `.claude/` 디렉터리 보존/제거 정책 결정
- 산출물:
  - 마이그레이션 검증 리포트
  - 컷오버 체크리스트
- 완료 기준:
  - 핵심 시나리오 통과율 100%
  - 운영 문서 최신화 완료

## 5) 상세 작업 백로그

1. 스킬 이관
- `backend-dev-guidelines`, `frontend-dev-guidelines`, `route-tester`, `error-tracking`, `skill-developer`를 우선 이관.
- 각 스킬에 "Codex에서 언제 사용해야 하는지" 트리거 섹션 추가.

2. 규칙 엔진 대체
- `skill-rules.json`의 `keywords`, `intentPatterns`, `pathPatterns`를 문서 규칙으로 재구성.
- 강제(block) 규칙은 "실행 전 체크리스트"로 대체.

3. Hook 대체
- `UserPromptSubmit` 역할: AGENTS.md의 명시적 트리거 규칙.
- `PostToolUse` 역할: 변경 파일 추적 스크립트(`scripts/changed-files.sh`) 또는 세션 로그 규칙.
- `Stop` 역할: 종료 전 점검 체크리스트 + `npm run typecheck`/`npm run build`.

4. Command 대체
- `/dev-docs`, `/dev-docs-update`, `/route-research-for-testing`를 템플릿화.
- 템플릿 사용 예시를 README에 포함.

5. 문서 재편
- `CLAUDE_INTEGRATION_GUIDE.md`를 `CODEX_INTEGRATION_GUIDE.md`로 신규 작성.
- 기존 문서는 "legacy(Claude)" 섹션으로 격리.

## 6) 리스크와 대응
- 리스크: 자동 활성화 경험 저하(훅 제거 영향)
  - 대응: AGENTS.md 트리거 규칙 강화 + 템플릿 기본 탑재
- 리스크: 문서는 남아있지만 실제 실행 루틴 부재
  - 대응: 템플릿과 점검 스크립트를 함께 제공
- 리스크: Claude/Codex 혼재로 사용자 혼동
  - 대응: README 첫 화면에서 "현재 권장 경로(Codex)"를 명확히 표시

## 7) 성공 기준 (Acceptance Criteria)
- Codex 사용자가 Claude 설정 없이 다음을 수행 가능해야 한다.
  - 스킬 기반 개발 가이드 적용
  - 복잡 작업용 에이전트 문서 활용
  - `dev/active/` 기반 문서화 워크플로우 사용
- 저장소 문서에서 Claude 전용 의존 경로가 기본 경로가 아니어야 한다.
- 핵심 3개 시나리오(백엔드 작업, 프론트 작업, 테스트/문서화)가 재현 가능해야 한다.

## 8) 권장 마이그레이션 순서 (실행 우선순위)
1. 스킬 콘텐츠 이관 + AGENTS.md 트리거 규칙 작성
2. 명령 템플릿 전환(dev-docs 계열)
3. 훅 대체 점검 루틴 정착(typecheck/build/changed-files)
4. 에이전트 문서 정리
5. README/통합 가이드 컷오버

## 9) 즉시 실행할 첫 액션
- `AGENTS.md`에 "Codex 스킬 트리거 규칙" 섹션 신설
- `skills/` 디렉터리 생성 후 기존 5개 스킬부터 우선 이관
- `CODEX_INTEGRATION_GUIDE.md` 초안 생성

