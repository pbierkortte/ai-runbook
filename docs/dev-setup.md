# Dev Setup

## Overview

`script/bootstrap` is the public entry point for setup.
It sources `script/dev-setup`, which orchestrates the full setup in order.
`dev-setup` sources each focused script as a step.

## Entry Point Chain

```
bootstrap
  dev-setup
    install-deps
    env-vars
    stage-protocols
    agents-collate
    shell-hooks
    openskills-manifest
    setup-skills
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

### agents-collate

Regenerates all AGENTS.md files from markdown headings.
Runs after stage-protocols so staged files are included in the index.
Processes each directory that contains an AGENTS.md file.

### shell-hooks

Appends a collate trigger to `~/.bashrc`, `~/.bash_profile`, `~/.zshrc`, and `~/.zprofile`.
Sets `BASH_ENV` so non-interactive bash sessions also run the hook.
Ensures agents always see a fresh `AGENTS.md` index.

### openskills-manifest

Reads `agents/openskills-manifest.yml` and installs per-skill metadata.
Uses `yq` installed by `install-deps`.

### setup-skills

Creates `~/.agents/skills` as the shared skills directory.
Symlinks it into `~/.cline/skills` and `~/.claude/skills`.
All agents share one directory so skills install once.

### install-agents

Installs Cline if `OPENROUTER_API_KEY` is set.
Installs Claude Code if `ANTHROPIC_API_KEY` or `CLAUDE_CODE_OAUTH_REFRESH_TOKEN` is set.
Runs last so all paths and env vars are ready.

## Usage

Run the entry point directly:

```bash
bash script/bootstrap
```

Or run the orchestrator directly:

```bash
bash script/dev-setup
```

Both produce the same result.
