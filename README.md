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

```sh
export ZSH=$HOME/.local/share/oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

`zsh-syntax-highlighting` plugin

```sh
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-syntax-highlighting
```

`powerlevel10k` prompt

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$ZSH/custom}/themes/powerlevel10k
```

### Link the dotfiles

Clone this repo into `$HOME/.local/share/dotfiles` directory and change your current directory to it

```sh
git clone https://github.com/pacifi5t/dotfiles $HOME/.local/share/dotfiles
cd $HOME/.local/share/dotfiles
```

> [!NOTE]
> You can use any directory you want, but you must export `DOTFILES_HOME` environment variable. Otherwise, the script `link_files.py` that creates symlinks for files will assume that dotfiles are in `$HOME/.local/share/dotfiles` directory.
>
> ```sh
> export DOTFILES_HOME=/your/custom/path
> git clone https://github.com/pacifi5t/dotfiles $DOTFILES_HOME
> ...
> ```
>
> Don't forget to change `DOTFILES_HOME` variable in `common/.config/zsh/.zshenv`!

Make sure you have Python 3 installed

```sh
python3 --version
```

Run the `link_files.py` script

```sh
python3 scripts/link_files.py
```
