#!/bin/bash
# setup-skills.sh
# Creates a shared skills directory and symlinks it into each agent.

mkdir -p "$HOME/.agents/skills"

# Cline: symlink skills dir
mkdir -p "$HOME/.cline"
rm -f "$HOME/.cline/skills"
ln -s "$HOME/.agents/skills" "$HOME/.cline/skills"

# Claude Code: symlink skills and commands to the shared dir
# openskills install -g writes to ~/.claude/skills (→ ~/.agents/skills)
# Claude Code reads slash commands from ~/.claude/commands
mkdir -p "$HOME/.claude"
rm -f "$HOME/.claude/skills"
ln -s "$HOME/.agents/skills" "$HOME/.claude/skills"
rm -rf "$HOME/.claude/commands"
ln -s "$HOME/.agents/skills" "$HOME/.claude/commands"