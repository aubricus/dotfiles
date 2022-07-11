# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# What is ~/.zprofile?
#   ~/.zprofile is one of the zsh startup and shutdown files. 
#   It is read (once) at login (before .zshrc)
# 
# Useful Links
# - https://www.zerotohero.dev/zshell-startup-files/
# - https://linuxhint.com/what_is_dev_null/
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# -------------------------------------
# SSH AGENT
# -------------------------------------

# Setup
eval "$(ssh-agent -s)" 1> /dev/null

# -------------------------------------
# BREW
# -------------------------------------

# Setup
eval "$(/opt/homebrew/bin/brew shellenv)"


# -------------------------------------
# VSCODE
# -------------------------------------

# Enable `code` from terminal
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
