#!/bin/bash
set -euo pipefail

COLLATE="$(cd "$(dirname "$0")" && pwd)/agents-collate.sh"
LINE="[ -f \"$COLLATE\" ] && bash \"$COLLATE\""

for rc in ~/.bashrc ~/.bash_profile ~/.zshrc ~/.zprofile; do
  grep -qsF "$LINE" "$rc" || echo "$LINE" >> "$rc"
done

# Non-interactive Bash shells source BASH_ENV
BASH_ENV_LINE='export BASH_ENV="$HOME/.bashrc"'
for rc in ~/.bashrc ~/.bash_profile; do
  grep -qsF "$BASH_ENV_LINE" "$rc" || echo "$BASH_ENV_LINE" >> "$rc"
done
