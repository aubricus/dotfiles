# Prefs

...

## Conventions

### `*.pref` Files

`*.pref` file extension is convention only denoting files intended for concatenation into the `.bashrc` using the (completely optional) project CLI.

> **See Also:**
>
> `bashrc_prefs` variable in the `./wsk.sh` file.

### Organization

Files have been organized according to the application they have in common.

> **For example:**
>
> Sublime `*.prefs (.bashrc)` and User Preferences reside in the `./prefs/sublime` directory.

...

## Dotfiles

_Dotfiles_ refer to files on a Linux or OSX machine typically living in the user's `$HOME` directory; usually accessible from the terminal at `~/`. These files set various configurations and preferences for the system and other applications.

This repository includes a set of _somewhat_ opinionated defaults that create a much nicer development environment out of the box.

**How Do I Use The Dotfiles Feature?**

The simplest way to use this feature is to:

1. Follow the [Setup Walkthrough](docs/setup-walkthrough.md)
2. Copy and paste all the files in **dotfiles/** into your home directory, `~/`
3. Open up a terminal and have at it!

> See [Cli.md]() for more options!

## Dotfiles – `.bashrc`

- bash - settings
- bash - darwin
- bash – colors
- bash - ps1
- bash - aliases
- brew - bash-completions
- node - path setup
- python - settings
- python - virtualenv|wrapper
- ruby - rvm setup

...

## Dotfiles – Git

- gitignore
- gitconfig

...

## Dotfiles – Python, Pdb++

- pdbrc.py

...

## Dotfiles – Ruby Gem

- .gemrc

...


## Dotfiles – Vim

- .vimrc

...

## Prefs – Sublime

- User – Default Keymap
- User – Packages
- User – Preferences
– Flake8 Config
- JS Hint Config
- SCSS Lint Config
- TS Lint Config

...
