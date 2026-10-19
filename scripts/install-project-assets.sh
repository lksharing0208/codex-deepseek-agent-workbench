#!/usr/bin/env bash
set -euo pipefail
if [[ $# -ne 1 ]]; then echo "Usage: $0 /path/to/target-project" >&2; exit 2; fi
SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"; TARGET="$1"
mkdir -p "$TARGET/.codex/agents" "$TARGET/.agents/skills"
cp -n "$SOURCE"/.codex/agents/*.toml "$TARGET/.codex/agents/" 2>/dev/null || true
for skill in "$SOURCE"/.agents/skills/*; do name="$(basename "$skill")"; mkdir -p "$TARGET/.agents/skills/$name"; cp -n "$skill/SKILL.md" "$TARGET/.agents/skills/$name/" 2>/dev/null || true; done
if [[ ! -f "$TARGET/AGENTS.md" ]]; then cp "$SOURCE/AGENTS.md" "$TARGET/AGENTS.md"; else echo '[INFO] Existing AGENTS.md preserved; merge manually.'; fi
echo "[OK] Assets copied to $TARGET"
