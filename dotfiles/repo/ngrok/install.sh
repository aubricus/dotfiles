#!/usr/bin/env bash

# -------------------------------------
# NGROK INSTALL
# -------------------------------------

if test ! $(which ngrok); then
    echo "Installing Ngrok..."
    brew cask install ngrok
else
    echo "Ngrok already installed..."
fi

token=$(head -n 1 $(dotfiles path ngrok token.private))

ngrok authtoken "$token"
