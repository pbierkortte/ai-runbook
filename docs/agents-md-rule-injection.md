# Rule Injection

## Overview

Heading-only files pass through the collate process completely. Some markdown files are written entirely as headings. A heading-only file has every line extracted into AGENTS.md.

## Purpose

Every rule must reach agents. Files like RULES.md contain rules that agents must follow. Every line matters so every line must be surfaced.

## Mechanism

Collate extracts lines starting with `#`. A file with only headings has every line extracted. The deepest heading level becomes dash list items in the output.

## Effect

Agents get full content without opening source files. AGENTS.md contains the full content of heading-only files. No special mode or flag is needed.

## Source

RULES.md at the repository root uses this pattern. The collate script lives at `script/agents-collate.sh`.
