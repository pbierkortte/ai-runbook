#!/bin/bash
# inject-rules.sh

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RULES_DIR="$DIR/../rules"

if [[ ! -f "$RULES_DIR/MY_RULES.md" ]]; then
  return 0
fi

if [[ "$DIR" == *dotfiles* ]]; then
  cp "$RULES_DIR/MY_RULES.md" .
else
  cp "$RULES_DIR"/*RULES.md .
fi
