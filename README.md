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
cd dotfiles-new
```

## Usage

**Setup Steps**

|   # | Step                             | Details                                                                                                         |
| --: | :------------------------------- | :-------------------------------------------------------------------------------------------------------------- |
|   1 | Setup Macos Prefs                | See [macos/README.md](macos/README.md)                                                                          |
|   2 | Install Macos Updates            | See Fig. 2.0 – Install Macos Updates                                                                            |
|   3 | Install Brew                     | See Fig. 3.0 – Install Brew & Brewfile                                                                          |
|   4 | Link Iterm Prefs                 | Open General > Preferences & point it to [iterm/com.googlecode.iterm2.plist](iterm/com.googlecode.iterm2.plist) |
|   5 | Install Oh My ZSH and sync prefs | See Fig 5.0 – Install Oh My ZSH                                                                                 |
|   6 | Install NVM                      | See Fig 6.0 – Install NVM                                                                                       |
|   7 | Sync Git Prefs                   | See Fig 7.0 – Sync Git Prefs                                                                                    |
|   8 | Sync Vim Prefs                   | See Fig 8.0 – Sync Vim Prefs                                                                                    |
|   9 | Login to 1Password               | Open 1Password and use setup QR Code, see: <https://support.1password.com/secret-key/>                          |
|   9 | Login to 1Password CLI           | Type any valid 1Password CLI command, e.g. `os vault ls` and follow the prompts                                 |
|  10 | Login to GitHub CLI              | Type any valid GitHub CLI command, e.g. `gh browse`                                                             |
|  11 | Login to Shpoify CLI             | Run `shopify login`                                                                                             |
|  12 | Login to Heroku CLI              | Run `heroku login`                                                                                              |
|  13 | Setup VSCode Settings Sync       | See: <https://code.visualstudio.com/docs/editor/settings-sync> (Github, Select all)                             |
|  14 | Login to Slack Workspace(s)      | Open Slack & login to all desired workspaces                                                                    |
|  15 | Login to Chrome                  | Open Chrome and login to all desired profiles                                                                   |

<br>

**Fig 2.0 – Install Macos Updates**

```bash
bash macos/install.sh
```

**Fig 3.0 – Install Brew & Brewfile**

```bash
bash brew/install.sh
brew bundle --file brew/Brewfile
```

**Fig 5.0 – Install Oh My ZSH**

```bash
bash omzsh/install.sh
bash omzsh/sync.sh
```

**Fig 6.0 – Install NVM**

```bash
bash nvm/install.sh
```

**Fig 7.0 – Sync Git Prefs**

```bash
bash git/sync.sh
```

**Fig 8.0 – Sync Vim Prefs**

```bash
bash vim/sync.sh
```

## Contributing

PRs not accepted.

## License

Unlicensed
