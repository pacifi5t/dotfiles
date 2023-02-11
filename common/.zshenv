export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# Gradle home dir
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle

# Rust devtools
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CARGO_HOME=$XDG_DATA_HOME/cargo
export PATH=$PATH:$CARGO_HOME/bin

# Flutter SDK
export PATH=$PATH:$XDG_DATA_HOME/flutter/bin
export PATH=$PATH:$HOME/.pub-cache/bin

# vcpkg main dir
export VCPKG_ROOT=$XDG_DATA_HOME/vcpkg

# Node & npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history

# Python
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/pythonrc

# less history
export LESSHISTFILE=$XDG_DATA_HOME/less/history

# Linux specific variables
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # GnuPG home
  export GNUPGHOME=$XDG_DATA_HOME/gnupg

  # Enable MangoHud globally (only Vulkan) & fix MangoHud for OpenGL
  export MANGOHUD=1
  export MANGOHUD_DLSYM=1

  # GTK2 config
  export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
fi

# macOS specific variables
if [[ "$OSTYPE" == "darwin"* ]]; then
  # adb for Android
  export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools

  # Path for libraries installed with Homebrew
  export LIBRARY_PATH=${LIBRARY_PATH:-}/opt/homebrew/lib
fi

# Local environment for a specific machine (invisible for git)
source $XDG_DATA_HOME/dotfiles/common/.localenv 2> /dev/null
