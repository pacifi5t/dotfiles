# dotfiles

A repo with various config files with setup guide. Useful for Linux with `zsh` as shell or macOS (which includes `zsh` preinstalled).

## Setup

### Migrating from bash

Make sure you have `zsh` installed

```sh
zsh --version
```

Change your shell to `zsh`

```sh
chsh -s /bin/zsh
```

Change Zsh config directory by defining ZDOTDIR at `/etc/zsh/zshenv` (or `/etc/zshenv` for some systems)

```sh
sudo sh -c "echo 'export ZDOTDIR=\$HOME/.config/zsh' >> /etc/zsh/zshenv"
```

### Installing Oh My Zsh & plugins

Oh My Zsh

```zsh
ZSH=$HOME/.local/share/oh-my-zsh sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

`zsh-syntax-highlighting` plugin

```zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

`powerlevel10k` prompt

```zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Link the dotfiles

Clone the repo into `~/.local/share` directory (or any other you'd like)

```sh
git clone https://github.com/pacifi5t/dotfiles ~/.local/share/dotfiles
```

Make sure you have Python 3 installed

```sh
python3 --version
```

Run `setup` script

```sh
./setup
```
