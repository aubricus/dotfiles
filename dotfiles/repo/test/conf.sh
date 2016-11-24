#!/usr/bin/env bash

# -------------------------------------
# SHELL DOTFILES CONF
# -------------------------------------


local -a src=(
    "test_src"
    "test_aliases"
    "test_creds.private"
)

local -a links=(
    "test_link:$HOME/.test_link"
    "test_bad_name:$HOME/.test_bad_name"
)

local -a copy=(
    "test_copy:$HOME/.test_copy"
    "test_bad_name:$HOME/.test_bad_name"
)
