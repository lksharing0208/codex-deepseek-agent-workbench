# 场景配置包

本目录提供五类领域规则，复用根目录的通用约定和本机 Codex/DeepSeek 运行时配置。不要复制 API Key，也不要在场景中重复定义模型连接。

| 场景 | 规则入口 | 主要产出 |
|---|---|---|
| AI 编程助手 | scenarios/programming/AGENTS.md | 设计、实现、调试、测试、代码审查、发布 |
| AI 短剧助手 | scenarios/short-drama/AGENTS.md | 选题、人物、分集大纲、剧本、分镜、制作清单 |
| AI 写作助手 | scenarios/writing/AGENTS.md | 研究简报、提纲、文章、校对、事实核查 |
| AI 金融助手 | scenarios/finance/AGENTS.md | 市场研究、数据分析、情景分析、风险清单、交易复盘 |
| AI 法律助手 | scenarios/legal/AGENTS.md | 法规检索、合同审阅、条款对照、风险备忘录 |

## 使用步骤
1. 在 Codex 中打开仓库或复制为项目模板。
2. 按 docs/01-setup.md 配置本机 Codex + DeepSeek，密钥不进仓库。
3. 阅读目标场景的 AGENTS.md。
4. 复制 prompts/scenarios/<场景>.md 作为任务启动提示词，并补齐输入。
5. 按需触发 .agents/skills/ 中的技能；使用 MCP 前验证连接和权限。
6. 按领域验证清单检查结果，未执行的动作不得报告为已完成。

## 结构约定
- 根目录 AGENTS.md：所有场景通用规则。
- scenarios/<场景>/AGENTS.md：领域规则。Codex 不一定自动加载任意子目录中的规则文件；在独立项目中使用时，将必要规则合并到项目根 AGENTS.md。
- .agents/skills/：可复用技能。
- .codex/agents/：专用子 Agent 配置。
- prompts/scenarios/：可复制的任务启动提示词。
- docs/07-scenario-tool-matrix.md：工具选型矩阵。