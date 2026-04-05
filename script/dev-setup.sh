#!/bin/bash
# dev-setup.sh
# Bootstrap AGENTS.md indexes for local development or CI.
# Fetches the canonical collate script from ai-runbook (no dotfiles config required).
echo "→ Fetching and running agents-collate from ai-runbook..."
curl -fsSL https://raw.githubusercontent.com/pbierkortte/ai-runbook/master/script/agents-collate.sh | bash
echo "✓ Done"
