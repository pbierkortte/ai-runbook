#!/usr/bin/env bash
#
# openskills-manifest.sh — Skills Metadata Generator
#
# Splits .agents/openskills-manifest.yml into per-skill .openskills.json
# files then runs openskills update.
#
# Usage: bash scripts/openskills-manifest.sh
#
set -euo pipefail

manifest=".agents/openskills-manifest.yml"

for dir in $(yq -r '.[].source' "$manifest"); do
  mkdir -p "$dir"
  yq --arg d "$dir" '.[] | select(.source == $d)' "$manifest" > "$dir/.openskills.json"
done

npx openskills update
