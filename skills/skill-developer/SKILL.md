---
name: skill-developer
description: Create and maintain Codex skills using a modular structure, explicit trigger rules, and validation checklists.
---

# Skill Developer (Codex)

## Purpose
Codex 환경에서 재사용 가능한 스킬을 설계/작성/검증하는 메타 스킬입니다.

## When To Use
- 새 스킬을 만들 때
- 기존 스킬의 트리거 규칙을 조정할 때
- 스킬 문서를 모듈형 구조로 분해할 때
- 스킬 품질 체크리스트를 만들 때

## Codex Skill Structure
```text
skills/<skill-name>/
  SKILL.md
  resources/
    topic-1.md
    topic-2.md
```

원칙:
- `SKILL.md`는 개요와 내비게이션 중심으로 유지
- 세부 내용은 `resources/`로 분리
- 실행 규칙은 프로젝트 `AGENTS.md`에 명시

## Trigger Design
`AGENTS.md`에 아래 3가지를 함께 정의합니다.
1. 작업 의도 키워드(예: route, controller, component, sentry)
2. 파일/경로 단서(예: `backend/**`, `apps/web/**`)
3. 가드레일(작업 전 확인 항목, 작업 종료 검증 항목)

## Authoring Checklist
- [ ] 목적과 범위가 한 문장으로 명확한가
- [ ] 언제 사용/미사용해야 하는지 기준이 있는가
- [ ] 실제 코드베이스에 맞는 경로 예시를 제공했는가
- [ ] 안티패턴과 예외 케이스를 포함했는가
- [ ] 검증 명령(`typecheck`, `build`, 테스트)을 명시했는가

## Validation Checklist
- [ ] 샘플 작업 2개 이상에서 스킬 적용 여부가 일관적인가
- [ ] 중복/충돌되는 트리거가 없는가
- [ ] 문서 링크가 모두 유효한가
- [ ] 결과물 포맷(리뷰/계획/수정 보고)이 재현 가능한가

## Legacy References
Claude 훅 기반 심화 문서는 Codex 경로에서 제거했습니다. 필요하면 레거시 원본을 참조하세요.
- `/Users/peterkim/SynologyDrive/OneDrive/Project/[Vibe Codding]/codex-code-infrastructure-showcase/.claude/skills/skill-developer/`

Codex 기본 경로에서는 위 레거시 문서를 실행 가이드로 사용하지 않습니다.
