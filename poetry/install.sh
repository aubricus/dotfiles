#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# POETRY INSTALL
# - https://python-poetry.org/docs/
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
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
}

# ---
# Run
# ---
main
