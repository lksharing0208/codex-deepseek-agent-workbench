---
name: feature-delivery
description: Deliver a feature through requirements, design, implementation, tests, review, and handoff.
---

1. Read AGENTS.md, repository structure, related code/tests/docs.
2. Define acceptance criteria; ask only if critical ambiguity blocks safe progress.
3. Identify impacted modules, compatibility, failure modes, security concerns.
4. For non-trivial work, use read-only exploration/design before implementation.
5. Implement the smallest complete change using project conventions.
6. Add success, boundary, and failure-path tests.
7. Run targeted tests and broader checks when practical.
8. Request independent review; fix valid findings and rerun checks.
9. Check final diff for secrets, generated/unrelated files, missing docs.
10. Report summary, changed files, exact checks/results, gaps, next steps.
Stop before destructive operations, production writes, publishing, credential rotation, or deployment unless authorized.
