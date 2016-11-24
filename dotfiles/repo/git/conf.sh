#!/usr/bin/env bash

# -------------------------------------
# GIT DOTFILES CONF
# -------------------------------------


declare -a src=(
    "aliases"
)

declare -a links=(
    "gitignore:$HOME/.gitignore"
    "gitattributes:$HOME/.gitattributes"
)

# Copy .gitconfig to avoid accidentally comitting
# sensitive informatino to version control.
declare -a copy=(
    "gitconfig:$HOME/.gitconfig"
)
