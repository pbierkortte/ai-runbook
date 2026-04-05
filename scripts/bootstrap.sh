#!/bin/bash
set -euo pipefail

COLLATE="$(cd "$(dirname "$0")" && pwd)/agents-collate.sh"
LINE="[ -f \"$COLLATE\" ] && bash \"$COLLATE\""

for rc in ~/.bashrc ~/.bash_profile ~/.zshrc ~/.zprofile; do
  grep -qsF "$LINE" "$rc" || echo "$LINE" >> "$rc"
done
