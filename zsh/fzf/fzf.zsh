# fuzzy finder
# ref - https://github.com/junegunn/fzf
#
# helpful sources
# refs:
#   - https://github.com/junegunn/fzf/wiki/examples
#   - https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
#   - http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/

# <<<< completion >>>>

fzf_share="$(fzf-share)"

# Note: `$-` lists options set in current shell
# ref - https://stackoverflow.com/questions/5163144/what-are-the-special-dollar-sign-shell-variables
[[ $- == *i* ]] && {
  source "$fzf_share/completion.zsh" 2>/dev/null
}

# keybindings
source "$fzf_share/key-bindings.zsh"

# use `fd` for `**` path completion
# `$1` is the base path to start traversal
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# use `fd` for `**` directory completion
# `$1` is the base path to start traversal
_fzf_compgen_dir() {
  fd --type directory --hidden --follow --exclude ".git" . "$1"
}

# <<<< options >>>>

_fzf_preview_window="--preview-window=down:75%"
_fzf_preview_window_hidden="${_fzf_preview_window}:hidden"

export FZF_DEFAULT_OPTS="--height 50% --reverse --no-mouse --cycle --ansi \
 $_fzf_preview_window \
 --bind ctrl-space:toggle-preview,ctrl-e:preview-down,ctrl-d:preview-page-down,ctrl-y:preview-up,ctrl-u:preview-page-up,ctrl-a:select-all+accept"

_fzf_bat_preview="--preview='bat --style=numbers --color=always {}'"
export FZF_CTRL_T_OPTS="$_fzf_bat_preview $_fzf_preview_window_hidden"
export FZF_EDIT_OPTS="$_fzf_bat_preview"


# <<<< commands >>>>

export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# <<<< keybindings >>>>
# NOTE: corresponding widgets defined in `$DOTFILES/functions/_fzf_functions` &
# `$fzf_share/key-bindings.zsh`

# << zsh functions -> widgets >>
zle -N fzf-edit-widget
