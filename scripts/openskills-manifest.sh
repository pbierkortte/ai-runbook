#!/usr/bin/env bash
#
# openskills-manifest.sh — Skills Metadata Generator
#
# Splits .agents/openskills-manifest.json into per-skill .openskills.json
# files then runs openskills update.
#
# Usage: bash scripts/openskills-manifest.sh
#
set -euo pipefail

MANIFEST=".agents/openskills-manifest.json"

for dir in $(jq -r '.[].source' "$MANIFEST"); do
  mkdir -p "$dir"
  jq --arg d "$dir" '.[] | select(.source == $d)' "$MANIFEST" > "$dir/.openskills.json"
done

npx openskills update
