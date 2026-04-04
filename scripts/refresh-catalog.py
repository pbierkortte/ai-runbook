#!/usr/bin/env python3
"""
refresh-catalog.py — Card Catalog for AI Agents

Generates a heading-only index of all docs into docs/AGENTS.md.
Any AI agent reads the catalog, knows what exists, drills into
the full doc on demand via read_file.

Scales to 1000s of docs with basically no context usage and no
special dbs. No vector DB, no embeddings, just this script.

Usage: python3 scripts/refresh-catalog.py
"""
import re
from pathlib import Path

ROOT = Path(__file__).parent.parent
DOCS = ROOT / "docs"
OUT = DOCS / "AGENTS.md"

HEADING = re.compile(r'(#{1,6})\s+(.*)')

def parse_headings(path):
    headings = []
    for line in Path(path).read_text(encoding="utf-8").splitlines():
        match = HEADING.match(line)
        if not match:
            continue
        headings.append((len(match.group(1)), match.group(2).strip()))
    return headings

def insert_nested(tree, parts, headings):
    for part in parts[:-1]:
        tree = tree.setdefault(part, {})
    tree[parts[-1]] = headings

def build_tree():
    tree = {}
    for p in sorted(DOCS.rglob("*.md")):
        if p == OUT:
            continue
        parts = p.relative_to(DOCS).parts
        insert_nested(tree, parts, parse_headings(p))
    return {"docs": tree}

def to_yaml(tree, indent=0):
    lines = []
    pad = "  " * indent
    for key, value in tree.items():
        lines.append(f"{pad}{key}:")
        if isinstance(value, dict):
            lines.append(to_yaml(value, indent + 1))
        elif value:
            min_depth = min(d for d, _ in value)
            for depth, title in value:
                rel = indent + 1 + (depth - min_depth)
                lines.append("  " * rel + f"- {title}")
    return "\n".join(lines)

def main():
    yaml = to_yaml(build_tree())
    header = "# refresh-catalog.py generated DO NOT EDIT!"
    OUT.write_text(header + "\n" + yaml + "\n", encoding="utf-8")
    print(f"Refreshed {OUT}")

if __name__ == "__main__":
    main()
