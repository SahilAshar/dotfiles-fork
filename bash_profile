source ~/.bashrc

export PYTHONPATH="/usr/.local/lib/python2.7/site-packages:$PYTHONPATH"
export SCALAPATH="/usr/local/share/scala"
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

NODE_PATH=/usr/local/lib/node_modules

export ANDROID_HOME="~/Library/Android/sdk"
export PATH=$PATH:$SCALAPATH/bin

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

alias cd="cd -P"
alias back='cd "$OLDPWD"'
alias wifioff='networksetup -setairportpower en0 off'
alias wifion='networksetup -setairportpower en0 on'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gdc='git diff --cached'

