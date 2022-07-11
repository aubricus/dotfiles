#!/bin/zsh

# -------------------------------------
# BREW INSTALL
# -------------------------------------

if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Brew already installed..."
fi

# See: https://github.com/Homebrew/homebrew-bundle
brew tap Homebrew/bundle

brew bundle --file="./Brewfile"