# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "romkatv/powerlevel10k"

# Load and initialise completion system
autoload -Uz compinit
compinit

WORDCHARS=''

# [UpArrow] - search history up
bindkey '^[[A' history-substring-search-up
# [DownArrow] - search history down
bindkey '^[[B' history-substring-search-down

# [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey '^[[1;5D' backward-word

# Aliases

# Python, pip, venv creation & activation
alias python='python3'
alias pip='pip3'
alias vv='python -m venv .venv'
alias va='source .venv/bin/activate'

# Other
alias dotfiles='cd $XDG_DATA_HOME/dotfiles'
alias cl='clear'
alias mc="echo \"We don't use it here :)\""
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

# To customize prompt, run `p10k configure` or edit .p10k.zsh.
p10k_path=$XDG_DATA_HOME/dotfiles/common/.config/zsh/.p10k.zsh
[[ ! -f $p10k_path ]] || source $p10k_path
