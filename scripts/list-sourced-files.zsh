#! zsh
zsh -lixc exit 2>&1 | sed -nE  's/^\+.*> (source|\.) //p'
