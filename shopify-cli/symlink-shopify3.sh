#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# SHPOIFY CLI SYMLINK SHOPIFY 3
# - https://shopify.dev/themes/tools/cli
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Bash Flags
# -e, exit on error
# -u, unset variable is an error
# -o pipefail, fail pipe chain if error
set -eu -o pipefail

# Imports
source "$PWD/lib/functions.sh"

# Main
main() {
    local SHOPIFY_CMD="$(command -v shopify)"
    local SHOPIFY_DIR="$(dirname $SHOPIFY_CMD)"
    local SHOPIFY3_LN="$(command -v shopify3)"

    rm -rf "$SHOPIFY3_LN"
    cd "$(dirname $SHOPIFY_CMD)"
    ln -s shopify shopify3
}

# Run
main
