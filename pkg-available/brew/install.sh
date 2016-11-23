#!/usr/bin/env bash

# -------------------------------------
# BREW INSTALL
# -------------------------------------


/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# See: https://github.com/Homebrew/homebrew-bundle
brew tap Homebrew/bundle

brew bundle --file="$(dotfiles path brew Brewfile)"
