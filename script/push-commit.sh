#!/bin/bash
# Push Commit
## Commit and push generated files

set -euo pipefail

git config --global user.email 'github-actions[bot]@users.noreply.github.com'
git config --global user.name  'github-actions[bot]'
git add -A
git diff --cached --quiet || git commit -m 'Update generated files'
git push
