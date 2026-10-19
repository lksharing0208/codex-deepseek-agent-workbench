# Codex + DeepSeek 智能体工作台

面向 Codex + DeepSeek 的可复用工作台，提供 Agent、Skills、Scripts、Plugins、MCP 示例、提示词、脚本和 GitHub 交付流程。

本项目围绕 **需求 → 编排 → 执行 → 验证 → 交付 → 复盘** 的完整闭环设计，包含状态决策树、结构化 WORKER_REPORT、脚本验证规范和防止 Agent 冒充执行结果的约束。

## 快速开始

1. 阅读 docs/01-setup.md，先备份本机 Codex 配置。
2. 参考 examples/deepseek-provider.example.toml，结合当前版本官方文档配置；不要直接覆盖现有配置。
3. 在项目目录运行 bash scripts/validate.sh。
4. 阅读 docs/04-closed-loop-workflow.md，了解完整交付闭环。
5. 选择一个场景，阅读 scenarios/README.md 并使用 prompts/scenarios/ 中的启动提示词。

## 五类场景

- AI 编程助手：scenarios/programming/AGENTS.md
- AI 短剧助手：scenarios/short-drama/AGENTS.md
- AI 写作助手：scenarios/writing/AGENTS.md
- AI 金融助手：scenarios/finance/AGENTS.md
- AI 法律助手：scenarios/legal/AGENTS.md

场景架构与工具选择见 docs/06-multi-scenario-architecture.md 和 docs/07-scenario-tool-matrix.md；DeepSeek 运行时配置边界见 docs/08-deepseek-runtime-config.md。

## 目录说明

- .codex/agents/：通用及五类领域 Agent 角色配置
- .agents/skills/：可复用工作流与领域技能
- .codex-plugin/：插件清单示例
- .mcp.json：MCP 服务配置示例
- prompts/：通用提示词和五类场景启动提示词
- scenarios/：领域规则和场景入口
- scripts/：安装与校验脚本
- docs/：配置、编排、工具选型和闭环流程文档
- .github/workflows/：GitHub Actions 自动校验流程

## Agent / Skills / Scripts / MCP 分工

- **Agent**：拆解任务、分配角色、汇总结果和管理交接。
- **Skills**：封装可复用的领域流程、判断框架和检查清单。
- **Scripts**：执行可重复、可测试的校验、转换、计算和批处理。
- **MCP**：连接外部数据和系统；按最小权限配置，默认只读。
- **Plugins**：按需打包分发 Skills、MCP 配置和相关资源。

## 闭环原则

- 父 Agent 不得伪造、代写或替代子 Agent 的实际结果。
- 验证必须留下可核查证据；未实际执行的检查不得声称通过。
- 配置与修复操作先检查状态，再决定是否执行。
- 金融和法律场景必须注明来源、时间、假设与不确定性；不执行未授权的高影响动作。

## 安全说明

不要提交 API 密钥、.env 文件、个人配置、日志或生产数据。模型名称、Provider 字段和插件格式可能随版本变化，必须以当前官方文档为准。生产写入、交易、部署、发布和破坏性操作都应先获得明确授权。