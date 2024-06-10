# dotfiles

A repo with various config files with setup guide. Useful for Linux with `zsh` as shell or macOS (which includes `zsh` preinstalled).

## Setup

### Zsh as a default shell

Make sure you have `zsh` installed

```sh
zsh --version
```

Change your login shell to `zsh`

```sh
chsh -s /bin/zsh
```

Change Zsh config directory by defining `ZDOTDIR` at the top of `/etc/zsh/zshenv` (or `/etc/zshenv` for some systems)

```sh
export ZDOTDIR=$HOME/.config/zsh
...
```

### Oh My Zsh

Install Oh My Zsh by running the snippet below. The `ZSH` variable specifies where Oh My Zsh will be installed.

```sh
export ZSH=$HOME/.local/share/oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Oh My Posh

Install Oh My Posh by running the snippet below. You can choose any directory listed in the `PATH` variable instead of `$HOME/.local/bin`. The installer may prompt you to install some dependencies if they aren't installed yet.

```sh
curl -s https://ohmyposh.dev/install.sh | sh -s -- -d $HOME/.local/bin
```

### Linking the dotfiles

Clone this repo into `$HOME/.local/share/dotfiles` directory and change your current directory to it

```sh
git clone https://github.com/pacifi5t/dotfiles $HOME/.local/share/dotfiles
cd $HOME/.local/share/dotfiles
```

> [!NOTE]
> You can use any directory you want, but you must export `DOTFILES_HOME` environment variable. Otherwise, the script `link-files.py` that creates symlinks for files will assume that dotfiles are in `$HOME/.local/share/dotfiles` directory.
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

Run the `link-files.py` script

```sh
python3 scripts/link-files.py
```
