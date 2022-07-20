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
    local SRC="$1"
    local DEST="$2"
    if [[ -f "$SRC" ]]; then
        log "INFO" "Copying $SRC to $DEST ..."
        cp -- "$SRC" "$DEST"
        log "SUCCESS" "Done!"
    else
        log "ERROR" "$SRC does not exist."
    fi
}

# ----
# Main
# ----
main() {
    local ZPROFILE="$PWD/omzsh/.zprofile"
    local ZPROFILE_HOME="$HOME/.zprofile"
    log "WARNING" "This will overwrite: $ZPROFILE"
    confirm "Copy $ZPROFILE_HOME to $ZPROFILE anyway?"

    if is_confirmed; then
        copy $ZPROFILE_HOME $ZPROFILE
    fi

    local ZSHRC="$PWD/omzsh/.zshrc"
    local ZSHRC_HOME="$HOME/.zshrc"
    log "WARNING" "Found existing: $ZSHRC_HOME"
    confirm "Copy $ZSHRC_HOME to $ZSHRC anyway?"

    if is_confirmed; then
        copy $ZSHRC_HOME $ZSHRC
    fi
}

# ---
# Run
# ---
main
