# Worker Report Prompt (delegated agents)

Use this template for any sub-agent / worker completion. Parent must not rewrite or invent this content.

```text
WORKER_REPORT
objective: <restated task>
changed_files:
  - path: ...
    summary: ...
verification_evidence:
  - command: ...
    result: ...
risks:
  - ...
follow_ups:
  - ...
handoff_status: received | missing_assignment | partial
```

If `handoff_status` is `missing_assignment` or `partial`, parent must report failure and re-delegate after repair. Do not substitute parent output.
