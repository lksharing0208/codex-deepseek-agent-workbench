#!/usr/bin/env python3
"""Count basic text statistics for a local UTF-8 file."""
import sys
from pathlib import Path

def main() -> int:
    if len(sys.argv) != 2:
        print("用法：python3 writing_word_count.py <文本文件>", file=sys.stderr)
        return 2
    path = Path(sys.argv[1])
    if not path.is_file():
        print(f"[失败] 文件不存在：{path}", file=sys.stderr)
        return 2
    try:
        text = path.read_text(encoding="utf-8")
    except (OSError, UnicodeError) as exc:
        print(f"[失败] 无法读取文本：{exc}", file=sys.stderr)
        return 2
    print(f"文件：{path}")
    print(f"字符数（含空白）：{len(text)}")
    print(f"非空白字符数：{sum(not char.isspace() for char in text)}")
    print(f"空白分隔词数：{len(text.split())}")
    print(f"行数：{len(text.splitlines())}")
    print("说明：不同平台和出版方对字数的计算口径可能不同。")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
