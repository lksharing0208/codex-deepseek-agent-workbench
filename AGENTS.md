# Project Instructions

## Core rules

- Inspect repository and relevant files before editing; preserve existing business semantics.
- For non-trivial tasks define acceptance criteria, plan, risks and rollback before implementation.
- Use Explorer for read-only investigation, Architect for design, Implementer for bounded changes, Tester for validation, Reviewer for independent review.
- Do not let multiple agents edit overlapping files concurrently. Coordinator owns integration and verifies claims.
- Never invent APIs, repository facts, test results, or external behavior.
- Never commit secrets, tokens, private keys, `.env`, local Codex config, personal logs, or production data.
- Avoid destructive commands and production mutations unless explicitly authorized.
- Run targeted tests and `bash scripts/validate.sh`; report exact commands and results.

## Closed-loop integrity (mandatory)

- **Anti-substitution**: Parent/coordinator must never fabricate or substitute a sub-agent result. If a delegated agent reports missing assignment or empty handoff, treat it as `handoff_failed`, re-run repair/delegation, and do not present parent output as the child result.
- **Evidence over narrative**: Accept claims only with concrete evidence (paths, diffs, command output, test names). Missing evidence = open item, not done.
- **Structured handoff**: Prefer `WORKER_REPORT` style output for any delegated work:
  ```text
  changed_files:
  verification_evidence:
  risks:
  follow_ups:
  ```
- **Status before action**: For configuration, repair, or multi-agent setup tasks, inspect current status first; only then run setup/repair. Do not re-run configuration when status is already ready.
- **Definition of done**: acceptance criteria addressed, checks reported honestly, no secrets/unrelated changes, docs updated when needed, known gaps listed, next action clear.
