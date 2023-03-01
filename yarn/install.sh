#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# NVM INSTALL
# - https://github.com/nvm-sh/nvm#installing-and-updating
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Bash flags
#  -e, exit on error
#  -u, unset variable is an error
#  -o pipefail, fail pipe chain if error
#  See: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -eu -o pipefail

# Main
main() {
    # NOTE: NVM install.sh will check to see if it's installed or not and quit if so.
    corepack enable
    corepack prepare yarn@stable --activate
}

# Run
main
