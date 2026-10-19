# 子智能体任务报告模板

所有子智能体/执行者完成任务时都应使用此模板。父级不得改写、编造或冒充子智能体的报告内容。

```text
WORKER_REPORT
objective: <重述任务目标>
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

如果 `handoff_status` 为 `missing_assignment` 或 `partial`，父级必须报告交接失败；修复问题后重新委派。禁止使用父级输出替代子级结果。
