# Codex + DeepSeek 环境配置指南

1. 将 Codex CLI/Desktop 更新到合适版本，并查阅当前官方文档。修改 Provider 配置前，先确认本机版本支持的配置格式。
2. 修改前备份 `~/.codex/config.toml`。本仓库的 TOML 文件仅为示例，不保证可以直接复制使用；Provider 配置字段和通信协议会随 Codex 版本变化。
3. 你此前使用过 Provider `deepseek`、模型 `deepseek-flash` 和推理强度 `high`。只有在当前 Codex 版本及服务端点支持时才保留这些设置。
4. 手动合并确认有效的配置项；不要把 API 密钥写入仓库文件。优先使用当前环境支持的环境变量或本地凭据存储方式。
5. 先用只读任务验证连接，再分别测试文件读取、安全范围内的文件修改和本地测试。每次只调整一个变量，便于定位问题。
6. 用户级 `~/.codex/config.toml` 用于模型、Provider 和机器级设置；项目 `AGENTS.md` 用于项目规则；`.codex/agents/` 用于角色定义；`.agents/skills/` 用于工作流。某些配置是否支持项目级设置，请以官方文档为准。
7. 只信任经过检查的代码仓库。破坏性操作、生产写入、发布和部署必须获得授权。不要为了绕过集成错误而关闭沙箱或审批保护。

## 初次验证

让 Codex 只读取 `AGENTS.md`，总结智能体与技能目录，并指出 `bash scripts/validate.sh` 的用途。此步骤明确要求不修改任何文件。
