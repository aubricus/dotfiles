# Web Starter Kit CLI

This repo incudes some optional scripts intended to make this repository useful beyond the initial download `+` copy and paste.

A basic set of utility scripts have been added to a small bash file named
`wsk.sh`.

## Prerequisites

Add execution permissions to this file:

```bash
chmod +x ./wsk.sh
```

## Usage

```bash
./wsk.sh <command_name>
```

## Commands

```text
build_dotfiles  build osx bashrc and other dotfiles
                (builds in ./dotfiles)
help            prints this message
```

## Build Dotfiles

> Use this command to rebuild the **dotfiles/** directory.

One way to make the Dotfiles feature _even more powerful_ is to [fork this repository]() and [version your own machine preferences]().

Inevitably the configuration on your machine will change over time and it's very helpful to have the current state of that configuration stored somewhere should you suddenly find yourself using an machine without configuration.

> This happens more than you might think. Often I've found myself setting up an alternate machine or a newly wiped machine after some catastrophic failure.

### Changing / Adding files

> See [Prefs README.md]() for more detailed info.

**Just changing a file?**

- Update the file you wish to change and save
- Run `./wsk.sh build_dotfiles`
- Run `cp -a ./dotfiles/* ~/`
> Or simply copy paste them into your home directory

**Added or Removed a file?**

> `*.pref` extentions are convention only but denote files intended for concatenation into `.bashrc`

- Open `./wsk.sh`
- If adding config for `.bashrc` add the file path to the `bashrc_prefs` list
- If adding any other dotfile add the file path to the `dotfiles` list
- Save `./wsk.sh`
- Run: `./wsk build_dotfiles`
- Run: `cp -a ./dotfiles/* ~/`

> **Note:** If you've removed a file you'll need to also remove it from your home directory.

