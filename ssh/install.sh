config_file=$DOTFILES/ssh/config.`hostname`
if [ -f "$config_file" ]; then
  if [ -L ~/.ssh/config ]; then
    rm ~/.ssh/config
  elif [ -f ~/.ssh/config ]; then
    mv ~/.ssh/config ~/.ssh/config_backup
  fi

  ln -s "$config_file" ~/.ssh/config
fi
