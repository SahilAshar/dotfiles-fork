#!/usr/bin/env zsh

typeset -U path

if is_mac; then
  path=("/usr/local/bin" $path)
elif is_linux; then
  path=("/home/linuxbrew/.linuxbrew/bin" $path)
fi

if [[ -d "$HOME/.cargo" ]]; then
  path=("$HOME/.cargo/bin" $path)
fi

if is_mac && [[ -d "/Applications/Visual Studio Code.app" ]]; then
  path=("/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $path)
fi

if [[ -z "$GOPATH" ]]; then
  path=("$GOPATH/bin" $path)
fi
