# Feature Delivery Prompt

Deliver a feature through requirements → design → implementation → tests → review → handoff.

Prefer the `feature-delivery` Skill when available.

## Brief

- Goal:
- Acceptance criteria:
- Constraints / exclusions:
- Risk level:

## Process

1. Read `AGENTS.md` and related code/tests/docs.
2. Define acceptance criteria; ask only if critical ambiguity blocks safe progress.
3. For non-trivial work, use Explorer/Architect before implementation.
4. Implement the smallest complete change; keep file scopes bounded.
5. Add success, boundary, and failure-path tests.
6. Run targeted tests and `bash scripts/validate.sh`; record exact results.
7. Independent review; fix findings; re-validate.
8. Final report:

```text
结果：...
变更文件：...
验证命令与结果：...
风险/假设：...
未完成项：...
建议下一步：...
```

Stop before destructive operations, production writes, publishing, or deployment unless authorized.
