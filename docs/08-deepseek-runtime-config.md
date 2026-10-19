# Codex + DeepSeek 通用运行时配置说明

## 原则
场景包不直接写入模型密钥、端点或账户信息。DeepSeek API 兼容方式和模型名称可能更新，应以官方文档和本机 Codex 版本支持的配置字段为准。

DeepSeek 官方文档列出的 OpenAI 兼容 API 地址为 https://api.deepseek.com。官方示例中包含 deepseek-flash 与 deepseek-v4-pro；可用模型、能力、价格和限制以官方文档为准。工具调用请求仍需运行环境负责发现、授权和执行工具。

## 配置检查清单
1. 确认已安装的 Codex 版本和支持的 provider/config schema。
2. 按该版本官方文档配置 DeepSeek provider、API base URL、模型 ID 和认证方式。
3. API Key 仅放入环境变量或受保护的凭证存储，不写入公开样例、仓库文件或日志。
4. 验证普通对话、长上下文、工具调用（如需要）、超时和限流处理。
5. 用当前版本支持的命令检查 MCP 状态，并逐个验证服务器权限。
6. 不假设 Codex 子 Agent 或 MCP 特性在所有第三方模型 provider 下完全等价；对当前版本组合逐项测试。
7. 切换场景时不改模型凭证；仅切换领域规则、Skills、启动提示词和经批准的工具集合。

## 环境变量示例
在本机当前 shell 中设置环境变量：

    export DEEPSEEK_API_KEY="在本机安全输入，不要提交到 Git"

具体 Codex provider 字段请遵照已安装版本的官方配置文档；这里不提供未经验证的通用 TOML 模板。

## 官方来源
- DeepSeek 中文文档：https://api-docs.deepseek.com/zh-cn/
- DeepSeek 工具调用：https://api-docs.deepseek.com/guides/tool_calls/
- Codex MCP 文档：https://developers.openai.com/learn/docs-mcp