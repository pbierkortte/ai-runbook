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

_bindir="${HOME}/.local/bin"
mkdir -p "$_bindir"
if [[ ! -f "${_bindir}/yq" ]]; then
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
  _bin="${_bindir}/yq"
  _url="https://github.com/mikefarah/yq/releases/latest/download/yq_${_os}_${_arch}"
  [[ "$_os" == "windows" ]] && { _bin="${_bindir}/yq.exe"; _url="${_url}.exe"; }
  wget "$_url" -O "$_bin"
  chmod +x "$_bin"
fi
export PATH="$_bindir:$PATH"

manifest_path="agents/openskills-manifest.yml"

if [[ -n "${OPENSKILLS_MANIFEST_PATH:-}" ]]; then
  manifest="$OPENSKILLS_MANIFEST_PATH"
elif [[ -f "$HOME/$manifest_path" ]]; then
  manifest="$HOME/$manifest_path"
elif [[ -f "$manifest_path" ]]; then
  manifest="$manifest_path"
else
  echo "warning: openskills manifest not found, skipping" >&2
  exit 0
fi

output="# update-manifest.sh generated DO NOT EDIT!"
output+=$'\n'$(find skills -name SKILL.md -printf '%h\n' | sort |
  jq -R '{source: ., sourceType: "local", localPath: .}' |
  jq -s '.' | yq -P -p=json '.')

echo "$output" > "$manifest"
