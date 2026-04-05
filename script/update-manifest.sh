#!/usr/bin/env bash
#
# update-manifest.sh — Manifest Generator
#
# Gathers skill directories into agents/openskills-manifest.yml.
# Reverse of script/openskills-manifest.sh which splits it back out.
#
# Usage: bash script/update-manifest.sh
#
set -euo pipefail

manifest_path="agents/openskills-manifest.yml"

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

output="# update-manifest.sh generated DO NOT EDIT!"
output+=$'\n'$(find skills -name SKILL.md -printf '%h\n' | sort |
  jq -R '{source: ., sourceType: "local", localPath: .}' |
  jq -s '.' | yq -P -p=json '.')

echo "$output" > "$manifest"
