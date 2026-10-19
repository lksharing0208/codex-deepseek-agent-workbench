#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCENARIO="${1:-}"

usage() {
  cat <<'EOF'
用法：./scripts/list-scenario.sh <场景>

可用场景：
  programming   AI 编程助手
  short-drama   AI 短剧助手
  writing       AI 写作助手
  finance       AI 金融助手
  legal         AI 法律助手

此脚本仅展示场景配置入口，不修改工作区、不切换模型，也不会启用或授权任何 MCP。
EOF
}

case "$SCENARIO" in
  programming|short-drama|writing|finance|legal) ;;
  *) usage; exit 2 ;;
esac

printf '场景：%s\n' "$SCENARIO"
printf '\n领域规则：%s\n' "$ROOT_DIR/scenarios/$SCENARIO/AGENTS.md"
printf '启动提示词：%s\n' "$ROOT_DIR/prompts/scenarios/$SCENARIO.md"
printf '\n建议阅读领域规则并将必要内容合并到当前项目的 AGENTS.md；不要假定 Codex 自动加载任意子目录中的 AGENTS.md。\n'
printf '专用 Agent 配置：%s/.codex/agents/%s-specialist.toml\n' "$ROOT_DIR" "$SCENARIO"
