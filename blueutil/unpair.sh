#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Unpair all devices using Blueutil / JQ
# See: https://github.com/toy/blueutil
# See: https://jqlang.github.io/jq/
#
# Requires:
# - blueutil
# - jq
#
# Example:
#   bash blueutil/unpair.sh
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
    if ! check jq; then
        msg "ERROR" "jq is required but not installed"
        exit 1
    fi

    if ! check blueutil; then
        msg "ERROR" "blueutil is required but not installed"
        exit 1
    fi

    # Print devices before disconnecting
    msg "INFO" "Listing paired devices in JSON..."

    local PAIRED_JSON="$(blueutil --paired --format json)"
    echo "$PAIRED_JSON" | jq .

    # Loop through all addresses and disconnect each one
    local UNPAIR_SLEEP=1
    local ADDRESSES="$(echo $PAIRED_JSON | jq -r '.[].address')"

    for ADDRESS in $ADDRESSES; do
        msg "INFO" "Attempting to unpair $ADDRESS, printing info..."
        trace blueutil --info "$ADDRESS"
        trace blueutil --unpair "$ADDRESS"
        msg "INFO" "Waiting $UNPAIR_SLEEP second to unpair next device..."
        trace sleep "$UNPAIR_SLEEP"
    done

    # Print out paired devices
    local DISCONNECT_SLEEP=5

    msg "INFO" "Waiting $DISCONNECT_SLEEP seconds for devices to disconnect..."

    trace sleep "$DISCONNECT_SLEEP"

    msg "INFO" "Outputting paired devices in JSON (should be empty)..."

    local PAIRED_JSON=$(blueutil --paired --format json)

    echo $PAIRED_JSON | jq .

    exit 0
}

# Run
main
