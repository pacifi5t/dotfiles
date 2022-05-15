# dotfiles

## Table of contents

- [Description](#description)
- [Migrating from bash](#migrating-from-bash)
- [Installing Oh My Zsh & plugins](#installing-oh-my-zsh--plugins)
- [Setup](#setup)

## Description

A repo with various config files with setup guide. Useful for Linux with `zsh` as shell or macOS (which includes `zsh` preinstalled). Setup guide includes installing Oh My Zsh that helps manage plugins & standartize installation process.

## Migrating from bash

Make sure you have `zsh` installed

```sh
zsh --version
```

Change your shell to `zsh`

```sh
chsh -s /bin/zsh
```

## Installing Oh My Zsh & plugins

Oh My Zsh itself

```zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

`zsh-syntax-highlighting` plugin

```zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

`powerlevel10k` theme

```zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Setup

Clone the repo into `~/.local/share` directory (or any other you'd like)

```sh
git clone git@gitlab.com:pacifi5t/dotfiles.git ~/.local/share/dotfiles
```

Make sure you have Python 3 installed

```sh
python3 --version
```

Run `setup` script

```sh
./setup
```
