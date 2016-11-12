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

## What's inside?

Lots. All likely incompatible with your system, hardware, or workflow. The main purpose of this repo is to create a flexible system to easily manage settings. Personally, I use it to sync settings between my work and personal machines.

> You can take a look at what's here if you like; everything is in `pkg-available/`.

__Want to start from scratch?__

Just fork this repo and empty out `pkg-available`. That's it!

## Installation

> TODO: Write

## Features

- Organizes system settings and prefs into a single, version-controlled (git) location.
- Provides conventions to store settings in discrete packages.
- Robust command-line to manage packages and settings.
- Auto-loaded / versioned `/bin` for small scripts / utils.
- Allows private / local settings.
- Decent console output. 👾

## Command-Line

```text
Dotfiles - Aubrey Taylor - http://github.com/aubricus/dotfiles

Usage:
    dotfiles (-h | --help)
    dotfiles <command>
    dotfiles add <package_name>
    dotfiles rm <package_name>
    dotfiles link <package_name> <entry_name>
    dotfiles copy <package_name> <entry_name>
    dotfiles run <pakcage_name> <script_name>
    dotfiles path <package_name> <entry_name>

Commands:
    setup           Run setup
    add             Add a package
    remove          Remove a package
    copy            [Re]Copy a file from a package
    link            [Re]Link a file from a package
    run             [Re]Run a file from a package
    path            Get absolute path to package file (see Examples)
    all             Install all available pacakges
    none            Uninstall all enabled packages

Options:
    -h, --help      Print this help message

Examples:
    source $(dotfiles path foo bar)
```

## Packages

Packages allow us to organize set of preferences into a single unit.`dotfiles` only requies a small amount of info about how to act on a package.

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

There are 5 main package actions:

1. ~~__init__: perform any upfront work when a package is enabled.~~
2. __link__: symlink a file(s)
3. __copy__: copy a file(s)
4. __source__: source a file*
4. __run__: run a script
5. ~~__deinit__: perform any cleanup work when a package is disabled.~~

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
# Note: do not include path info in <src>
# Note: provide an absolute path for <dest>
local -a links=(
    "foorc:$HOME/.foorc"
)

# Copy values follow this format
# "<src>:<dest>"
#
# Note: do not include path info in <src>
# Note: provide an absolute path for <dest>
local -a copy=(
    "foo_config:$HOME/.foo_config"
)
```

~~### Other package scripts:~~

- ~~`init.sh`: Run when a package is enabled.~~
- ~~`deinit.sh`: Run when a package is disabled.~~

~~You can put what ever you like in these files, however; `init.sh` is intended for preparing / installing deps and `deinit.sh` is intended to clean up what happened in `init.sh`.~~


## Dotfiles Entry Points

> These files are located in `/dotfiles/*` and linked to your `$HOME` direcorty when install `dotfiles`.

__bash_profile__:

For this repo to work it has to manage / customize it's own `bash_profile`. Since you'll be forking this repo you're free to put whatever you like in `bash_profile` along with what's in there.

__dotfilesrc__:

This gets loaded _before everything else_. It's there should you need it.

## Auto-loaded Bin

For convenience dotfiles will add `dotfiles/bin` to your path so you can also store and version utilities you write. There's no magic here, just make sure anything you want to run in this dir is executeable.

> After `scripts/dotfiles.sh setup` is run a symlink to `dotfiles` is created so you can reference the `dotfiles` cli globally.

## Private Files

Any file with a `*.private` extension are ignored by git.

Source actions are applied in order, so put any overrides you might have towards the bottom of the list.
