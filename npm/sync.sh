#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# COPY ZHS PREFS TO $HOME
# - https://github.com/ohmyzsh/ohmyzsh/wiki
# - https://www.zerotohero.dev/zshell-startup-files/
#
# Example:
#  bash npm/sync.sh
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
    local NPMRC_LOCAL="$PWD/npm/.npmrc"
    local NPMRC_HOME="$HOME/.npmrc"
    if [[ -e "$NPMRC_HOME" ]]; then
        msg "WARNING" "Found existing: $NPMRC_HOME"
        confirm "Copy $NPMRC_LOCAL to $NPMRC_HOME anyway?"

        if is_confirmed; then
            copy "$NPMRC_LOCAL" "$NPMRC_HOME"
        else
            msg "ERROR" "Ok, aborting..."
        fi
    else
        copy "$NPMRC_LOCAL" "$NPMRC_HOME"
    fi
}

# Run
main
