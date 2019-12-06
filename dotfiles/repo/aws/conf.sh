#!/usr/bin/env bash

# -------------------------------------
# AWS DOTFILES CONF
# -------------------------------------


declare -a src=()


declare -a links=(
    "config:$HOME/.aws/config"
    "credentials.private:$HOME/.aws/credentials"
)
