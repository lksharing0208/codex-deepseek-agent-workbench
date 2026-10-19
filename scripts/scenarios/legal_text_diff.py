#!/usr/bin/env python3
"""Show a unified text diff between two local UTF-8 files."""
import difflib
import sys
from pathlib import Path

def main() -> int:
    if len(sys.argv) != 3:
        print("用法：python3 legal_text_diff.py <旧版.txt> <新版.txt>", file=sys.stderr)
        return 2
    old_path, new_path = map(Path, sys.argv[1:])
    if not old_path.is_file() or not new_path.is_file():
        print("[失败] 两个输入都必须是存在的普通文件。", file=sys.stderr)
        return 2
    try:
        old = old_path.read_text(encoding="utf-8").splitlines(keepends=True)
        new = new_path.read_text(encoding="utf-8").splitlines(keepends=True)
    except (OSError, UnicodeError) as exc:
        print(f"[失败] 无法读取文本：{exc}", file=sys.stderr)
        return 2
    diff = difflib.unified_diff(old, new, fromfile=str(old_path), tofile=str(new_path))
    output = "".join(diff)
    print(output if output else "两份文本没有发现行级差异。")
    print("说明：文本差异不等同于法律风险评估；需结合完整合同、附件和适用法律人工审查。", file=sys.stderr)
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
