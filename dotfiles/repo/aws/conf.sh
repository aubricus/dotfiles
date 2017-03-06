#!/usr/bin/env bash

# -------------------------------------
# AWS DOTFILES CONF
# -------------------------------------


declare -a src=()


declare -a links=(
    "config:$HOME/.aws/config"
)

# Credentials will not be versioned!
declare -a copy=(
    "credentials.private:$HOME/.aws/credentials"
)
