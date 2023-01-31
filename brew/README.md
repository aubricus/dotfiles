# Brew Dotfiles

[← Back to README](../README.md#usage)

## Install

**Install [Brew](https://brew.sh/)**

```bash
bash brew/install.sh
```

**Temporarily add Brew prefs to ZSH**

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
```

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## Usage

**Run [Brewfile](./Brewfile)**

```bash
bash brew/sync.sh
```

## Contributing

N/A

## License

None
