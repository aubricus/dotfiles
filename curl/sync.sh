#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# COPY CURL PREFS TO $HOME
# - https://everything.curl.dev/cmdline/configfile
#
# Example
#   bash curl/sync.sh
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
    local CURLRC_LOCAL="$PWD/curl/.curlrc"
    local CURLRC_HOME="$HOME/.curlrc"
    if [[ -e "$CURLRC_HOME" ]]; then
        msg "WARNING" "Found existing: $CURLRC_HOME"
        confirm "Copy $CURLRC_LOCAL to $CURLRC_HOME anyway?"
        if is_confirmed; then
            copy $CURLRC_LOCAL $CURLRC_HOME
        else
            msg "ERROR" "Ok, aborting..."
        fi
    else
        copy $CURLRC_LOCAL $CURLRC_HOME
    fi
}

# Run
main
