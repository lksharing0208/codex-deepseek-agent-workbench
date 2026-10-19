# Agent Orchestration

| Agent | Purpose | Output |
|---|---|---|
| Explorer | Read-only code discovery | Evidence, paths, call flow, unknowns |
| Architect | Multi-file design | Interfaces, risks, tests, acceptance criteria |
| Implementer | Bounded implementation | Code and tests |
| Tester | Validation | Exact commands, outcomes, gaps |
| Reviewer | Independent review | Prioritized findings |

```text
Request -> Coordinator inspects repo -> Explorer -> Architect -> plan approval
 -> Implementer -> Tester -> Reviewer -> fix findings -> rerun checks -> human handoff
```

Tiny tasks do not need all agents. Give subagents bounded inputs and structured outputs. Assign disjoint file scopes to parallel workers. Subagents are collaborators, not correctness guarantees; coordinator verifies outputs. Agent config cannot be assumed to elevate parent permissions or override provider/MCP settings. External publishing, production writes, visibility changes, and deployments require human approval.
