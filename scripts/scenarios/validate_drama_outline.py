#!/usr/bin/env python3
"""Validate a short-drama episode-outline CSV without changing the input."""
import csv
import sys
from pathlib import Path

REQUIRED = {"episode", "title", "summary", "hook"}

def main() -> int:
    if len(sys.argv) != 2:
        print("用法：python3 validate_drama_outline.py <大纲.csv>", file=sys.stderr)
        return 2
    path = Path(sys.argv[1])
    if not path.is_file():
        print(f"[失败] 文件不存在：{path}", file=sys.stderr)
        return 2
    try:
        with path.open("r", encoding="utf-8-sig", newline="") as handle:
            reader = csv.DictReader(handle)
            fields = set(reader.fieldnames or [])
            missing = REQUIRED - fields
            if missing:
                print("[失败] 缺少字段：" + ", ".join(sorted(missing)), file=sys.stderr)
                return 1
            rows = list(reader)
    except (OSError, UnicodeError, csv.Error) as exc:
        print(f"[失败] 无法读取 CSV：{exc}", file=sys.stderr)
        return 2
    seen = set()
    errors = []
    for line_no, row in enumerate(rows, start=2):
        episode = (row.get("episode") or "").strip()
        if not episode:
            errors.append(f"第 {line_no} 行：episode 不能为空")
        elif episode in seen:
            errors.append(f"第 {line_no} 行：集号重复：{episode}")
        seen.add(episode)
        for field in ("title", "summary", "hook"):
            if not (row.get(field) or "").strip():
                errors.append(f"第 {line_no} 行：{field} 不能为空")
    if errors:
        print("\n".join("[失败] " + item for item in errors), file=sys.stderr)
        return 1
    print(f"[通过] 已检查 {len(rows)} 集；仅完成格式校验，不代表剧作质量或市场表现。")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
