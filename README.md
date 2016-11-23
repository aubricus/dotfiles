# Dotfiles

My __OSX__ dotfiles.

> Tested on: `OSX 10.12: GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin16)`

## Inspiration

Many thanks to the following for the inspiration and code examples:

- [Nicolas Gallagher – necolas/dotfiles](https://github.com/necolas/dotfiles)
- [Zach Holman – holman/dotfiles](https://github.com/holman/dotfiles)
- [The Unofficial Guide to Dotfiles](https://dotfiles.github.io)

## Quick Summary

A package-based dotfile repo attempting to quell the chaos that is dotfiles.

## First Time Setup

> __Note__: This is only necessary if this is your first time here.

1. [__Fork this repository__](#why-should-i-fork).
2. Change the necessary paths (See Figs. 1.0, 1.1 below).
3. Commit & Push your changes.
4. Delete your repo if you checked it out locally.
4. Run the install command below (See: [Installation](#installation))

```bash
# scripts/install.sh

# The (eventual) path to the dotfiles repository
# Note: This dir doesn't exist yet
DOTFILES_DIR="/absolute/path/to/repo"

# Update your GitHub username below
DOTFILES_TARBALL="https://github.com/<gh_username>/dotfiles/tarball/master"
DOTFILES_REMOTE="git@github.com:<gh_username>/dotfiles.git"
```
__Fig 1.0__

```bash
# dotfiles/bash_profile

# The (eventual) path to the dotfiles repository
export DOTFILES_DIR="/absolute/path/to/repo"
```
__Fig 1.1__

<a name="installation"></a>
## Installation

Run the following:

> __Note__: Update with your Github username.

```bash
bash -c "$(curl -fsSL raw.githubusercontent.com/<gh_username>/dotfiles/master/scripts/install.sh)"
```

## What's inside?

Lots...and all likely incompatible with your system, hardware, and / or workflow.

> You can take a look at what's here if you like; everything is in `pkg-available/` but I recommend starting from scratch.

__Want to start from scratch?__

Just [__fork this repo__](#why-should-i-fork) and empty out `pkg-available`. That's it!

## Features

- Organizes system settings and prefs into a single, version-controlled (git) location.
- Provides conventions to store settings in discrete packages.
- Auto-install script
- Robust command-line to manage packages and settings.
- Auto-loaded / versioned `/bin` for small scripts / utils.
- Allows private / local settings.
- Decent console output. :space_invader:

## Command-Line

```text
Dotfiles - Aubrey Taylor - http://github.com/aubricus/dotfiles

Commands:
    setup           Run setup
    add             Add a package
    remove          Remove a package
    copy            [Re]Copy a file from a package
    link            [Re]Link a file from a package
    run             [Re]Run a file from a package
    path            Get absolute path to package file (see Examples)
    all             Add all available packages
    none            Remove all enabled packages

Usage:
    dotfiles (-h | --help)
    dotfiles <command>
    dotfiles add <package_name>
    dotfiles rm <package_name>
    dotfiles link <package_name> <entry_name>
    dotfiles copy <package_name> <entry_name>
    dotfiles run <pakcage_name> <script_name>
    dotfiles path <package_name> <entry_name>

Options:
    -h, --help      Print this help message

Examples:
    source $(dotfiles path foo bar)
```

## Dotfiles Packages

Packages organize a set of preferences into a distinct unit.`dotfiles` only requires a small amount of info about how to act on a package.

__Example Package Directory__:

```text
pkg-available/foo/
├── conf.sh (required)
├── foo.sh
├── aliases
├── settings
├── foo_config
├── foorc
└── creds.private
```

There are several package actions:

2. __link__: symlink a file(s)
3. __copy__: copy a file(s)
4. __source__: source a file*
4. __run__: run a script (via `dotfiles` cli only)

> * source actions only run in `bash_profile` or when manually sourced via `dotfiles src`.

### Package config:

`conf.sh` tells `dotfiles` about which files you'd like to `link`, `copy`, or `source`.

Sample config:

```bash

# Each value is a bash array, and must follow the names:
# - src
# - links (note: plural)
# - copy

# Note: there are no commas between values

# Source values
local -a src=(
    "aliases"
    "settings"
    "creds.private"
)

# Link values follow this format
# "<src>:<dest>"
#
# Note: _do not_ include path info in <src>
# Note: _do_ provide an absolute path for <dest>
local -a links=(
    "foorc:$HOME/.foorc"
)

# Copy values follow this format
# "<src>:<dest>"
#
# Note: _do not_ include path info in <src>
# Note: _do_ provide an absolute path for <dest>
local -a copy=(
    "foo_config:$HOME/.foo_config"
)
```


## Appendix

### Dotfiles Entry Points

> These files are located in `/dotfiles/*` and linked to your `$HOME` direcorty when install `dotfiles`.

__bash_profile__:

For this repo to work it has to manage / customize it's own `bash_profile`. Since you'll be forking this repo you're free to put whatever you like in `bash_profile` along with what's in there.

__dotfilesrc__:

This gets loaded _before everything else_. It's there should you need it.

### Auto-loaded Bin

For convenience dotfiles will add `dotfiles/bin` to your path so you can also store and version utilities you write. There's no magic here, just make sure anything you want to run in this dir is executable.

> For example: After `scripts/dotfiles.sh setup` or `scripts/install.sh` is run a symlink to `dotfiles` is created so you can reference the `dotfiles` cli globally.

### Private Files

Any file with a `*.private` extension are ignored by git.

Source actions are applied in order, so put any overrides you might have towards the bottom of the list.

<a name="why-should-i-fork"></a>
### Why Should I Fork?

You should fork because _that's how you use this repo_. If you're not versioning your own copy you're defeating the purpose. Additionally, the files in `pkg-available` are my personal files. I will most certainly tweak, remove, add, and otherwise modify this repo without any consideration for you. :skull:
