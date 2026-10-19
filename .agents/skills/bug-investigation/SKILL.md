---
name: bug-investigation
description: Diagnose bugs using evidence and propose minimal fixes and regression tests.
---

1. Restate observed/expected behavior, environment, reproduction.
2. Search exact error, stack frames, call sites, config, recent changes.
3. Trace call flow; separate facts, hypotheses, and missing evidence.
4. Rank hypotheses and propose low-risk discriminating checks.
5. Do not claim root cause without evidence.
6. After approval, implement minimal fix and regression test.
7. Run tests and review adjacent failure paths.
8. Report evidence, fix, tests, rollout/rollback, uncertainty.
Redact secrets, personal data, and production identifiers from logs.
