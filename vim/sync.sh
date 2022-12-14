#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# COPY VIM PREFS TO $HOME
# - https://www.tutorialspoint.com/vim/vim_installation_and_configuration.htm
#
# Example:
#  bash vim/sync.sh
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
    local VIMRC_LOCAL="$PWD/vim/.vimrc"
    local VIMRC_HOME="$HOME/.vimrc"
    if [[ -e "$VIMRC_HOME" ]]; then
        msg "WARNING" "Found existing: $VIMRC_HOME"
        confirm "Copy $VIMRC_LOCAL to $VIMRC_HOME anyway?"
        if is_confirmed; then
            copy "$VIMRC_LOCAL" "$VIMRC_HOME"
        else
            msg "ERROR" "Ok, aborting..."
        fi
    else
        copy "$VIMRC_LOCAL" "$VIMRC_HOME"
    fi
}

# Run
main
