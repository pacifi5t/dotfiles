# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$XDG_DATA_HOME/oh-my-zsh

# Change the auto-update behavior
zstyle ':omz:update' mode disabled  # other values: auto, reminder

# Prompt customization
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [[ "$TTY" == "/dev/tty"* && "$OSTYPE" == "linux-gnu"* ]]; then
  PROMPT='%F{cyan}%~%f %# '
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=()

custom-plugin () {
  local name="$(basename $1)"
  local plugin_path="$ZSH/custom/plugins/$name"
  if [[ ! -d "$plugin_path" ]]; then
    echo "Plugin $name not found. Downloading..."
    git clone --quiet --depth 1 https://github.com/${1}.git $plugin_path
  fi
  plugins+=($name)
}

custom-plugin zsh-users/zsh-syntax-highlighting
custom-plugin zsh-users/zsh-completions

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# Zsh history file
HISTFILE="$XDG_STATE_HOME/zsh/history"
if [[ ! -f "$HISTFILE" ]]; then
  mkdir -p $(dirname $HISTFILE)
  touch $HISTFILE
fi

# Increase history size
HISTSIZE=10000
SAVEHIST=100000

# Append history incrementally
setopt inc_append_history

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Python, pip, venv shortcuts
alias vv='python -m venv .venv'
alias va='source .venv/bin/activate'
alias vd='deactivate'

# Other
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias rr='ranger'
alias lg='lazygit'
alias ff='fastfetch'

# Initialize pyenv
eval "$(pyenv init - 2> /dev/null)"

# To customize prompt, run `p10k configure` or edit .p10k.zsh.
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source $ZDOTDIR/.p10k.zsh
