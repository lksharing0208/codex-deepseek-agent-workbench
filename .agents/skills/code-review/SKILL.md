---
name: code-review
description: Review changes for correctness, regressions, security, data integrity, compatibility, and test gaps.
---

- Read diff and surrounding code.
- Verify invariants, null/boundary handling, error propagation, transactions.
- Check concurrency, idempotency, retries, authorization, validation, injection, secrets, sensitive logs.
- Check compatibility, schema/API changes, migration/rollback, and tests.
- Report actionable findings highest severity first, with path/line and impact.
- Distinguish bugs from style preferences; do not claim checks were run unless executed.
