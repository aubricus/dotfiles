#!/usr/bin/env bash

# -------------------------------------
# SHELL DOTFILES CONF
# -------------------------------------


local -a links=(
    "bashrc:$HOME/.bashrc"
    "inputrc:$HOME/.inputrc"
)

local -a src=(
    "settings"
    "options"
    "path"
    "aliases"
    "prompt"
)

local -a copy=()
