#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
for f in AGENTS.md README.md .codex/agents/explorer.toml .agents/skills/feature-delivery/SKILL.md .codex-plugin/plugin.json; do test -f "$f" || { echo "[失败] 缺少文件：$f" >&2; exit 1; }; echo "[通过] $f"; done
python3 - <<'PYVALIDATE'
import json
from pathlib import Path
json.loads(Path('.codex-plugin/plugin.json').read_text())
json.loads(Path('.mcp.json').read_text())
print('[通过] JSON 配置文件格式正确')
for p in Path('.agents/skills').glob('*/SKILL.md'):
    s=p.read_text()
    if not s.startswith('---\n') or s.count('---') < 2: raise SystemExit(f'技能文件头格式错误：{p}')
    print('[通过] 技能文件', p.parent.name)
PYVALIDATE
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then git diff --check; echo '[通过] git diff --check'; else echo '[提示] 当前目录不是 Git 工作区，跳过 git diff --check'; fi
