#!/usr/bin/env bash
#
# update-manifest.sh — Manifest Generator
#
# Gathers skill directories into .agents/openskills-manifest.json.
# Reverse of scripts/openskills-manifest.sh which splits it back out.
#
# Usage: bash .github/workflows/update-manifest.sh
#
set -euo pipefail

MANIFEST=".agents/openskills-manifest.json"

find skills -name SKILL.md -printf '%h\n' | sort |
  jq -R '{source: ., sourceType: "local", localPath: .}' |
  jq -s '.' > "$MANIFEST"
