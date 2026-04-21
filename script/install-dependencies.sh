#!/bin/bash
# Install Dependencies
## Install binary tools (yq)
### Write per-skill config files
### Install skills from remote or local
### Round-trip the manifest

set -euo pipefail

_bindir="$HOME/.local/bin"
mkdir -p "$_bindir"
if [[ ! -x "$_bindir/yq" ]]; then
  _os="$(uname -s | tr '[:upper:]' '[:lower:]')"
  _arch="$(uname -m)"
  case "$_os" in linux*) _os=linux ;; darwin*) _os=darwin ;; mingw*|msys*|cygwin*) _os=windows ;; esac
  case "$_arch" in x86_64|amd64) _arch=amd64 ;; arm64|aarch64) _arch=arm64 ;; esac
  _bin="$_bindir/yq"
  _url="https://github.com/mikefarah/yq/releases/latest/download/yq_${_os}_${_arch}"
  [[ "$_os" == 'windows' ]] && { _bin="$_bindir/yq.exe"; _url="${_url}.exe"; }
  wget -qO "$_bin" "$_url"
  chmod +x "$_bin"
fi
export PATH="$_bindir:$PATH"

for dir in $(yq '.[].source' "$MANIFEST"); do
  mkdir -p "$dir"
  yq -o=json ".[] | select(.source == \"$dir\")" "$MANIFEST" > "$dir/.openskills.json"
  touch "$dir/SKILL.md"
done

has_remote="$(yq '.[0].repoUrl // ""' "$MANIFEST")"
if [[ -n "$has_remote" ]]; then
  count="$(yq 'length' "$MANIFEST")"
  for i in $(seq 0 $((count - 1))); do
    repo="$(yq ".[$i].repoUrl" "$MANIFEST" | sed 's|https://github.com/||')"
    subpath="$(yq ".[$i].subpath" "$MANIFEST")"
    path="${repo}/${subpath}"
    echo "Installing: $path"
    npx -y openskills install -g -u -y "$path"
  done
else
  npx -y openskills install -g -u -y ./
fi

out='# generated DO NOT EDIT!'
out+=$'\n'"$(find skills -name SKILL.md -printf '%h\n' | sort |
  jq -R '{source: ., sourceType: "local", localPath: .}' |
  jq -s '.' | yq -P -p=json '.')"
echo "$out" > "$MANIFEST"
