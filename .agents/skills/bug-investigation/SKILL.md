---
name: bug-investigation
description: >
  Diagnose bugs using evidence and propose minimal fixes and regression tests.
  Use when observed vs expected behavior is unclear or a defect must be isolated.
  Do not use for greenfield feature delivery or routine release packaging.
  Do not claim root cause without concrete evidence.
---

## Decision tree

1. Restate observed/expected behavior, environment, and reproduction steps.
2. Search exact error, stack frames, call sites, config, recent changes.
3. Separate facts, hypotheses, and missing evidence.
4. If evidence is insufficient, propose low-risk discriminating checks before any fix.
5. After approval, implement minimal fix + regression test; validate; report.

## Workflow

1. Trace call flow; rank hypotheses.
2. Do not claim root cause without evidence.
3. Implement minimal fix and regression test only after direction is clear.
4. Run tests and review adjacent failure paths; record exact commands/results.
5. Report:

```text
evidence:
root_cause_confidence: high|medium|low
changed_files:
verification_evidence:
risks:
follow_ups:
```

Redact secrets, personal data, and production identifiers from logs.
