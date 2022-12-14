#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# VIRTUALENV INSTALL
# - https://virtualenv.pypa.io/en/latest/installation.html
# 
# Example
#  bash virtualenv/install.sh
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
    # NOTE: `pipx` is installed using the Brewfile.
    # NOTE: Installer will check if already installed.
    trace pipx install virtualenv
    trace virtualenv --version
}

# Run
main
