#!/bin/bash

source ~/etc/git-completion.bash
source ~/etc/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

red="\[\033[0;31m\]"
green="\[\033[0;32m\]"
yellow="\[\033[0;33m\]"
blue="\[\033[0;34m\]"
magenta="\[\033[0;35m\]"
cyan="\[\033[0;36m\]"
white="\[\033[0;37m\]"

PS1="$green\u $white| $red\h $white| $cyan\t $white| $magenta\W\$(__git_ps1) $white\$ "
