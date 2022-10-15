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
export NPM_CONFIG_PREFIX=$HOME/.local
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history

# Linux specific variables
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # GnuPG home
  export GNUPGHOME=$XDG_DATA_HOME/gnupg

  # Fix mangohud for some OpenGL apps & games 
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

  # Vulkan SDK variables
  export VULKAN_SDK=~/Library/VulkanSDK/1.3.224.1/macOS
  export LIBRARY_PATH=$LIBRARY_PATH:$VULKAN_SDK/lib
  export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH:-}$VULKAN_SDK/lib
  export VK_ADD_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d
  export VK_ICD_FILENAMES=$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json
  export VK_DRIVER_FILES=$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json
fi
