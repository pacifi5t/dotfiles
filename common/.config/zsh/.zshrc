# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit snippet OMZL::compfix.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::key-bindings.zsh

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

autoload -Uz compinit && compinit

# History configuration
HISTFILE="${XDG_STATE_HOME}/zsh/history"
setopt inc_append_history

# Completion styling
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Prompt customization
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [[ "$TTY" == "/dev/tty"* && "$OSTYPE" == "linux-gnu"* ]]; then
  PS1='%F{cyan}%~%f %# '
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# Python, pip, venv shortcuts
alias vv='python -m venv .venv'
alias va='source .venv/bin/activate'
alias vd='deactivate'

# Other
alias ls='ls -G'
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias rr='ranger'
alias lg='lazygit'
alias ff='fastfetch'

# Initialize pyenv
eval "$(pyenv init - 2> /dev/null)"

# Other options
setopt interactive_comments
setopt long_list_jobs

# To customize prompt, run `p10k configure` or edit .p10k.zsh.
[[ ! -f "${ZDOTDIR}/.p10k.zsh" ]] || source "${ZDOTDIR}/.p10k.zsh"
