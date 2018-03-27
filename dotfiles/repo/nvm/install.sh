#!/usr/bin/env bash

# -------------------------------------
# NVM INSTALL
# -------------------------------------
#  See:
#   * https://github.com/creationix/nvm#installation

install_nvm(){
    local home=$HOME
    local pwd="$PWD"
    local version="v0.33.8"
    local nvm_folder=".nvm"

    cd "$home" && \
    rm -rf "$nvm_folder" && \
    git clone https://github.com/creationix/nvm.git .nvm && \
    cd "$nvm_folder" && \
    git checkout "$version" && \
    cd "$pwd"
}

# Run installer
install_nvm
