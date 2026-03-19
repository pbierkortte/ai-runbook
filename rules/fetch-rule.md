# Fetch Rules

This library extends the AI assistant's capabilities with reusable rules that can be loaded on-demand.

## Always
- Reference check: Consult library files when their topic applies to current task
- Path access: Read files using paths listed below when guidance is needed
- Best practices: Follow loaded rule instructions as authoritative guidance

## Never
- Ignore available: Skip consulting relevant library rules that match current work
- Assume contents: Guess what a rule says without reading it first
- Override silently: Contradict library guidance without explicit user direction

## Steps
1. Scan available files list below for relevant topics
2. Read the full rule file using `read_file` when topic matches current task
3. If file not found, fetch it (`scripts/fetch-rule.sh <path>`)
4. Apply the rule's guidance to your work
5. Continue checking library as new topics arise

## Available Files (`.clinerules/.cache/`)

```
pbierkortte/
└── cline-rule-library/
    ├── add-header.md
    ├── clean-up.md
    ├── commit-conventionally.md
    ├── create-rule.md
    ├── explore-first.md
    ├── keep-it-simple.md
    ├── name-branch-with-ticket.md
    ├── read-me.md
    └── update-project-registry.md
```

---
