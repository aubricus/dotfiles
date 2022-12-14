#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# COPY ZHS FOM HOME TO DOTFILES
# - https://github.com/ohmyzsh/ohmyzsh/wiki
# - https://www.zerotohero.dev/zshell-startup-files/
#
# Example
#  bash omzsh/pull.sh
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
    msg "WARNING" "This will overwrite: $ZPROFILE_LOCAL"
    confirm "Copy $ZPROFILE_HOME to $ZPROFILE_LOCAL anyway?"

    if is_confirmed; then
        copy "$ZPROFILE_HOME" "$ZPROFILE_LOCAL"
    else
        msg "ERROR" "Ok, aborting..."
    fi

    local ZSHRC_LOCAL="$PWD/omzsh/.zshrc"
    local ZSHRC_HOME="$HOME/.zshrc"
    msg "WARNING" "This will overwrite: $ZSHRC_LOCAL"
    confirm "Copy $ZSHRC_HOME to $ZSHRC_LOCAL anyway?"

    if is_confirmed; then
        copy "$ZSHRC_HOME" "$ZSHRC_LOCAL"
    else
        msg "ERROR" "Ok, aborting..."
    fi
}

# Run
main
