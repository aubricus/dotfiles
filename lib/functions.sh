#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# FUNCTIONS
# 
# To import:
#   source "$PWD/lib/funtions"
# 
# At end of file, make sure to unset:
#   unset_functions
#
# Example(s)
#   See lib/functions_tests.sh
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Declarations 

declare -a functions_h=("log")

unset_functions() {
    unset ${functions_h[*]}
}

# Logging

# Log a message with a pre-formatted "level".
# 
# Params:
#   - $1: LEVEL - Level to log, required, case sensitive (INFO, WARNING, ERROR, SUCCESS)
#   - $2: MESSAGE – Message to log, required
#
# Example:
# log "INFO" "Hello world!"
msg() {
    local LEVEL="$1"
    local MESSAGE="$2"
    local INFO_PREFIX="$(tput setaf 7)▸ %s$(tput sgr0)\n"
    local WARNING_PREFIX="$(tput setaf 136)! %s$(tput sgr0)\n"
    local ERROR_PREFIX="$(tput setaf 1)x %s$(tput sgr0)\n"
    local SUCCESS_PREFIX="$(tput setaf 64)✓ %s$(tput sgr0)\n"

    if [[ "$LEVEL" = "WARNING" ]]; then
        printf "$WARNING_PREFIX" "$MESSAGE"
    elif [[ "$LEVEL" = "ERROR" ]]; then
        printf "$ERROR_PREFIX" "$MESSAGE"
    elif [[ "$LEVEL" = "SUCCESS" ]]; then
        printf "$SUCCESS_PREFIX" "$MESSAGE"
    else
        printf "$INFO_PREFIX" "$MESSAGE"
    fi
}

# Simple function to log a command and immediatley run it.
trace() {
    local COMMAND_STR="$@"
    msg "INFO" "Running: $COMMAND_STR"
    $@
}

# Interactive

# Display an interactive confirmation prompt. 
# Works with is_confirmed.
# 
# Params:
# - $@: MESSAGE
# 
# Example:
# confirm "Say hello?"
# if is_confirmed; then
#     echo "Hello World"
# fi
confirm() {
    local MESSAGE="$@"
    msg "WARNING" "$MESSAGE"
    read -p "$(tput setaf 7)▸ Please answer: (y/n) " -n 1
    printf "\n"
}

# Capture and return result from confirm.
# 
# See confirm docs.
is_confirmed() {
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
        return 0
    fi
    return 1
}


# Utils

# Check if a program is available.
#
# Params:
#   $1 The command to check
#
# Example:
#   if check echo; then
#       echo "The echo command is available!"
#   fi
#
# See: https://stackoverflow.com/a/677212
check() {
    if command -v $1 &>/dev/null; then
        return 0
    else
        return 1
    fi
}
