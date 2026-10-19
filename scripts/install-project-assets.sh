#!/usr/bin/env bash
set -euo pipefail
if [[ $# -ne 1 ]]; then echo "用法：$0 /目标项目路径" >&2; exit 2; fi
SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"; TARGET="$1"
mkdir -p "$TARGET/.codex/agents" "$TARGET/.agents/skills"
cp -n "$SOURCE"/.codex/agents/*.toml "$TARGET/.codex/agents/" 2>/dev/null || true
for skill in "$SOURCE"/.agents/skills/*; do name="$(basename "$skill")"; mkdir -p "$TARGET/.agents/skills/$name"; cp -n "$skill/SKILL.md" "$TARGET/.agents/skills/$name/" 2>/dev/null || true; done
if [[ ! -f "$TARGET/AGENTS.md" ]]; then cp "$SOURCE/AGENTS.md" "$TARGET/AGENTS.md"; else echo '[提示] 已保留目标项目现有的 AGENTS.md，请手动合并规则。'; fi
echo "[完成] 资源已复制到：$TARGET"
