#!/usr/bin/env bash

function print_help {
    echo "\

Usage:
./wsk.sh <command_name>

Commands:

build_dotfiles  build osx bashrc and other dotfiles
                (builds in ./dotfiles)
help            prints this message
\
"
}

PREFS_DIR="./prefs"
BUILD_DIR="./dotfiles"
BASHRC=$BUILD_DIR/.bashrc

# Adding prefs that need to go into .bashrc?
# Add a file to this list
bashrc_prefs=("bash/settings.pref" "bash/colors.pref" "bash/ps1.pref" "bash/darwin.pref" "ruby/rvm.pref" "node/node.pref" "python/python.pref" "python/virtualenv.pref" "brew/brew.pref" "sublime/subl.pref" "bash/aliases.pref")

# Adding a dofile to your ~/ directory?
# Add it here.
dotfiles=("bash/.bash_profile" "git/.gitignore" "git/.gitconfig" "python/pdbrc.py" "ruby/.gemrc" "vim/.vimrc")

function build_dotfiles {
    rm -rf $BUILD_DIR
    mkdir -p $BUILD_DIR
    touch $BASHRC

    for pref in "${bashrc_prefs[@]}"
    do
        file_path=$PREFS_DIR/$pref
        if [ -f $file_path ]; then
            cat $file_path >> $BASHRC
        fi
    done

    for dotfile in "${dotfiles[@]}"
    do
        file_path=$PREFS_DIR/$dotfile
        if [ -f $file_path ]; then
            cp $file_path $BUILD_DIR
        fi
    done
}

# Script argv handling

argv=$1

if [ $argv = "help" ]; then
    print_help
fi

if [ $argv = "build_dotfiles" ]; then
    echo "Building dotfiles..."
    build_dotfiles
    echo "Finished!"
    exit 0
fi

