---
name: release-checklist
description: >
  Prepare safe GitHub delivery by checking tests, diff, secrets, docs, and release notes.
  Use immediately before commit/PR readiness.
  Do not push, publish, deploy, or change repository visibility without explicit approval.
  Do not use for feature implementation or bug diagnosis alone.
---

## Workflow

1. Inspect git status and `git diff --check`.
2. Exclude `.env`, credentials, local config, logs, customer data, build artifacts.
3. Run `bash scripts/validate.sh` and relevant tests; record exact results.
4. Verify setup/docs and config examples still match reality.
5. Summarize breaking changes, migration, rollback, risks.
6. Draft commit message and PR summary.
7. Stop: do not push/publish/deploy without explicit approval.

## Output

```text
ready_for_human_approval: yes|no
validation:
changed_files_summary:
secrets_scan: clean|issues
risks:
rollback:
next_action:
```
