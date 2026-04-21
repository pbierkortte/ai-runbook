#!/bin/bash
# Refresh Docs
## Regenerate the docs README

set -euo pipefail
SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
cd "$(dirname "$SCRIPT_PATH")/.."

readme='docs/README.md'
[[ -f "$readme" ]] || { echo "$readme not found" >&2; exit 1; }

replace_section() {
  local start="$1" end="$2" body="$3"
  grep -q "$start" "$readme" || { echo "missing marker: $start" >&2; exit 1; }
  grep -q "$end"   "$readme" || { echo "missing marker: $end"   >&2; exit 1; }
  awk -v body="$body" -v S="$start" -v E="$end" '
    $0 ~ S { print body; skip=1; next }
    $0 ~ E { skip=0; next }
    !skip  { print }
  ' "$readme" > "$readme.tmp" && mv "$readme.tmp" "$readme"
}

# CORES
cores="<!-- CORES START -->"
for d in $(find cores -mindepth 1 -maxdepth 1 -type d | sort); do
  cores+=$'\n\n#### '"$(basename "$d")"
  for f in $(find "$d" -maxdepth 1 -type f -name '*.md' | sort); do
    t="$(grep -m1 '^# ' "$f" | sed 's/^# //')"
    [[ -z "$t" ]] && t="$(basename "$f" .md)"
    cores+=$'\n- ['"$t"']('/"$f"')'
  done
done
cores+=$'\n\n<!-- CORES END -->'
replace_section '<!-- CORES START -->' '<!-- CORES END -->' "$cores"

# SKILLS
skills="<!-- SKILLS START -->"
for d in $(find skills -mindepth 1 -maxdepth 1 -type d | sort); do
  f="$d/SKILL.md"
  [[ -f "$f" ]] || continue
  t="$(awk '/^---$/ { c++; next } c>=2 && /^# / { sub(/^# /,""); print; exit }' "$f")"
  [[ -z "$t" ]] && t="$(awk '/^---$/ { c++ } c==1 && /^name:/ { sub(/^name: */,""); print; exit }' "$f")"
  [[ -z "$t" ]] && t="$(basename "$d")"
  skills+=$'\n- ['"$t"']('/"$f"')'
done
skills+=$'\n\n<!-- SKILLS END -->'
replace_section '<!-- SKILLS START -->' '<!-- SKILLS END -->' "$skills"

# TOOLS
tools="<!-- TOOLS START -->"
for f in $(find tools -type f -name '*.md' | sort); do
  t="$(grep -m1 '^# ' "$f" | sed 's/^# //')"
  [[ -z "$t" ]] && t="$(basename "$f" .md)"
  tools+=$'\n- ['"$t"']('/"$f"')'
done
tools+=$'\n\n<!-- TOOLS END -->'
replace_section '<!-- TOOLS START -->' '<!-- TOOLS END -->' "$tools"
