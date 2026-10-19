---
name: release-checklist
description: >
  在准备提交或创建 Pull Request 前，检查测试、差异、秘密信息、文档和发布说明。
  仅在发布准备阶段使用。
  未经明确授权，不得推送、发布、部署或修改仓库可见性。
  不适用于单独的功能实现或故障诊断。
---

## 工作流程

1. 检查 `git status` 和 `git diff --check`。
2. 排除 `.env`、凭据、本地配置、日志、客户数据和构建产物。
3. 运行 `bash scripts/validate.sh` 及相关测试，并记录准确结果。
4. 核实环境配置文档和示例仍然符合实际情况。
5. 总结不兼容变更、迁移方式、回滚方案和风险。
6. 草拟提交说明与 Pull Request 描述。
7. 停止：未经明确授权，不得推送、发布或部署。

## 输出格式

```text
ready_for_human_approval: yes|no
validation:
changed_files_summary:
secrets_scan: clean|issues
risks:
rollback:
next_action:
```
