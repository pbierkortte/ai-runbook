#!/usr/bin/env bash
#
# openskills-manifest.sh — Skills Metadata Generator
#
# Splits agents/openskills-manifest.yml into per-skill .openskills.json
# files then runs openskills install.
#
# Usage: bash script/openskills-manifest.sh
#
set -euo pipefail

if ! which yq > /dev/null 2>&1; then
  _os="$(uname -s | tr '[:upper:]' '[:lower:]')"
  _arch="$(uname -m)"
  case "$_os" in
    linux*)           _os="linux"   ;;
    darwin*)          _os="darwin"  ;;
    mingw*|msys*|cygwin*) _os="windows" ;;
  esac
  case "$_arch" in
    x86_64|amd64) _arch="amd64" ;;
    arm64|aarch64) _arch="arm64" ;;
  esac
  _bin="/usr/local/bin/yq"
  _url="https://github.com/mikefarah/yq/releases/latest/download/yq_${_os}_${_arch}"
  [[ "$_os" == "windows" ]] && { _bin="/usr/local/bin/yq.exe"; _url="${_url}.exe"; }
  wget "$_url" -O "$_bin"
  chmod +x "$_bin"
fi

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


for dir in $(yq '.[].source' "$manifest"); do
  mkdir -p "$dir"
  yq -o=json ".[] | select(.source == \"$dir\")" "$manifest" > "$dir/.openskills.json"
done

npx openskills install -g -u -y pbierkortte/ai-runbook
