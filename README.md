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
git clone https://github.com/aubricus/dotfiles-new
cd dotfiles
```

## Usage

### 1.0 Setup Macos

**1.1 Manual Setup**
See [macos/README.md](macos/README.md)

**1.2 Install other required software**

```bash
bash macos/install.sh
```

### 2.0 Install Brew & Brewfile

```bash
bash brew/install.sh
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/aubricus/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew tap Homebrew/bundle
brew bundle --file brew/Brewfile.[work|personal]
```

### 3.0 Link Iterm Prefs

**Open General** → **Preferences** and point it to [iterm/com.googlecode.iterm2.plist](iterm/com.googlecode.iterm2.plist)

### 4.0 Setup CLI

**4.1 Setup Oh My ZSH**

```bash
bash omzsh/install.sh
bash omzsh/sync.sh
```

**4.2 Install NVM**

```bash
bash nvm/install.sh
```

**4.3 Install Poetry & virtualenv**

> You may need to use pyenv to install Python

```bash
bash poetry/install.sh
bash virtualenv/install.sh
```

Notes 7/31: poetry install failed for some reason

**4.4 Sync Git Prefs**

```bash
bash git/sync.sh
```

**4.5 Sync Vim Prefs**

```bash
bash vim/sync.sh
```

### 5.0 Misc. Setup

**5.1 Setup VSCode settings sync**

See: <https://code.visualstudio.com/docs/editor/settings-sync> (Github, Select all)

**5.2 Login to 1Password**

Open 1Password and use setup QR Code, see: <https://support.1password.com/secret-key/>

**5.3 Login to Slack workspace(s)**

Open Slack & login to all desired workspaces 

**5.4 Login to Chrome profile(s)**

Open Chrome and login to all desired profiles.

**5.5 Login to 1Password CLI**

* Open the terminal and run any valid 1Password CLI command, e.g. `op vault ls` and follow the prompts (add account manually).
* Once completed, you can restart the session and run this alias to sign-in `opsignin`.

**5.6 Login to GitHub CLI**

Open the terminal and run any valid GitHub CLI command, e.g. `gh browse`.

**5.7 Login to Shopify CLI** (Work only)

Open the terminal and run `shopify login`.

**5.8 Login to Heroku CLI** (Work only)

Open the terminal and run `heroku login`.



## Contributing

PRs not accepted.

## License

Unlicensed
