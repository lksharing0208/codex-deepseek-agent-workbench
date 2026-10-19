# Codex + DeepSeek 智能体工作台

面向 Codex + DeepSeek 的可复用开发工作台，提供自定义智能体（Agent）、技能（Skills）、插件与 MCP 示例、提示词、脚本及 GitHub 交付流程。

本项目围绕 **Skills + Scripts + Prompts 的完整闭环**进行设计，包含状态决策树、防止父智能体冒充子智能体结果的约束、结构化 `WORKER_REPORT`、脚本验证规范及技能触发限制。

## 快速开始

1. 阅读 `docs/01-setup.md`，先备份本机 `~/.codex/config.toml`。
2. 参考 `examples/deepseek-provider.example.toml`，结合当前版本的官方文档手动配置；不要直接覆盖现有配置。
3. 在项目目录运行 `bash scripts/validate.sh`。
4. 阅读 `docs/04-closed-loop-workflow.md`，了解从需求到交付的完整闭环。
5. 使用 `prompts/01-feature-delivery.md` 或对应技能，执行“需求 → 设计 → 实现 → 测试 → 审查 → 交付”。

## 目录说明

- `.codex/agents/`：自定义智能体角色配置
- `.agents/skills/`：可复用工作流技能，包含决策树与结构化输出要求
- `.codex-plugin/`：插件清单示例
- `.mcp.json`：MCP 工具服务配置示例
- `prompts/`：可复用提示词模板
- `scripts/`：安装与校验脚本
- `docs/`：配置、智能体编排、技能/插件和闭环流程文档
- `.github/workflows/`：GitHub Actions 自动校验流程

## 闭环原则

- **Skills（技能）**决定何时启动工作流；**Scripts（脚本）**负责确定性校验和有副作用的操作；**Prompts（提示词）**负责描述任务和验收标准。
- 父智能体不得伪造、代写或替代子智能体的实际结果。
- 验证必须留下可核查的证据；没有实际执行的检查不得声称通过。
- 配置与修复操作先检查状态，再决定是否执行；状态已就绪时不重复配置。

## 安全说明

不要提交 API 密钥、`.env` 文件、个人配置、日志或生产数据。模型名称、Provider 字段和插件格式可能随版本变化，必须以当前官方文档为准。生产写入、部署、发布和破坏性操作都应先获得明确授权。
