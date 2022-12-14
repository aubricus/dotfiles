#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# POETRY INSTALL
# - https://python-poetry.org/docs/master/#installing-with-the-official-installer
#
# Example
#   bash poetry/install.sh
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Bash flags
#  -e, exit on error
#  -u, unset variable is an error
#  -o pipefail, fail pipe chain if error
#  See: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -eu -o pipefail

# Main

main() {
    # NOTE: This script will check if it's installed.
    curl -sSL https://install.python-poetry.org | python3 -
}

# Run
main
