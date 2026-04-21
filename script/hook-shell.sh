#!/bin/bash
# Hook Shell
## Wire shell startup hooks

set -euo pipefail
SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
DOTFILES_ROOT="$(cd "$(dirname "$SCRIPT_PATH")/.." && pwd)"

{
  echo "DOTFILES_ROOT=\"$DOTFILES_ROOT\""
  cat <<'EOF'
# .dotfilesrc
# Sourced on shell startup so agents see fresh indexes.
if [ -f AGENTS.md ]; then
  [ -f "$DOTFILES_ROOT/script/prepare-git.sh" ] && bash "$DOTFILES_ROOT/script/prepare-git.sh"
fi
EOF
} > ~/.dotfilesrc
chmod +x ~/.dotfilesrc

LINE='[ -f ~/.dotfilesrc ] && source ~/.dotfilesrc'
for rc in ~/.bashrc ~/.bash_profile ~/.zshrc ~/.zprofile; do
  grep -qsF "$LINE" "$rc" || echo "$LINE" >> "$rc"
done

BASH_ENV_LINE='export BASH_ENV="$HOME/.bashrc"'
for rc in ~/.bashrc ~/.bash_profile; do
  grep -qsF "$BASH_ENV_LINE" "$rc" || echo "$BASH_ENV_LINE" >> "$rc"
done
