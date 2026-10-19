# Codex + DeepSeek Agent Workbench

面向 Codex + DeepSeek 的可复用开发工作台，包含自定义 Agent、Skills、插件/MCP 示例、提示词、脚本与 GitHub 交付流程。

本仓库已按 **Agent Skills + Scripts + Promptwords 闭环** 做了强化：状态决策树、反代答（anti-substitution）、结构化 `WORKER_REPORT`、脚本验证合同与 Skills 负向约束。

## 快速开始

1. 阅读 `docs/01-setup.md`，备份本机 `~/.codex/config.toml`。
2. 对照 `examples/deepseek-provider.example.toml` 和当前官方文档手动配置，不要盲目覆盖现有配置。
3. 在项目目录中运行 `bash scripts/validate.sh`。
4. 阅读 `docs/04-closed-loop-workflow.md`（优化后的闭环说明）。
5. 使用 `prompts/01-feature-delivery.md` 或对应 Skill 执行需求 → 设计 → 实现 → 测试 → 审查 → 交付闭环。

## 目录

- `.codex/agents/`：自定义 Agent
- `.agents/skills/`：工作流 Skills（含决策树与结构化输出）
- `.codex-plugin/`：插件清单示例
- `.mcp.json`：MCP 示例配置
- `prompts/`：可复用提示词（含 `05-worker-report.md`）
- `scripts/`：安装与校验脚本
- `docs/`：全流程教程（含优化后的闭环文档）

## 闭环原则（摘要）

- Skills 决定何时跑流程；Scripts 做确定性校验/副作用；Prompts 负责任务表述。
- 父 Agent 禁止替代子 Agent 结果（anti-substitution）。
- 验证必须留下可核对证据；未跑的检查不得声称已通过。
- 配置类操作先 status，再 setup/repair；ready 后不再重复配置。

## 安全

不要提交 API Key、`.env`、个人配置、日志或生产数据。模型名、Provider 字段和插件格式可能随版本变化，请以当前官方文档为准。生产写入、部署、发布和破坏性操作应由人工确认。
