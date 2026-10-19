# Agent Orchestration

| Agent | Purpose | Output |
|---|---|---|
| Explorer | Read-only code discovery | Evidence, paths, call flow, unknowns |
| Architect | Multi-file design | Interfaces, risks, tests, acceptance criteria |
| Implementer | Bounded implementation | Code and tests |
| Tester | Validation | Exact commands, outcomes, gaps |
| Reviewer | Independent review | Prioritized findings |

```text
Request -> Coordinator inspects repo / status
  -> Explorer (optional) -> Architect (optional) -> plan approval
  -> Implementer (disjoint scopes) -> Tester -> Reviewer
  -> fix findings -> rerun checks -> human handoff
```

## Rules

- Tiny tasks do not need all agents.
- Give subagents **bounded inputs** and **structured outputs** (`WORKER_REPORT` preferred).
- Assign disjoint file scopes to parallel workers.
- Subagents are collaborators, not correctness guarantees; **coordinator verifies** outputs and evidence.
- **Anti-substitution**: if a child reports missing assignment or empty handoff, repair and re-delegate; never present parent-generated content as the child result.
- Agent config cannot be assumed to elevate parent permissions or override provider/MCP settings.
- External publishing, production writes, visibility changes, and deployments require human approval.

## Handoff contract

Every delegated completion should include:

```text
changed_files:
verification_evidence:
risks:
follow_ups:
```
