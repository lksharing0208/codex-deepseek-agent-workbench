---
name: code-review
description: >
  审查代码改动的正确性、回归风险、安全性、数据完整性、兼容性和测试缺口。
  适用于实现完成后或对现有差异进行审查。
  不用于直接实现功能，也不用于配置或修复模型服务商。
  未实际执行检查时，不得声称检查已经运行。
---

## 工作流程

1. 阅读代码差异及相关上下文。
2. 检查业务不变量、空值与边界处理、错误传播和事务。
3. 检查并发、幂等、重试、权限、输入校验、注入风险、密钥和敏感日志。
4. 检查兼容性、数据结构/API 变更、迁移/回滚方案和测试。
5. 按严重程度从高到低报告可执行的问题，并说明文件路径/行号和影响。
6. 区分实际缺陷与纯风格偏好。

## 输出格式

```text
findings:
  - severity: blocker|major|minor
    path:
    issue:
    impact:
verification_performed:
  - command/result or "not run"
risks:
follow_ups:
```
