#!/usr/bin/env zsh

brew_prefix=$(brew --prefix)

asdf_initialization="$brew_prefix/opt/asdf/asdf.sh"
[ -f "$asdf_initialization" ] && source "$asdf_initialization"
unset asdf_initialization
