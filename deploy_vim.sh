#!/bin/sh
if ! which vim >/dev/null 2>&1;then
  if which apt-get >dev/null 2>&1;then
    sudo apt-get install vim
  else
    echo "vim found"
  fi
fi

cd $HOME
if [ ! -d $HOME/dotfiles ];then
  git clone https://github.com/norisio/dotfiles.git
else
  echo "repository dotfiles found"
fi
ln -si $HOME/dotfiles/.vimrc
ln -si $HOME/dotfiles/.gvimrc

if [ ! -d $HOME/neobundle.vim ]; then
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
  sh ./install.sh
  rm ./install.sh
else
  echo "neobundle found"
fi
echo "created symbolic link to .(g)vimrc"
