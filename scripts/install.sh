#!/usr/bin/env bash

# -------------------------------------
# DOTFILES INSTALL
# -------------------------------------

# -e, exit on error
# -u, unset variable is an error
# -o pipefail, fail pipe chain if error
set -eu -o pipefail

DOTFILES_DIR="${HOME}/Repos/dotfiles"
DOTFILES_TARBALL="https://github.com/aubricus/dotfiles/tarball/master"
DOTFILES_REMOTE="git@github.com:aubricus/dotfiles.git"
now=$(date + "%Y%m%d")

# Functions
# =====================================

log_info() {
    printf "$(tput setaf 7)▸ %s$(tput sgr0)\n" "$@"
}

get_dotfiles() {
    # Create dir
    mkdir ${DOTFILES_DIR}

    # Download tarball
    curl -fsSLo ${HOME}/dotfiles.tar.gz ${DOTFILES_TARBALL}

    # Unzip
    tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOTFILES_DIR}

    # Cleanup
    rm -rf ${HOME}/dotfiles.tar.gz
}

init_repository() {
    git init
    git remote add origin ${DOTFILES_REMOTE}
    git fetch origin master

    # Reset the index and working tree to the fetched HEAD
    git reset --hard FETCH_HEAD

    # Remove any untracked files
    git clean -fd
}

backup_file() {
    backup_dir="${HOME}/dotfiles_bku"
    log_info "Moving file to $backup_dir/${1}-${now}"

    mkdir -p "$backup_dir"
    mv "${HOME}/${1}" "$backup_dir/${1}-${now}"
}

# Install Scripts
# =====================================

# Check for DOTFILES_DIR
# If missing, download and extract dotfiles.
if [[ ! -d "${DOTFILES_DIR}" ]]; then
    log_info "Downloading dotfiles..."
    get_dotfiles
    log_success "Done!"
fi

# Head into the dotfiles dir
cd $DOTFILES_DIR

# Load our utils
source ./lib/functions

log_header "Installing dotfiles..."

# Check for XCode Command Line Tools
if ! type_exists 'gcc'; then
    log_error "The XCode Command Line Tools must be installed first."
    log_info  "Download them from: https://developer.apple.com/downloads"
    log_info  "Then run: bash ~/${DOTFILES_DIR}/scripts/install.sh"
    exit 1
fi

# Initialize the git repository if it's missing
if ! is_git_repo; then
    log_info "Initializing git repository..."
    init_repository
    log_success "Done!"
fi


declare -a backup_dotfiles=(
    ".bash_profile" ".bashrc" ".dotfilessrc"
)

for i in ${!backup_dotfiles[*]}
do
    dotfile="${backup_dotfiles[$i]}"
    dotfile_path="${HOME}/$dotfile"

    if [[ -f $dotfile_path ]]; then
        log_warning "Found existing $dotfile"
        seek_confirmation "Would you like to save a backup of this file?"

        if is_confirmed; then
            backup_file $dotfile_path
        fi
    fi
done
log_success "Done!"

# Do initial setup
setup $DOTFILES_DIR

# Source bash profile for this session
source "${HOME}/.bash_profile"

# All done!
log_success "Install finished!"
log_info "Run: dotfiles --help to see usage."

# Cleanup
unset get_dotfiles init_repository backup_file backup_dotfiles
unset_functions

