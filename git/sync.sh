#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# COPY GIT PREFS TO $HOME
# - https://git-scm.com/docs/gitattributes
# - https://git-scm.com/docs/git-config
# - https://git-scm.com/docs/gitignore
#
# Example:
#   bash git/sync.sh
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
    local GITATTR_LOCAL="$PWD/git/.gitattributes"
    local GITATTR_HOME="$HOME/.gitattributes"
    if [[ -e "$GITATTR_HOME" ]]; then
        msg "WARNING" "Found existing: $GITATTR_HOME"
        confirm "Copy $GITATTR_LOCAL to $GITATTR_HOME anyway?"

        if is_confirmed; then
            copy "$GITATTR_LOCAL" "$GITATTR_HOME"
        else
            msg "ERROR" "Ok, aborting..."
        fi
    else
        copy "$GITATTR_LOCAL" "$GITATTR_HOME"
    fi

    local GITCONFIG_LOCAL="$PWD/git/.gitconfig"
    local GITCONFIG_HOME="$HOME/.gitconfig"
    if [[ -e "$GITCONFIG_HOME" ]]; then
        msg "WARNING" "Found existing: $GITCONFIG_HOME"
        confirm "Copy $GITCONFIG_LOCAL to $GITCONFIG_HOME anyway?"

        if is_confirmed; then
            copy "$GITCONFIG_LOCAL" "$GITCONFIG_HOME"
        else
            msg "ERROR" "Ok, aborting..."
        fi
    else
        copy "$GITCONFIG_LOCAL" "$GITCONFIG_HOME"
    fi

    local GITIGNORE_LOCAL="$PWD/git/.gitignore"
    local GITIGNORE_HOME="$HOME/.gitignore"
    if [[ -e "$GITIGNORE_HOME" ]]; then
        msg "WARNING" "Found existing: $GITIGNORE_HOME"
        confirm "Copy $GITIGNORE_LOCAL to $GITIGNORE_HOME anyway?"

        if is_confirmed; then
            copy "$GITIGNORE_LOCAL" "$GITIGNORE_HOME"
        else
            msg "ERROR" "Ok, aborting..."
        fi
    else
        copy "$GITIGNORE_LOCAL" "$GITIGNORE_HOME"
    fi
}

# ---
# Run
# ---
main
