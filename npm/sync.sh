#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# COPY ZHS PREFS TO $HOME
# - https://github.com/ohmyzsh/ohmyzsh/wiki
# - https://www.zerotohero.dev/zshell-startup-files/
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# -e, exit on error
# -u, unset variable is an error
# -o pipefail, fail pipe chain if error
set -eu -o pipefail

# ---------
# Functions
# ---------

log() {
    local LEVEL="$1"
    local MESSAGE="$2"

    if [[ "$LEVEL" = "INFO" ]]; then
        printf "$(tput setaf 7)▸ %s$(tput sgr0)\n" "$MESSAGE"
    fi
    if [[ "$LEVEL" = "WARNING" ]]; then
        printf "$(tput setaf 136)! %s$(tput sgr0)\n" "$MESSAGE"
    fi
    if [[ "$LEVEL" = "ERROR" ]]; then
        printf "$(tput setaf 1)x %s$(tput sgr0)\n" "$MESSAGE"
    fi
    if [[ "$LEVEL" = "SUCCESS" ]]; then
        printf "$(tput setaf 64)✓ %s$(tput sgr0)\n" "$MESSAGE"
    fi
}

confirm() {
    log "WARNING" "$@"
    read -p "$(tput setaf 7)▸ Please answer: (y/n) " -n 1
    printf "\n"
}

is_confirmed() {
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
        return 0
    fi
    return 1
}

copy() {
    local FILE="$@"
    if [[ -f "$FILE" ]]; then
        log "INFO" "Copying $FILE to $HOME ..."
        cp -- "$FILE" "$HOME"
        log "SUCCESS" "Done!"
    else
        log "ERROR" "$FILE does not exist."
    fi
}

# ----
# Main
# ----
main() {
    local NPMRC="$PWD/npm/.npmrc"
    local NPMRC_EXISTING="$HOME/.npmrc"
    if [[ -e "$NPMRC_EXISTING" ]]; then
        log "WARNING" "Found existing: $NPMRC_EXISTING"
        confirm "Copy $NPMRC to $HOME anyway?"

        if is_confirmed; then
            copy $NPMRC
        fi
    else
        copy $NPMRC
    fi
}

# ---
# Run
# ---
main
