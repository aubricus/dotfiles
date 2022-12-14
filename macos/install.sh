#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# MACOS INSTALL(S)
#
# Example:
#   bash macos/install.sh
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Bash Flags
# -e, exit on error
# -u, unset variable is an error
# -o pipefail, fail pipe chain if error
set -eu -o pipefail

# Main
main() {
    # Rosetta helps some programs run on M1 architecture
    # https://support.apple.com/en-us/HT211861
    softwareupdate --install-rosetta
}

# Run
main
