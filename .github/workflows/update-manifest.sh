#!/usr/bin/env bash
#
# update-manifest.sh — Manifest Generator
#
# Gathers skill directories into .agents/openskills-manifest.yml.
# Reverse of scripts/openskills-manifest.sh which splits it back out.
#
# Usage: bash .github/workflows/update-manifest.sh
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

echo "# update-manifest.sh generated DO NOT EDIT!" > "$manifest"
find skills -name SKILL.md -printf '%h\n' | sort |
  jq -R '{source: ., sourceType: "local", localPath: .}' |
  jq -s '.' | yq -y '.' >> "$manifest"
