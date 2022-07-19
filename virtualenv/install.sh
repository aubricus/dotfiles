#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# VIRTUALENV INSTALL
# - https://virtualenv.pypa.io/en/latest/installation.html
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# ----------
# Bash Flags
# ----------
# -e, exit on error
# -u, unset variable is an error
# -o pipefail, fail pipe chain if error
set -eu -o pipefail

# ----
# Main
# ----

main() {
    pipx install virtualenv
    virtualenv --help
}

# ---
# Run
# ---
main
