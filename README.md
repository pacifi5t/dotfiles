# dotfiles

## Table of contents

- [Description](#description)
- [Migrating from bash](#migrating-from-bash)
- [Setup](#setup)
- [Installing Oh My Zsh & plugins](#installing-oh-my-zsh--plugins)

## Description

A repo with various config files with setup guide. Useful for Linux with `zsh` as shell or macOS (which includes `zsh` preinstalled). Setup guide includes installing Oh My Zsh that helps manage plugins & standartize installation process.

## Migrating from bash

Change your shell to `zsh`

```bash
chsh -s /bin/zsh
```

Remove `.bashrc` (having it your `home` directory can cause some bugs)

```bash
rm ~/.bashrc
```

Reboot your system

## Setup

Clone the repo into `~/.local/share` directory

```zsh
git clone git@github.com:pacifi5t/dotfiles.git ~/.local/share/dotfiles
```

Remove existing files

```zsh
rm -f ~/.zshrc
rm -f ~/.gitconfig
rm -f ~/.p10k.zsh
```

Create symbolic links for `.zshrc` & other configs

```zsh
ln -s ~/.local/share/dotfiles/.zshrc ~/.zshrc
ln -s ~/.local/share/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.local/share/dotfiles/.p10k.zsh ~/.p10k.zsh
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
