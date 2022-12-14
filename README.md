# Dotfiles

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

A simple repo to keep my machine setup and preferences centeralized and documented.

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Install

```bash
git clone https://github.com/aubricus/dotfiles.work
cd dotfiles.work
```

- NOTE: If this is a private repo you'll need to log in to Github first.

## Usage

> All scripts are meant to be run from the project root!

2. Manual Mac Setup (see [macos/README.md](./macos/README.md))
3. Run `bash macos/install.sh`
4. [Download & install Chrome](https://www.google.com/chrome/) (Note: `brew` based install is not secure, see notes in [Brewfile](./brew/Brewfile))
5. Install `brew` and run `Brewfile`

```bash
# Run basic install...
bash brew/install.sh

# Temporary setup needed to run Brewfile.
#   NOTE: This will be overwritten when we sync ZSH prefs.
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Run Brewfile
bash brew/sync.sh
```

5. Link Iterm prefs. Open General → Preferences and point it to [iterm/com.googlecode.iterm2.plist](./iterm/com.googlecode.iterm2.plist)
6. Install & setup OMZSH / ZSH

```bash
# Install OMZSH
bash omzsh/install.sh

# Confirm all prompts
bash omzsh/sync.sh
```

7. Install NVM run `bash nvm/install.sh`
8. Install Python

```bash
# See available versions
# NOTE: `pyenv` is installed with the Brewfile
pyenv install -l

# Select a version, like 3.11.1, to install and run
pyenv install 3.11.1

# Set global version of Python
pyenv global 3.11.1
```

9. Install `virtualenv`, run `bash virtualenv/install.sh`
10. Install `poetry`, run `bash poetry/install.sh`
11. Sync `git` prefs, run `bash git/sync.sh`. Note `git` is installed with the [Brewfile](./brew/Brewfile))
12. Sync `vim` prefs, run `bash vim/sync.sh`
13. Setup VSCode settings: [docs/editor/settings-sync](https://code.visualstudio.com/docs/editor/settings-sync) (Github, Select all)

### Misc

1. Open 1Password and use setup QR Code, see: <https://support.1password.com/secret-key/>
2. Open Slack & login to all desired workspaces
3. Open Chrome and login to all desired profiles
4. Login to `gh`, run `gh browse`.
5. Login to Shopify `shopify2`, run `shopify2 login`
6. Login to `heroku`, run `heroku login`

## Contributing

PRs not accepted.

## License

None

## Apendix

### Symlink `shopify2` to `shopify`

```bash
# Copy the output into your clipboard
which shopify2

# Will output something like
/opt/homebrew/bin/shopify2

# Go to that directory
# Paste the path from before and remove shopify2
cd /opt/homebrew/bin/

# Next, create a symlink
# Remember to use the path you copied before
# For the second part of the symlink, change shopify2 to shopify
ln -s /opt/homebrew/bin/shopify2 /opt/homebrew/bin/shopify
```
