#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# COPY ZHS PREFS TO $HOME
# - https://github.com/ohmyzsh/ohmyzsh/wiki
# - https://www.zerotohero.dev/zshell-startup-files/
#
# Example:
#  bash omzsh/sync.sh
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
    local ZPROFILE_LOCAL="$PWD/omzsh/.zprofile"
    local ZPROFILE_HOME="$HOME/.zprofile"
    if [[ -e "$ZPROFILE_HOME" ]]; then
        msg "WARNING" "Found existing: $ZPROFILE_HOME"
        confirm "Copy $ZPROFILE_LOCAL to $ZPROFILE_HOME anyway?"

        if is_confirmed; then
            copy "$ZPROFILE_LOCAL" "$ZPROFILE_HOME"
        else
            msg "ERROR" "Ok, aborting..."
        fi
    else
        copy "$ZPROFILE_LOCAL" "$ZPROFILE_HOME"
    fi

    local ZSHRC_LOCAL="$PWD/omzsh/.zshrc"
    local ZSHRC_HOME="$HOME/.zshrc"
    if [[ -e "$ZSHRC_HOME" ]]; then
        msg "WARNING" "Found existing: $ZSHRC_HOME"
        confirm "Copy $ZSHRC_LOCAL to $ZSHRC_HOME anyway?"

        if is_confirmed; then
            copy "$ZSHRC_LOCAL" "$ZSHRC_HOME"
        else
            msg "ERROR" "Ok, aborting..."
        fi
    else
        copy "$ZSHRC_LOCAL" "$ZSHRC_HOME"
    fi
}

# Run
main
