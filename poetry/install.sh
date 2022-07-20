#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# POETRY INSTALL
# - https://python-poetry.org/docs/master/#installing-with-the-official-installer
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
    curl -sSL https://install.python-poetry.org | python3 -
}

# ---
# Run
# ---
main
