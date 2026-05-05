# Rule Injection

## Overview

Heading-only files pass through the hydrate-agents process completely. Some markdown files are written entirely as headings. A heading-only file has every line extracted into AGENTS.md.

## Purpose

Every rule must reach agents. Rule files contain rules that agents must follow. Every line matters so every line must be surfaced.

## Mechanism

`hydrate-agents` concatenates `*_RULES.md` and `MANIFEST.md` files into AGENTS.md, stripping only comment lines (lines starting with `<!--`). A heading-only file surfaces completely because all its lines are non-comment. No special heading extraction occurs.

## Execution Order

The stage-rules script copies rule files to the target project root. `hydrate-agents` runs after to generate AGENTS.md files. This order matters so the files are processed once at their destination.

## Effect

Agents get full content without opening source files. AGENTS.md contains the full content of heading-only files. No special mode or flag is needed.

## Source

Rule files live in `rules/*/RULE.md` and are staged to root as `<NAME>_RULES.md` by `script/stage-rules`. `script/hydrate-agents` runs after. Both run in sequence via `script/bootstrap`.
