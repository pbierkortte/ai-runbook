#!/bin/bash
# dev-setup.sh
# Sets up an AI-friendly dev environment.
# Installs tools, configures shells, and wires up skill dirs.
#
# Usage: bash script/dev-setup.sh

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$DIR/install-deps.sh"
source "$DIR/env-vars.sh"
source "$DIR/inject-rules.sh"
source "$DIR/shell-hooks.sh"
source "$DIR/setup-skills.sh"
source "$DIR/openskills-manifest.sh"
source "$DIR/install-agents.sh"
