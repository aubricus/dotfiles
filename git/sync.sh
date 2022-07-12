#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# COPY GIT PREFS TO $HOME
# - https://git-scm.com/docs/gitattributes
# - https://git-scm.com/docs/git-config
# - https://git-scm.com/docs/gitignore
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# -e, exit on error
# -u, unset variable is an error
# -o pipefail, fail pipe chain if error
set -eu -o pipefail

log() {
    local LEVEL="$1"
    local MESSAGE="$2"

    if [ "$LEVEL" = "INFO" ]; then
        printf "$(tput setaf 7)▸ %s$(tput sgr0)\n" "$MESSAGE"
    fi
    if [ "$LEVEL" = "WARNING" ]; then
        printf "$(tput setaf 136)! %s$(tput sgr0)\n" "$MESSAGE"
    fi
    if [ "$LEVEL" = "ERROR" ]; then
        printf "$(tput setaf 1)x %s$(tput sgr0)\n" "$MESSAGE"
    fi
    if [ "$LEVEL" = "SUCCESS" ]; then
        printf "$(tput setaf 64)✓ %s$(tput sgr0)\n" "$MESSAGE"
    fi
}

confirm() {
    printf "\n"
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
    local GITATTRIBUTES="$PWD/git/.gitattributes"
    local GITATTRIBUTES_EXISTING="$HOME/.gitattributes"
    if [[ -e "$GITATTRIBUTES_EXISTING" ]]; then
        log "WARNING" "Found existing: $GITATTRIBUTES_EXISTING"
        confirm "Copy $GITATTRIBUTES to $HOME anyway?"

        if is_confirmed; then
            copy $GITATTRIBUTES
        fi
    fi

    local GITCONFIG="$PWD/git/.gitconfig"
    local GITCONFIG_EXISTING="$HOME/.gitconfig"
    if [[ -e "$GITCONFIG_EXISTING" ]]; then
        log "WARNING" "Found existing: $GITCONFIG_EXISTING"
        confirm "Copy $GITCONFIG to $HOME anyway?"

        if is_confirmed; then
            copy $GITCONFIG
        fi
    fi

    local GITIGNORE="$PWD/git/.gitignore"
    local GITIGNORE_EXISTING="$HOME/.gitignore"
    if [[ -e "$GITIGNORE_EXISTING" ]]; then
        log "WARNING" "Found existing: $GITIGNORE_EXISTING"
        confirm "Copy $GITIGNORE to $HOME anyway?"

        if is_confirmed; then
            copy $GITIGNORE
        fi
    fi
}

# ---
# Run
# ---
main
