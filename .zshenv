export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# Gradle home dir
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

# Rust devtools
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export PATH=$PATH:$CARGO_HOME/bin

# Flutter SDK
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=$PATH:$HOME/Library/Flutter/bin
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export PATH=$PATH:"$XDG_DATA_HOME"/flutter/bin
fi
export PATH=$PATH:$HOME/.pub-cache/bin

# vcpkg main dir
export VCPKG_ROOT="$XDG_DATA_HOME"/vcpkg

# Node REPL history file
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

# Linux specific files
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # GnuPG home
  export GNUPGHOME="$XDG_DATA_HOME"/gnupg

  # Default Wine prefix
  export WINEPREFIX="$XDG_DATA_HOME"/wine

  # GTK2 config
  export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
fi
