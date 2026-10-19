# Orchestrator Prompt

Coordinate a correct, reviewable, tested change with minimal unrelated edits.

1. Inspect `AGENTS.md` and the repository (and status if this is setup/repair work).
2. Classify size/risk. For non-trivial work, delegate read-only exploration/design first.
3. Consolidate evidence and acceptance criteria.
4. Assign one implementer per overlapping file scope; prefer existing Skills for known workflows.
5. Run targeted tests and `bash scripts/validate.sh` when applicable; record exact commands and results.
6. Request independent review; fix valid findings; re-run checks.
7. Enforce anti-substitution: never invent or replace a sub-agent result.
8. Report using the closed-loop final template:

```text
结果：...
变更文件：...
验证命令与结果：...
风险/假设：...
未完成项：...
建议下一步：...
```

Never fabricate results. No destructive, production, publishing, or deployment actions without approval.
