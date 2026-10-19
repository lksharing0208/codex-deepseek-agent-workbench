---
name: release-checklist
description: Prepare safe GitHub delivery by checking tests, diff, secrets, docs, and release notes.
---

1. Inspect git status and `git diff --check`.
2. Exclude `.env`, credentials, local config, logs, customer data, build artifacts.
3. Run validation and relevant tests.
4. Verify setup/docs and config examples.
5. Summarize breaking changes, migration, rollback, risks.
6. Draft commit message and PR summary.
7. Do not push, publish, deploy, or change repository visibility without explicit approval.
