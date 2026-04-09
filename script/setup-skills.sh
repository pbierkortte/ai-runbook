#!/bin/bash
# setup-skills.sh
# Creates a shared skills directory and symlinks it into each agent.

mkdir -p "$HOME/.agents/skills"

# Cline: symlink skills dir
mkdir -p "$HOME/.cline"
rm -f "$HOME/.cline/skills"
ln -s "$HOME/.agents/skills" "$HOME/.cline/skills"

# Claude Code: symlink skills to the shared dir
# openskills install -g writes to ~/.claude/skills (→ ~/.agents/skills)
mkdir -p "$HOME/.claude"
rm -f "$HOME/.claude/skills"
ln -s "$HOME/.agents/skills" "$HOME/.claude/skills"
