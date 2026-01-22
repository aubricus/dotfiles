#!/usr/bin/env bash

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# DOTFILES RUNNER
#
# A unified interface for running any .sh script in the dotfiles subdirectories.
#
# Examples:
#   bash dotfiles.sh --help
#   bash dotfiles.sh --list
#   bash dotfiles.sh brew --list
#   bash dotfiles.sh brew sync
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Bash flags
#  -e, exit on error
#  -u, unset variable is an error
#  -o pipefail, fail pipe chain if error
#  See: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -eu -o pipefail

# Imports
source "$PWD/lib/functions.sh"

# Display help information
show_help() {
    cat <<EOF
Usage: bash dotfiles.sh [DIRECTORY] [SCRIPT|--list|--help]
       bash dotfiles.sh [--list|--help]

A unified interface for running scripts in the dotfiles repository.

Options:
  --help              Show this help message
  --list              List all available directories with scripts

Arguments:
  DIRECTORY           Directory name (e.g., brew, git, omzsh)
  SCRIPT              Script name without .sh extension (e.g., install, sync)
  DIRECTORY --list    List all available scripts in a directory
  DIRECTORY --help    Show available scripts in a directory

Examples:
  bash dotfiles.sh --list
  bash dotfiles.sh brew --list
  bash dotfiles.sh brew sync
  bash dotfiles.sh git install

EOF
}

# List all directories containing .sh files (excluding lib/)
list_directories() {
    msg "INFO" "Available directories with scripts:"
    printf "\n"
    
    local FOUND_DIRS=()
    
    # Find all directories with .sh files, excluding lib/
    for DIR in */; do
        DIR="${DIR%/}"  # Remove trailing slash
        
        # Skip lib directory
        if [[ "$DIR" == "lib" ]]; then
            continue
        fi
        
        # Check if directory has .sh files
        if ls "$DIR"/*.sh >/dev/null 2>&1; then
            FOUND_DIRS+=("$DIR")
        fi
    done
    
    # Sort and display directories
    IFS=$'\n' SORTED_DIRS=($(sort <<<"${FOUND_DIRS[*]}"))
    unset IFS
    
    for DIR in "${SORTED_DIRS[@]}"; do
        printf "  - %s\n" "$DIR"
    done
    
    printf "\n"
    msg "INFO" "Run 'bash dotfiles.sh DIRECTORY --list' to see available scripts"
}

# List all scripts in a specific directory
list_scripts() {
    local DIRECTORY="$1"
    
    # Validate directory exists
    if [[ ! -d "$DIRECTORY" ]]; then
        msg "ERROR" "Directory '$DIRECTORY' not found"
        printf "\n"
        msg "INFO" "Run 'bash dotfiles.sh --list' to see available directories"
        exit 1
    fi
    
    # Check for .sh files
    if ! ls "$DIRECTORY"/*.sh >/dev/null 2>&1; then
        msg "ERROR" "No scripts found in '$DIRECTORY'"
        exit 1
    fi
    
    msg "INFO" "Available scripts in '$DIRECTORY':"
    printf "\n"
    
    local SCRIPTS=()
    
    # Collect script names without .sh extension
    for SCRIPT in "$DIRECTORY"/*.sh; do
        SCRIPT_NAME=$(basename "$SCRIPT" .sh)
        SCRIPTS+=("$SCRIPT_NAME")
    done
    
    # Sort and display scripts
    IFS=$'\n' SORTED_SCRIPTS=($(sort <<<"${SCRIPTS[*]}"))
    unset IFS
    
    for SCRIPT in "${SORTED_SCRIPTS[@]}"; do
        printf "  - %s\n" "$SCRIPT"
    done
    
    printf "\n"
    msg "INFO" "Run 'bash dotfiles.sh $DIRECTORY SCRIPT' to execute a script"
}

# Show help for a specific directory
show_directory_help() {
    local DIRECTORY="$1"
    
    # Validate directory exists
    if [[ ! -d "$DIRECTORY" ]]; then
        msg "ERROR" "Directory '$DIRECTORY' not found"
        printf "\n"
        msg "INFO" "Run 'bash dotfiles.sh --list' to see available directories"
        exit 1
    fi
    
    list_scripts "$DIRECTORY"
}

# Execute a script in a specific directory
execute_script() {
    local DIRECTORY="$1"
    local SCRIPT="$2"
    local SCRIPT_PATH="$DIRECTORY/$SCRIPT.sh"
    
    # Validate directory exists
    if [[ ! -d "$DIRECTORY" ]]; then
        msg "ERROR" "Directory '$DIRECTORY' not found"
        printf "\n"
        msg "INFO" "Run 'bash dotfiles.sh --list' to see available directories"
        exit 1
    fi
    
    # Validate script exists
    if [[ ! -f "$SCRIPT_PATH" ]]; then
        msg "ERROR" "Script '$SCRIPT' not found in '$DIRECTORY'"
        printf "\n"
        msg "INFO" "Run 'bash dotfiles.sh $DIRECTORY --list' to see available scripts"
        exit 1
    fi
    
    # Execute the script
    msg "INFO" "Executing: $SCRIPT_PATH"
    printf "\n"
    bash "$SCRIPT_PATH"
}

# Main function - parse arguments and route to appropriate function
main() {
    # No arguments - show help
    if [[ $# -eq 0 ]]; then
        show_help
        exit 0
    fi
    
    # Single argument
    if [[ $# -eq 1 ]]; then
        case "$1" in
            --help|-h)
                show_help
                exit 0
                ;;
            --list|-l)
                list_directories
                exit 0
                ;;
            *)
                msg "ERROR" "Invalid argument: $1"
                printf "\n"
                show_help
                exit 1
                ;;
        esac
    fi
    
    # Two arguments
    if [[ $# -eq 2 ]]; then
        local DIRECTORY="$1"
        local ACTION="$2"
        
        case "$ACTION" in
            --list|-l)
                list_scripts "$DIRECTORY"
                exit 0
                ;;
            --help|-h)
                show_directory_help "$DIRECTORY"
                exit 0
                ;;
            *)
                execute_script "$DIRECTORY" "$ACTION"
                exit 0
                ;;
        esac
    fi
    
    # Too many arguments
    msg "ERROR" "Too many arguments"
    printf "\n"
    show_help
    exit 1
}

# Run
main "$@"
