# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add Homebrew-managed Zsh completions
export FPATH=$FPATH:$(brew --prefix)/share/zsh/site-functions
