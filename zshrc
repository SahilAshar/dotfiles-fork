#!/bin/zsh

# ZSH Plugins
plugins=(git)

export ZSH="/Users/alexweiss/.oh-my-zsh"

source ~/dotfiles/colors

# ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

setopt PROMPT_SUBST
source ~/dotfiles/prompt

unalias -m '*'
source ~/dotfiles/alias

