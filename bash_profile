#!/bin/bash

export PYTHONPATH="/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python:/Library/Python/2.7/site-packages:/usr/.local/lib/python2.7/site-packages:$PYTHONPATH"
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

VIM_PATH=/usr/local/Cellar/vim/8.0.0596/bin
SCALA_PATH="/usr/local/share/scala/bin"

PATH=$SCALA_PATH:$PATH
PATH=$VIM_PATH:$PATH
export PATH

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

source ~/dotfiles/bashrc

