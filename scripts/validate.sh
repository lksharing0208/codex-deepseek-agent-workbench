#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

for f in AGENTS.md README.md .codex/agents/explorer.toml .agents/skills/feature-delivery/SKILL.md .codex-plugin/plugin.json docs/06-multi-scenario-architecture.md docs/07-scenario-tool-matrix.md docs/08-deepseek-runtime-config.md scripts/scenarios/README.md; do
  test -f "$f" || { echo "[失败] 缺少文件：$f" >&2; exit 1; }
  echo "[通过] $f"
done

for scenario in programming short-drama writing finance legal; do
  test -f "scenarios/$scenario/AGENTS.md" || { echo "[失败] 缺少场景规则：$scenario" >&2; exit 1; }
  test -f "prompts/scenarios/$scenario.md" || { echo "[失败] 缺少场景提示词：$scenario" >&2; exit 1; }
  test -f ".codex/agents/$scenario-specialist.toml" || { echo "[失败] 缺少专用 Agent：$scenario" >&2; exit 1; }
  echo "[通过] 场景配置：$scenario"
done

python3 - <<'PYVALIDATE'
import json
from pathlib import Path
json.loads(Path('.codex-plugin/plugin.json').read_text())
json.loads(Path('.mcp.json').read_text())
print('[通过] JSON 配置文件格式正确')

skills = list(Path('.agents/skills').glob('*/SKILL.md'))
for p in skills:
    s = p.read_text()
    if not s.startswith('---\n') or s.count('---') < 2:
        raise SystemExit(f'技能文件头格式错误：{p}')
    print('[通过] 技能文件', p.parent.name)

try:
    import tomllib
except ModuleNotFoundError:
    tomllib = None
if tomllib:
    for p in Path('.codex/agents').glob('*.toml'):
        tomllib.loads(p.read_text())
        print('[通过] TOML 配置', p.name)
else:
    print('[提示] 当前 Python 无 tomllib，跳过 TOML 语法检查')
PYVALIDATE

python3 -m py_compile scripts/scenarios/*.py
echo '[通过] 场景 Python 脚本语法检查'

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT
printf 'episode,title,summary,hook\n1,开端,主角发现秘密,真相是谁\n' > "$TMP_DIR/outline.csv"
python3 scripts/scenarios/validate_drama_outline.py "$TMP_DIR/outline.csv"
printf 'timestamp,symbol,price\n2026-10-19T09:30:00+08:00,TEST,12.5\n' > "$TMP_DIR/market.csv"
python3 scripts/scenarios/validate_market_csv.py "$TMP_DIR/market.csv"
printf '测试文本\n第二行\n' > "$TMP_DIR/text.txt"
python3 scripts/scenarios/writing_word_count.py "$TMP_DIR/text.txt" >/dev/null
cp "$TMP_DIR/text.txt" "$TMP_DIR/text2.txt"
python3 scripts/scenarios/legal_text_diff.py "$TMP_DIR/text.txt" "$TMP_DIR/text2.txt" >/dev/null
echo '[通过] 场景脚本冒烟测试'

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git diff --check
  echo '[通过] git diff --check'
else
  echo '[提示] 当前目录不是 Git 工作区，跳过 git diff --check'
fi
