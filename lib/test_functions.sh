#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Function Tests
#
# Example
# bash lib/test_functions.sh test_msg
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# See: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
# -e, exit on error
# -u, unset variable is an error
# -o pipefail, fail pipe chain if error
set -eu -o pipefail

# Imports
source "$PWD/lib/functions.sh"

# Tests
test_msg() {
    msg "INFO" "Testing info level message..."
    msg "WARNING" "Testing warning level message..."
    msg "ERROR" "Testing error level message..."
    msg "SUCCESS" "Testing success level message..."
    msg "UNSUPPORTED" "Testing unsupported level message..."
}

test_trace() {
    trace echo "Hello world!"
}

test_confirm() {
    confirm "Say hello?"
    if is_confirmed; then
        msg "SUCCESS" "Hello World!"
    else
        msg "ERROR" "Nevermind then!"
    fi
}

test_check() {
    if check echo; then
        msg "SUCCESS" "The command \`echo\` is available!"
    fi
    if ! check boop; then
        msg "ERROR" "The command \`boop\` is not available aborting..."
    fi
}

# Main
#
# Params:
# $1: TEST_TO_RUN – The test to run
main() {
    local TEST_TO_RUN="$1"
    local VALID_TEST_NAMES=("test_msg", "test_trace", "test_confirm", "test_chedk")
    if [[ "$TEST_TO_RUN" == "test_msg" ]]; then
        test_msg
        exit
    fi
    if [[ "$TEST_TO_RUN" == "test_trace" ]]; then
        test_trace
        exit
    fi
    if [[ "$TEST_TO_RUN" == "test_confirm" ]]; then
        test_confirm
        exit
    fi
    if [[ "$TEST_TO_RUN" == "test_check" ]]; then
        test_check "TEST"
        exit
    fi
    
    msg "ERROR" "$TEST_TO_RUN is not a valid test name. Valid test names are: ${VALID_TEST_NAMES[*]}."
    exit 1
}

# Run
main $1

# Cleanup
unset_functions
