# Rule Injection

## Overview

Heading-only files pass through the collate process completely. Some markdown files are written entirely as headings. A heading-only file has every line extracted into AGENTS.md.

## Purpose

Every rule must reach agents. Protocol files contain rules that agents must follow. Every line matters so every line must be surfaced.

## Mechanism

Collate extracts lines starting with `#`. A file with only headings has every line extracted. The deepest heading level becomes dash list items in the output.

## Execution Order

The stage-protocols script copies protocol files to the target project root. The collate script runs after to generate AGENTS.md files. This order matters so the files are processed once at their destination.

## Effect

Agents get full content without opening source files. AGENTS.md contains the full content of heading-only files. No special mode or flag is needed.

## Source

Protocol files live in `protocols/*/PROTOCOL.md` and are staged to root as `<dirname>_PROTOCOLS.md` by `script/stage-protocols`. The collate script lives at `script/agents-collate`. Both run in sequence via `script/dev-setup`.
