#!/usr/bin/env bash

# -------------------------------------
# SUBLIME DOTFILES INSTALL
# -------------------------------------


lib_dir="${HOME}/Library/Application Support/Sublime Text 3"
installed_packages_dir="$lib_dir/Installed Packages"
user_dir="$lib_dir/Packages/User"
package_control_url="https://packagecontrol.io/Package%20Control.sublime-package"

keymap="$(dotfiles path sublime "st3/Default (OSX).sublime-keymap")"
packages="$(dotfiles path sublime "st3/Package Control.sublime-settings")"
preferences="$(dotfiles path sublime "st3/Preferences.sublime-settings")"

# Download Package Control

echo "Downloading Package Control..."
curl -o "$installed_packages_dir/Package Control.sublime-package"  "$package_control_url"

echo "Copying preferences"
cp "$keymap" "$user_dir"
cp "$packages" "$user_dir"
cp "$preferences" "$user_dir"
