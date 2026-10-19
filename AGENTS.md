# Project Instructions

- Inspect repository and relevant files before editing; preserve existing business semantics.
- For non-trivial tasks define acceptance criteria, plan, risks and rollback before implementation.
- Use Explorer for read-only investigation, Architect for design, Implementer for bounded changes, Tester for validation, Reviewer for independent review.
- Do not let multiple agents edit overlapping files concurrently. Coordinator owns integration and verifies claims.
- Never invent APIs, repository facts, test results, or external behavior.
- Never commit secrets, tokens, private keys, `.env`, local Codex config, personal logs, or production data.
- Avoid destructive commands and production mutations unless explicitly authorized.
- Run targeted tests and `bash scripts/validate.sh`; report exact commands and results.
- Definition of done: acceptance criteria addressed, checks reported honestly, no secrets/unrelated changes, docs updated, known gaps listed.
