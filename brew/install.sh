#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# BREW INSTALL
# - https://brew.sh/
# - https://github.com/Homebrew/homebrew-bundle
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
    if test ! $(which brew); then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        brew tap Homebrew/bundle
    else
        echo "Brew already installed..."
    fi
}

# ---
# Run
# ---
main
