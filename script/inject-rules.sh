#!/bin/bash
# inject-rules.sh
#
# Copies rules into the current project.
#
# Sidecar mode (running from a dotfiles clone):
#   - Copies MY_RULES.md into the target workspace derived from $GITHUB_REPOSITORY.
#   - Works for any repo: Mono, Bonkers, ai-runbook, etc.
#   - Silently skips if MY_RULES.md does not exist (personal file, not committed).
#
# Self mode (running inside ai-runbook itself):
#   - Copies all *RULES.md files into the current directory.

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RULES_DIR="$DIR/../rules"

if [[ "$DIR" == *dotfiles* ]]; then
  # Sidecar mode: inject MY_RULES.md into the target workspace
  if [[ ! -f "$RULES_DIR/MY_RULES.md" ]]; then
    return 0  # No personal rules to inject — that's fine
  fi

  # Derive the target workspace from GITHUB_REPOSITORY (set by Codespaces)
  # Falls back to the first /workspaces/* dir found, then CWD
  if [[ -n "${GITHUB_REPOSITORY:-}" ]]; then
    TARGET="/workspaces/$(basename "$GITHUB_REPOSITORY")"
  else
    TARGET="$(find /workspaces -mindepth 1 -maxdepth 1 -type d | head -1)"
    TARGET="${TARGET:-$PWD}"
  fi

  cp "$RULES_DIR/MY_RULES.md" "$TARGET/"
else
  # Self mode: copy all *RULES.md files into the current directory
  cp "$RULES_DIR"/*RULES.md .
fi
