---
name: code-review
description: >
  Review changes for correctness, regressions, security, data integrity, compatibility, and test gaps.
  Use after implementation or on an existing diff.
  Do not use to implement features or run setup/repair of providers.
  Do not claim checks were run unless they were actually executed.
---

## Workflow

1. Read diff and surrounding code.
2. Verify invariants, null/boundary handling, error propagation, transactions.
3. Check concurrency, idempotency, retries, authorization, validation, injection, secrets, sensitive logs.
4. Check compatibility, schema/API changes, migration/rollback, and tests.
5. Report actionable findings highest severity first, with path/line and impact.
6. Distinguish bugs from style preferences.

## Output

```text
findings:
  - severity: blocker|major|minor
    path:
    issue:
    impact:
verification_performed:
  - command/result or "not run"
risks:
follow_ups:
```
