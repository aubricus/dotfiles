#!/usr/bin/env bash

# -------------------------------------
# BREW INSTALL
# -------------------------------------

if test ! $(which brew); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Brew already installed..."
fi


# See: https://github.com/Homebrew/homebrew-bundle
brew tap Homebrew/bundle

brew bundle --file="$(dotfiles path brew Brewfile)"
