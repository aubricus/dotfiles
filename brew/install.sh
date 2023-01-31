#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# BREW INSTALL
# - https://brew.sh/
#
# Example
#   bash brew/install.sh
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=


# Bash flags
#  -e, exit on error
#  -u, unset variable is an error
#  -o pipefail, fail pipe chain if error
#  See: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -eu -o pipefail

# Imports
source "$PWD/lib/functions.sh"

# Main
main() {
    if ! check brew; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        msg "ERROR" "Brew already installed aborting..."
    fi
}

# Run
main
