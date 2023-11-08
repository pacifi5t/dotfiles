# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$XDG_DATA_HOME/oh-my-zsh

# Zsh history file
export HISTFILE=$XDG_STATE_HOME/zsh/history

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# Increase history size
export HISTSIZE=1000
export SAVEHIST=100000

# Append history incrementally
setopt incappendhistory

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Python, pip, venv shortcuts
alias vv='python -m venv .venv'
alias va='source .venv/bin/activate'
alias vd='deactivate'

# Other
alias dotfiles='cd $XDG_DATA_HOME/dotfiles'
alias cl='clear'
alias mc="echo \"We don't use it here :)\""
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

# To customize prompt, run `p10k configure` or edit .p10k.zsh.
p10k_path=$XDG_DATA_HOME/dotfiles/common/.config/zsh/.p10k.zsh
[[ ! -f $p10k_path ]] || source $p10k_path
