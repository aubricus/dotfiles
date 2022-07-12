#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# OH MY ZSH INSTALL
# - https://ohmyz.sh/#install
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
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# ---
# Run
# ---
main
