# Dev Setup

## Overview

`script/bootstrap` is the public entry point for setup.
It sources `script/setup-dev`, which orchestrates the full setup in order.
`setup-dev` sources each focused script as a step.

## Entry Point Chain

```
bootstrap
  setup-dev
    install-deps
    env-vars
    stage-protocols
    hydrate-agents
    shell-hooks
    setup-skills
    openskills-manifest
    install-agents
```

## Scripts

### install-deps

Installs `yq` into `~/.local/bin` if missing.
Exports the bin directory onto `PATH`.
Runs first because other scripts depend on `yq`.

### env-vars

Sets AI-friendly environment defaults.
Suppresses pagers and noisy output so agents parse stdout cleanly.
Sets `OPENSKILLS_MANIFEST_PATH` when the Codespaces dotfiles path exists.

### stage-protocols

Stages protocol files into the target workspace root.
Derives the target from `$GITHUB_REPOSITORY` or the first `/workspaces` directory.
Scans `protocols/*/PROTOCOL.md` and copies each to root as `<dirname>_PROTOCOLS.md`.
Works in both sidecar mode and self mode.
Staged files are gitignored so they never pollute commits.

### hydrate-agents

Regenerates all AGENTS.md files from markdown headings.
Runs after stage-protocols so staged files are included in the index.
Processes each directory that contains an AGENTS.md file.

### shell-hooks

Appends a collate trigger to `~/.bashrc`, `~/.bash_profile`, `~/.zshrc`, and `~/.zprofile`.
Sets `BASH_ENV` so non-interactive bash sessions also run the hook.
Ensures agents always see a fresh `AGENTS.md` index.

### setup-skills

Creates `~/.agents/skills` as the shared skills directory.
Symlinks it into `~/.cline/skills` and `~/.claude/skills`.
All agents share one directory so skills install once.

### openskills-manifest

Reads `agents/openskills-manifest.yml` and installs per-skill metadata.
Uses `yq` installed by `install-deps`.

### install-agents

Installs Cline if `OPENROUTER_API_KEY` is set.
Installs Claude Code if `ANTHROPIC_API_KEY` or `CLAUDE_CODE_OAUTH_REFRESH_TOKEN` is set.
Runs last so all paths and env vars are ready.

### dehydrate-agents

Blanks every AGENTS.md file back to the `DO NOT EDIT` header only.
Used in CI after `setup-dev` so AGENTS.md files are stored empty in the repo.
Enables a clean re-hydration on the next run.
Not part of the `setup-dev` chain and not run during local setup.
Run it manually when you need to reset the index before committing:

```bash
bash script/dehydrate-agents
```

## Hydrate and Dehydrate Cycle

AGENTS.md files are never committed with content.
They live in the repo in a dehydrated state: just the `DO NOT EDIT` header.
At runtime, `hydrate-agents` regenerates the full index from markdown headings.
In CI, `dehydrate-agents` resets them after all generated files are updated.
This keeps diffs clean and makes the content always authoritative at runtime.

## Usage

Run the entry point directly:

```bash
bash script/bootstrap
```

Or run the orchestrator directly:

```bash
bash script/setup-dev
```

Both produce the same result.
