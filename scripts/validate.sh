#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
for f in AGENTS.md README.md .codex/agents/explorer.toml .agents/skills/feature-delivery/SKILL.md .codex-plugin/plugin.json; do test -f "$f" || { echo "[FAIL] missing $f" >&2; exit 1; }; echo "[OK] $f"; done
python3 - <<'PYVALIDATE'
import json
from pathlib import Path
json.loads(Path('.codex-plugin/plugin.json').read_text())
json.loads(Path('.mcp.json').read_text())
print('[OK] JSON manifests parse')
for p in Path('.agents/skills').glob('*/SKILL.md'):
    s=p.read_text()
    if not s.startswith('---\n') or s.count('---') < 2: raise SystemExit(f'invalid frontmatter: {p}')
    print('[OK] skill', p.parent.name)
PYVALIDATE
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then git diff --check; echo '[OK] git diff --check'; else echo '[INFO] not a git worktree; skipped git diff --check'; fi
