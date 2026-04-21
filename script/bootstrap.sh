#!/bin/bash
# Bootstrap
## Run all setup steps in order

set -euo pipefail
DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

source "$DIR/configure-environment.sh"
source "$DIR/install-dependencies.sh"
source "$DIR/link-skills.sh"
source "$DIR/provision-agents.sh"
source "$DIR/prepare-git.sh"
source "$DIR/refresh-docs.sh"
source "$DIR/hook-shell.sh"
