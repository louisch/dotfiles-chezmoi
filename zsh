if [[ ! $SHELL == *zsh* ]]; then
  chsh -s /usr/bin/zsh
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$::g')"
