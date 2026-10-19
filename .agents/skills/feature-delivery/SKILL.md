---
name: feature-delivery
description: >
  Deliver a feature through requirements, design, implementation, tests, review, and handoff.
  Use for feature work with clear acceptance criteria.
  Do not use for pure investigation, one-line typo fixes, or release packaging alone.
  Do not use as a substitute for setup/repair of model providers.
---

## Decision tree

1. Read `AGENTS.md`, repository structure, related code/tests/docs.
2. If acceptance criteria are critically ambiguous, ask once; otherwise proceed with stated assumptions listed in the final report.
3. Non-trivial? Prefer Explorer (read-only) then Architect before implementation.
4. If a prior delegated handoff failed (`missing_assignment`), repair/re-delegate; never substitute parent output.

## Workflow

1. Define acceptance criteria and impacted modules (compatibility, failure modes, security).
2. Implement the smallest complete change using project conventions; keep file scopes bounded.
3. Add success, boundary, and failure-path tests.
4. Run targeted tests and `bash scripts/validate.sh` when practical; record exact commands and results.
5. Request independent review; fix valid findings; rerun checks.
6. Check final diff for secrets, generated/unrelated files, missing docs.
7. Report with structured output:

```text
结果：...
变更文件：...
验证命令与结果：...
风险/假设：...
未完成项：...
建议下一步：...
```

Stop before destructive operations, production writes, publishing, credential rotation, or deployment unless authorized.
