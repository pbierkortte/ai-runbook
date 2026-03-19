#!/bin/bash

# Check if README.md exists
if [ ! -f README.md ]; then
  echo "README.md not found!"
  exit 1
fi

# --- SKILLS SECTION ---

# Check if SKILLS markers are present
if ! grep -q "<!-- SKILLS START -->" README.md || ! grep -q "<!-- SKILLS END -->" README.md; then
  echo "SKILLS markers not found in README.md!"
  exit 1
fi

# Generate the skills contents
SKILLS_CONTENTS="<!-- SKILLS START -->\n"

# Find all SKILL.md files in the skills directory
SKILL_DIRS=$(find skills -mindepth 1 -maxdepth 1 -type d | sort)

for DIR in $SKILL_DIRS; do
  SKILL_FILE="$DIR/SKILL.md"
  if [ ! -f "$SKILL_FILE" ]; then
    continue
  fi

  # Try to extract h1 from body (after frontmatter)
  TITLE=$(awk '/^---$/ { count++; next } count >= 2 && /^# / { sub(/^# /, ""); print; exit }' "$SKILL_FILE")

  # Fallback to name: from frontmatter
  if [ -z "$TITLE" ]; then
    TITLE=$(awk '/^---$/ { count++ } count == 1 && /^name:/ { sub(/^name: */, ""); print; exit }' "$SKILL_FILE")
  fi

  # Final fallback to directory name
  if [ -z "$TITLE" ]; then
    TITLE=$(basename "$DIR")
  fi

  SKILLS_CONTENTS+="\n* [$TITLE]($SKILL_FILE)"
done

SKILLS_CONTENTS+="\n\n<!-- SKILLS END -->"

# Replace the contents between the SKILLS markers
awk -v CONTENTS="$SKILLS_CONTENTS" '
  BEGIN { in_section=0 }
  /^<!-- SKILLS START -->/ { print CONTENTS; in_section=1; next }
  /^<!-- SKILLS END -->/ { in_section=0; next }
  !in_section { print }
' README.md > README.tmp && mv README.tmp README.md

# --- TOOLS SECTION ---

# Check if TOOLS markers are present
if ! grep -q "<!-- TOOLS START -->" README.md || ! grep -q "<!-- TOOLS END -->" README.md; then
  echo "TOOLS markers not found in README.md!"
  exit 1
fi

# Generate the new contents
CONTENTS="<!-- TOOLS START -->\n"

# Find all markdown files in the tools directory
TOOLS_FILES=$(find tools -type f -name "*.md" | sort)

# Loop through each tool file and add it to the Contents section
for FILE in $TOOLS_FILES; do
  FILE_PATH="$FILE"
  # Extract the title from the markdown file's first line
  TITLE=$(grep '^# ' "$FILE" | head -n 1 | sed 's/^# //')
  # If no title is found, use the file name
  if [ -z "$TITLE" ]; then
    TITLE=$(basename "$FILE" .md)
  fi
  CONTENTS+="\n* [$TITLE]($FILE_PATH)"
done

CONTENTS+="\n\n<!-- TOOLS END -->"

# Replace the contents between the TOOLS markers
awk -v CONTENTS="$CONTENTS" '
  BEGIN { in_toc=0 }
  /^<!-- TOOLS START -->/ { print CONTENTS; in_toc=1; next }
  /^<!-- TOOLS END -->/ { in_toc=0; next }
  !in_toc { print }
' README.md > README.tmp && mv README.tmp README.md
