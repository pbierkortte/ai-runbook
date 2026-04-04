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

manifest_path=".agents/openskills-manifest.yml"

if [[ -n "${OPENSKILLS_MANIFEST_PATH:-}" ]]; then
  manifest="$OPENSKILLS_MANIFEST_PATH"
elif [[ -f "$HOME/$manifest_path" ]]; then
  manifest="$HOME/$manifest_path"
elif [[ -f "$manifest_path" ]]; then
  manifest="$manifest_path"
else
  echo "error: openskills manifest not found" >&2
  exit 1
fi


for dir in $(yq '.[].source' "$manifest"); do
  mkdir -p "$dir"
  yq -o=json ".[] | select(.source == \"$dir\")" "$manifest" > "$dir/.openskills.json"
done

npx openskills update
