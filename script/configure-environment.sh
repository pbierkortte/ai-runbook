#!/bin/bash
# Configure Environment
## Set quiet environment defaults
### Resolve the skills manifest

set -euo pipefail

export GIT_PAGER=cat GIT_EDITOR=nano
export PIP_QUIET=1 PYTHONDONTWRITEBYTECODE=1
export NPM_CONFIG_LOGLEVEL=warn

_dotfiles_dir='/workspaces/.codespaces/.persistedshare/dotfiles'
if [[ -f "$_dotfiles_dir/agents/openskills-manifest.yml" ]]; then
  export OPENSKILLS_MANIFEST_PATH="$_dotfiles_dir/agents/openskills-manifest.yml"
fi

_m='agents/openskills-manifest.yml'
if [[ -n "${OPENSKILLS_MANIFEST_PATH:-}" ]]; then
  export MANIFEST="$OPENSKILLS_MANIFEST_PATH"
elif [[ -f "$HOME/$_m" ]]; then
  export MANIFEST="$HOME/$_m"
else
  export MANIFEST="$_m"
fi
