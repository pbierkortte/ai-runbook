#!/bin/bash
# Link Skills
## Create a shared skills directory

set -euo pipefail

mkdir -p "$HOME/.agent/skills"

for dir in "$HOME/.agents" "$HOME/.cline" "$HOME/.claude"; do
  mkdir -p "$dir"
  rm -f "$dir/skills"
  ln -s "$HOME/.agent/skills" "$dir/skills"
done
