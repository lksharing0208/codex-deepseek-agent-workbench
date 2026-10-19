# Codex + DeepSeek Agent Workbench

面向 Codex + DeepSeek 的可复用开发工作台，包含自定义 Agent、Skills、插件/MCP 示例、提示词、脚本与 GitHub 交付流程。

## 快速开始
1. 阅读 `docs/01-setup.md`，备份本机 `~/.codex/config.toml`。
2. 对照 `examples/deepseek-provider.example.toml` 和当前官方文档手动配置，不要盲目覆盖现有配置。
3. 在项目目录中运行 `bash scripts/validate.sh`。
4. 使用 `prompts/01-feature-delivery.md` 执行需求、设计、实现、测试、审查和交付闭环。

## 目录
- `.codex/agents/`：自定义 Agent
- `.agents/skills/`：工作流 Skills
- `.codex-plugin/`：插件清单示例
- `.mcp.json`：MCP 示例配置
- `prompts/`：可复用提示词
- `scripts/`：安装与校验脚本
- `docs/`：全流程教程

## 安全
不要提交 API Key、`.env`、个人配置、日志或生产数据。模型名、Provider 字段和插件格式可能随版本变化，请以当前官方文档为准。生产写入、部署、发布和破坏性操作应由人工确认。
