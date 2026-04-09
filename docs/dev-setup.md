# Dev Setup

## Overview

`script/bootstrap` is the public entry point for setup.
It sources `script/dev-setup.sh`, which orchestrates the full setup in order.
`dev-setup.sh` sources each focused script as a step.

## Entry Point Chain

```
bootstrap
  dev-setup.sh
    install-deps.sh
    env-vars.sh
    inject-rules.sh
    agents-collate.sh
    shell-hooks.sh
    openskills-manifest.sh
    setup-skills.sh
    install-agents.sh
```

## Scripts

### install-deps.sh

Installs `yq` into `~/.local/bin` if missing.
Exports the bin directory onto `PATH`.
Runs first because other scripts depend on `yq`.

### env-vars.sh

Sets AI-friendly environment defaults.
Suppresses pagers and noisy output so agents parse stdout cleanly.
Sets `OPENSKILLS_MANIFEST_PATH` when the Codespaces dotfiles path exists.

### inject-rules.sh

Copies personal rule files into the target workspace root.
Derives the target from `$GITHUB_REPOSITORY` or the first `/workspaces` directory.
Detects self mode when the target workspace has `rules/MY_RULES.md`.
In self mode, copies all `*RULES.md` files to the project root.
In sidecar mode, copies only `MY_RULES.md` to the target workspace.
Works for any repo name.

### agents-collate.sh

Regenerates all AGENTS.md files from markdown headings.
Runs after inject-rules so copied files are included in the index.
Processes each directory that contains an AGENTS.md file.

### shell-hooks.sh

Appends a collate trigger to `~/.bashrc`, `~/.bash_profile`, `~/.zshrc`, and `~/.zprofile`.
Sets `BASH_ENV` so non-interactive bash sessions also run the hook.
Ensures agents always see a fresh `AGENTS.md` index.

### openskills-manifest.sh

Reads `agents/openskills-manifest.yml` and installs per-skill metadata.
Uses `yq` installed by `install-deps.sh`.

### setup-skills.sh

Creates `~/.agents/skills` as the shared skills directory.
Symlinks it into `~/.cline/skills` and `~/.claude/skills`.
All agents share one directory so skills install once.

### install-agents.sh

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
bash script/dev-setup.sh
```

Both produce the same result.
