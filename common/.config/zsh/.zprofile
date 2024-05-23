# Initialize Homebrew if it's executable exists
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  # Set PATH, MANPATH, etc., for Homebrew.
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # Add Homebrew-managed Zsh completions
  export FPATH=$FPATH:$(brew --prefix)/share/zsh/site-functions
fi

# Initialize pyenv
eval "$(pyenv init - 2> /dev/null)"
