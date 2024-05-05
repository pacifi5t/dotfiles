export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# dotfiles home dir
export DOTFILES_HOME=$HOME/.local/share/dotfiles

# Local binaries
export PATH=$PATH:$HOME/.local/bin

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
export PYENV_ROOT=$XDG_DATA_HOME/pyenv
export PATH=$PATH:$PYENV_ROOT/bin
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/pythonrc
export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
export KERAS_HOME=$XDG_STATE_HOME/keras
export PIPX_HOME=$XDG_DATA_HOME/pipx

# RenPy saves directory
export RENPY_PATH_TO_SAVES=$XDG_DATA_HOME/renpy

# less history
export LESSHISTFILE=$XDG_DATA_HOME/less/history

# ccache dir
export CCACHE_DIR=$XDG_CACHE_HOME/ccache

# PostgreSQL
export PSQL_HISTORY=$XDG_DATA_HOME/psql_history

# AWS CLI
export AWS_SHARED_CREDENTIALS_FILE=$XDG_CONFIG_HOME/aws/credentials
export AWS_CONFIG_FILE=$XDG_CONFIG_HOME/aws/config

# Linux specific variables
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # GnuPG home
  export GNUPGHOME=$XDG_DATA_HOME/gnupg

  # Enable MangoHud globally (only Vulkan) & fix MangoHud for OpenGL
  export MANGOHUD=1
  export MANGOHUD_DLSYM=1

  # GTK2 config
  export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc

  # Rust std library path
  export LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$XDG_DATA_HOME/rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib
fi

# macOS specific variables
if [[ "$OSTYPE" == "darwin"* ]]; then
  # adb for Android
  export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools

  # Path for libraries installed with Homebrew
  export LIBRARY_PATH=${LIBRARY_PATH:+$LIBRARY_PATH:}/opt/homebrew/lib

  # CocoaPods
  export CP_HOME_DIR=$XDG_DATA_HOME/cocoapods

  # Matplotlib config dir
  export MPLCONFIGDIR=$XDG_CONFIG_HOME/matplotlib

  # Rust std library path
  export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH:+$DYLD_LIBRARY_PATH:}$XDG_DATA_HOME/rustup/toolchains/stable-aarch64-apple-darwin/lib
fi
