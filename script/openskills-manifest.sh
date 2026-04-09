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


for dir in $(yq '.[].source' "$manifest"); do
  mkdir -p "$dir"
  yq -o=json ".[] | select(.source == \"$dir\")" "$manifest" > "$dir/.openskills.json"
done

# Check if manifest has remote entries (repoUrl) or local entries
has_remote=$(yq '.[0].repoUrl // ""' "$manifest")
if [[ -n "$has_remote" ]]; then
  # Remote: install each skill individually by owner/repo/subpath
  count=$(yq 'length' "$manifest")
  for i in $(seq 0 $((count - 1))); do
    repo=$(yq ".[$i].repoUrl" "$manifest" | sed 's|https://github.com/||')
    subpath=$(yq ".[$i].subpath" "$manifest")
    install_path="${repo}/${subpath}"
    echo "Installing: $install_path"
    npx openskills install -g -u -y "$install_path" || echo "  ⚠ Failed: $install_path"
  done
else
  # Local: SKILL.md files exist in current tree
  npx openskills install -g -u -y ./
fi
