# Title

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

**1.2 Install required software**

```bash
bash macos/install.sh
```

### 2.0 Install Brew & Brewfile

```bash
bash brew/install.sh
brew bundle --file brew/Brewfile
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

**4.3 Install Poetry**

> You may need to use pyenv to install Python

```bash
bash poetry/install.sh
```


**Setup Steps**

|   # | Step                             | Details                                                                                                         |
| --: | :------------------------------- | :-------------------------------------------------------------------------------------------------------------- |
|   1 | Setup Macos Prefs                | See [macos/README.md](macos/README.md)                                                                          |
|   2 | Install Macos Updates            | See Fig. 2.0 – Install Macos Updates                                                                            |
|   3 | Install Brew                     | See Fig. 3.0 – Install Brew & Brewfile                                                                          |
|   4 | Link Iterm Prefs                 | Open General > Preferences & point it to [iterm/com.googlecode.iterm2.plist](iterm/com.googlecode.iterm2.plist) |
|   5 | Install Oh My ZSH and sync prefs | See Fig 5.0 – Install Oh My ZSH                                                                                 |
|   6 | Install NVM                      | See Fig 6.0 – Install NVM                                                                                       |
|   7 | Install Poetry                   | See Fig 7.0 – Install Poetry
|   8 | Sync Git Prefs                   | See Fig 8.0 – Sync Git Prefs                                                                                    |
|   9 | Sync Vim Prefs                   | See Fig 9.0 – Sync Vim Prefs                                                                                    |
|   10 | Login to 1Password               | Open 1Password and use setup QR Code, see: <https://support.1password.com/secret-key/>                          |
|   11 | Login to 1Password CLI           | Type any valid 1Password CLI command, e.g. `os vault ls` and follow the prompts                                 |
|  12 | Login to GitHub CLI              | Type any valid GitHub CLI command, e.g. `gh browse`                                                             |
|  13 | Login to Shpoify CLI             | Run `shopify login`                                                                                             |
|  14 | Login to Heroku CLI              | Run `heroku login`                                                                                              |
|  15 | Setup VSCode Settings Sync       | See: <https://code.visualstudio.com/docs/editor/settings-sync> (Github, Select all)                             |
|  16 | Login to Slack Workspace(s)      | Open Slack & login to all desired workspaces                                                                    |
|  17 | Login to Chrome                  | Open Chrome and login to all desired profiles                                                                   |

<br>




**Fig 6.0 – Install NVM**




**Fig 8.0 – Sync Git Prefs**

```bash
bash git/sync.sh
```

**Fig 9.0 – Sync Vim Prefs**

```bash
bash vim/sync.sh
```

## Contributing

PRs not accepted.

## License

Unlicensed
