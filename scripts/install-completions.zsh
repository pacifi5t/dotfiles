#! zsh

completions=$ZSH/completions
mkdir $completions 2> /dev/null

msg () {
  echo "${1} completions has been installed."
}

if [[ -x "$(command -v rustup)" ]]; then
  rustup completions zsh rustup > $completions/_rustup
  rustup completions zsh cargo > $completions/_cargo
  msg 'rustup & cargo'
fi

if [[ -x "$(command -v vcpkg)" && ! -z $VCPKG_ROOT ]]; then
  cat "${VCPKG_ROOT}/scripts/vcpkg_completion.zsh" > $completions/_vcpkg
  msg 'vcpkg'
fi
