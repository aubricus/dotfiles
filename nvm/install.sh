#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# NVM INSTALL
# - https://github.com/nvm-sh/nvm#installing-and-updating
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
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
}

# ---
# Run
# ---
main
