#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Run Brewfile
# See: https://github.com/Homebrew/homebrew-bundle
# 
# Example:
#   bash brew/sync.sh
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
    local BREWFILE="$PWD/brew/Brewfile"
    if [[ -e "$BREWFILE" ]]; then
        trace brew update --auto-update
        trace brew bundle --file brew/Brewfile
        trace brew doctor
    else
        msg "ERROR" "No file found for $BREWFILE"
        exit 1
    fi
}

# Run
main

# Cleanup
unset_functions
