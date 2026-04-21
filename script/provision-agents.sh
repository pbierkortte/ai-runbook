#!/bin/bash
# Provision Agents
## Install AI agents
### Authenticate Claude Code

set -euo pipefail

if [[ -n "${OPENROUTER_API_KEY:-}" ]]; then
  npm i -g cline
  cline auth -p openrouter -k "$OPENROUTER_API_KEY" -m openrouter/auto
fi

if [[ -n "${ANTHROPIC_API_KEY:-}" ]] || [[ -n "${CLAUDE_CODE_OAUTH_REFRESH_TOKEN:-}" ]]; then
  curl -fsSL https://claude.ai/install.sh | bash
fi

if [[ -n "${CLAUDE_CODE_OAUTH_REFRESH_TOKEN:-}" ]] && [[ -z "${ANTHROPIC_API_KEY:-}" ]]; then
  if [[ -z "${CLAUDE_CODE_OAUTH_SCOPES:-}" ]]; then
    echo 'Error: CLAUDE_CODE_OAUTH_SCOPES required with CLAUDE_CODE_OAUTH_REFRESH_TOKEN' >&2
    exit 1
  fi
  claude auth login
fi
