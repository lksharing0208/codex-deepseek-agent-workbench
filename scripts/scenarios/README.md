# 场景 Scripts 示例

这些脚本只处理本地文件，不连接外部服务、不发送数据、不执行交易或法律提交。它们是可扩展的最小样例，运行前请检查输入格式。

| 场景 | 脚本 | 用途 |
|---|---|---|
| 编程 | bash scripts/validate.sh | 检查模板、技能元数据和配置文件 |
| 短剧 | python3 scripts/scenarios/validate_drama_outline.py <大纲.csv> | 校验分集大纲 CSV 的必要字段和集号唯一性 |
| 写作 | python3 scripts/scenarios/writing_word_count.py <文本文件> | 统计字符、非空白字符、空白分隔词数和行数 |
| 金融 | python3 scripts/scenarios/validate_market_csv.py <行情.csv> | 对本地 CSV 做字段、数值和时间戳基础校验；不代表数据实时或可信 |
| 法律 | python3 scripts/scenarios/legal_text_diff.py <旧版.txt> <新版.txt> | 生成文本差异，不能替代法律判断或合同审阅 |

## 原则
- 明确输入格式、输出结果和退出码。
- 对数据质量检查不等同于核实数据源真实性。
- 不把脚本结果解释成投资建议或法律意见。
- 后续扩展应增加自动化测试和样例文件。