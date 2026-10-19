#!/usr/bin/env python3
"""Basic structural checks for a local market-data CSV; not a data-source verifier."""
import csv
import datetime as dt
import sys
from pathlib import Path

REQUIRED = {"timestamp", "symbol", "price"}

def main() -> int:
    if len(sys.argv) != 2:
        print("用法：python3 validate_market_csv.py <行情.csv>", file=sys.stderr)
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
    errors = []
    seen = set()
    for line_no, row in enumerate(rows, start=2):
        timestamp = (row.get("timestamp") or "").strip()
        symbol = (row.get("symbol") or "").strip()
        raw_price = (row.get("price") or "").strip()
        if not timestamp:
            errors.append(f"第 {line_no} 行：timestamp 不能为空")
        else:
            try:
                dt.datetime.fromisoformat(timestamp.replace("Z", "+00:00"))
            except ValueError:
                errors.append(f"第 {line_no} 行：timestamp 不是可识别的 ISO 时间：{timestamp}")
        if not symbol:
            errors.append(f"第 {line_no} 行：symbol 不能为空")
        try:
            price = float(raw_price)
            if price <= 0:
                errors.append(f"第 {line_no} 行：price 必须大于 0")
        except ValueError:
            errors.append(f"第 {line_no} 行：price 不是有效数字：{raw_price}")
        key = (timestamp, symbol)
        if key in seen:
            errors.append(f"第 {line_no} 行：timestamp + symbol 重复：{key}")
        seen.add(key)
    if errors:
        print("\n".join("[失败] " + item for item in errors), file=sys.stderr)
        return 1
    print(f"[通过] 已检查 {len(rows)} 行。此检查不验证来源真实性、行情实时性、币种或复权口径。")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
