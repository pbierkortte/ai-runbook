# AGENTS.md Heading Format

## Overview

AGENTS.md files are auto-generated table-of-contents files
They provide AI agents with a card catalog of available documentation
Agents read the catalog and drill into full docs on demand
They also include the full content of staged `*_RULES.md` files injected before the table-of-contents entries

## Format Structure

AGENTS.md files use proper Markdown heading syntax
Each source file gets its own section
Headings are promoted by one level
Leaf headings become asterisk list items

## Transformation Rules

`script/hydrate-manifest` applies these transformations when generating MANIFEST.md files
Filename becomes a level 1 heading (`#`) using the raw filename as-is
Original `#` becomes `##`
Original `##` becomes `###`
Leaf heading nodes become asterisk list items (`*`)

## Benefits

Proper Markdown heading structure for document parsers
Better semantic structure for tooling and IDE support
Maintains readability while following Markdown standards
Deepest items as lists keeps hierarchy clear

## Generation

`script/hydrate-manifest` generates MANIFEST.md files by transforming source documentation headings
`script/hydrate-agents` assembles AGENTS.md from the generated MANIFEST.md files and any staged rule files
Run both scripts in sequence to regenerate all AGENTS.md files
Files are marked as auto-generated and should not be edited manually
