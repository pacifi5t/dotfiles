# Path to your oh-my-zsh installation.
export ZSH=$XDG_DATA_HOME/oh-my-zsh

# Change the auto-update behavior
zstyle ':omz:update' mode disabled # other values: auto, reminder

# Prompt customization
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [[ "$TTY" == "/dev/tty"* && "$OSTYPE" == "linux-"* ]]; then
  eval "$(oh-my-posh init zsh --config ${XDG_CONFIG_HOME}/oh-my-posh/tty.json)"
else
  eval "$(oh-my-posh init zsh --config ${XDG_CONFIG_HOME}/oh-my-posh/default.json)"
fi

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=()

custom-plugin() {
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

# Preferred editors for local and remote sessions in order of priority
editors=(nvim helix hx vim micro vi nano)
for editor in ${editors[@]}; do
  if [[ $(command -v $editor) ]]; then
    export EDITOR=$editor
    unset editor
    break
  fi
done

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
