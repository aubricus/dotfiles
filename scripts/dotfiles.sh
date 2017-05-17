#!/usr/bin/env bash

# -------------------------------------
# DOTFILES
# -------------------------------------

# -e, exit on error
# -u, unset variable is an error
# -o pipefail, fail pipe chain if error
set -eu -o pipefail

# DOTFILES_DIR
#
# Absolute path to the dotfiles repo.
#
# Notes:
# - Set this variable in dotfiles/bash_profile
# - Additionally, if this is a first-run,
#   export the variable for the current session and run setup.
#
# Test for unset variable
# See: http://stackoverflow.com/a/13864829
if [ -z ${DOTFILES_DIR+x} ]; then
    printf "$(tput setaf 1)x %s$(tput sgr0)\n" "Global var DOTFILES_DIR is unset but required!"
    exit 1
fi

# Imports
# =====================================

source "$DOTFILES_DIR/lib/functions"

# Documentation
# =====================================

run_help() {
cat <<EOT
Dotfiles - Aubrey Taylor - http://github.com/aubricus/dotfiles

Commands:
    setup           Run setup
    add             Add a package
    remove          Remove a package
    copy            [Re]Copy a file from a package
    link            [Re]Link a file from a package
    run             [Re]Run a file from a package
    path            Get absolute path to package file (see Examples)
    all             Add all available packages
    none            Remove all enabled packages
    edit            Open dotfiles in sublime

Usage:
    dotfiles (-h | --help)
    dotfiles <command>
    dotfiles add <package_name>
    dotfiles rm <package_name>
    dotfiles link <package_name> <entry_name>
    dotfiles copy <package_name> <entry_name>
    dotfiles run <pakcage_name> <script_name>
    dotfiles path <package_name> <entry_name>

Options:
    -h, --help      Print this help message

Examples:
    source \$(dotfiles path foo bar)
EOT
}

# Argv Handling
# =====================================

# $#, number of args
if [[ $# == 0 || "$1" =~ (--help|-h) ]]; then
    run_help
    exit
fi

if [[ "$1" == "setup" ]]; then
    setup $DOTFILES_DIR
    exit
fi

if [[ "$1" == "all" ]]; then
    add_all $DOTFILES_DIR
    exit
fi

if [[ "$1" == "none" ]]; then
    remove_all $DOTFILES_DIR
    exit
fi

if [[ "$1" == "add" ]]; then

    if [[ $# < 2 ]]; then
        run_help
        log_error "add expects a package name!"
        exit 1
    fi

    add_package $DOTFILES_DIR "${2}"
    exit
fi

if [[ "$1" == "rm" ]]; then

    if [[ $# < 2 ]]; then
        run_help
        log_error "rm expects a package name!"
        exit 1
    fi

    remove_package $DOTFILES_DIR "${2}"
    exit
fi

if [[ "$1" == "copy" ]]; then

    if [[ $# < 3 ]]; then
        run_help
        log_error "copy expects a package name and an entry name!"
        exit 1
    fi

    copy_entry $DOTFILES_DIR "${2}" "${3}"
    exit
fi

if [[ "$1" == "link" ]]; then

    if [[ $# < 3 ]]; then
        run_help
        log_error "link expects a package name and an entry name!"
        exit 1
    fi

    link_entry $DOTFILES_DIR "${2}" "${3}"
    exit
fi

if [[ "$1" == "path" ]]; then

    if [[ $# < 3 ]]; then
        run_help
        log_error "path expects a package name and an entry name!"
        exit 1
    fi

    get_pkg_path $DOTFILES_DIR "${2}" "${3}"
    exit
fi

if [[ "$1" == "run" ]]; then

    if [[ $# < 3 ]]; then
        run_help
        log_error "run expects a package name and an entry name!"
        exit 1
    fi

    run_entry $DOTFILES_DIR "${2}" "${3}" "${@:4}"
    exit
fi

echo $1
if [[ "$1" == "edit" ]]; then
    edit_dotfiles $DOTFILES_DIR
fi

# Nothing matched, show help
run_help

# Clean up
unset run_help
unset_functions
