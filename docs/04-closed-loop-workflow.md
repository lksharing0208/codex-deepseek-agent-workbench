# Full Closed Loop (Optimized)

This document defines the **agent skills + scripts + prompt words** closed-loop used by this workbench in AI coding scenarios.

## Loop overview

```text
Intake → Status/Inspect → Plan → Implement → Validate (scripts) → Review → Deliver
                ↑________________ repair / re-delegate on failure ______________|
```

## A. Intake

Capture:

- goal
- current vs expected behavior
- constraints and exclusions
- acceptance criteria
- risk and rollback needs

Use a prompt template (see `prompts/`) rather than free-form chat when the task is repeatable.

## B. Status / Inspect (decision tree)

Before any configuration or heavy delegation:

1. Read `AGENTS.md` and relevant repo files.
2. For setup/repair style work, obtain a structured status first (script or explicit inspection).
3. Branch:

| Status | Action |
|--------|--------|
| ready / healthy | Do **not** reconfigure; proceed to plan or daily delegation |
| not_configured / missing | Run setup path only |
| parent_model_changed / drift | Run repair path |
| handoff_failed | Repair, then re-delegate; never substitute parent output |
| conflict | Report exact paths; ask before overwrite |
| failed / unsupported | Stop, report errors, do not force |

## C. Plan

- Use Explorer (read-only) and Architect for non-trivial work.
- Identify impacted modules, tests, compatibility, and rollback.
- Bound file scopes so parallel agents do not overlap.

## D. Implement

- Smallest complete change following project conventions.
- One implementer per overlapping file scope.
- Prefer Skills (`feature-delivery`, `bug-investigation`, …) over ad-hoc prompts when the workflow is known.

## E. Validate (scripts + evidence)

Always prefer scripts for deterministic checks:

```bash
bash scripts/validate.sh
```

Plus targeted tests. Record **exact** commands and outcomes.

Verification contract for any delegated worker result:

1. Child actually received the assignment (no empty handoff).
2. Result produced by the child (anti-substitution).
3. `verification_evidence` present (commands, tests, paths).
4. Risks and follow-ups listed.
5. No secrets in output or diff.

Any failure → mark incomplete, repair or re-delegate, re-validate.

## F. Review

Independent Reviewer checks:

- correctness, integrity, security, auth
- retries/idempotency, concurrency
- compatibility, observability, tests, secrets

Fix valid findings and **re-run** checks.

## G. Deliver

Final report template (mandatory structure):

```text
结果：...
变更文件：...
验证命令与结果：...
风险/假设：...
未完成项：...
建议下一步：...
```

No push, publish, deploy, or production mutation without explicit human approval.

## Skills + Scripts + Promptwords mapping

| Layer | Role | Examples |
|-------|------|----------|
| **Promptwords** | Task brief / intake / handoff language | `prompts/00-orchestrator.md`, delivery prompts |
| **Skills** | Repeatable multi-step workflows with constraints | `.agents/skills/*/SKILL.md` |
| **Scripts** | Deterministic, side-effectful, verifiable actions | `scripts/validate.sh`, install helpers |

Rules:

- Skills decide **when** and **what**; scripts do **how** for mutable/config operations.
- Prompts must not replace Skills for multi-step flows.
- Scripts must emit clear pass/fail (and structured output where possible).
- Parent never invents script or child results.

## Anti-patterns (forbidden)

- Re-running setup when status is already ready
- Parent answering on behalf of a failed child handoff
- Claiming tests passed without running them
- Committing secrets or local Codex config
- Overlapping file edits by parallel agents without coordinator merge
