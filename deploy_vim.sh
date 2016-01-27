#!/bin/sh
if ! which git >/dev/null 2>&1;then
  if which apt-get >dev/null 2>&1;then
    echo "Installing git..."
    sudo apt-get install git -y
  else
    echo "not found git but couldn't install."
  fi
else
  echo "git found"
fi


if ! which vim >/dev/null 2>&1;then
  if which apt-get >dev/null 2>&1;then
    echo "Installing vim..."
    sudo apt-get install vim -y
  else
    echo "not found vim but couldn't install."
  fi
else
  echo "vim found"
fi

cd $HOME
if [ ! -d $HOME/dotfiles ];then
  echo "Cloning dotfiles repository..."
  git clone https://github.com/norisio/dotfiles.git
else
  echo "repository dotfiles found"
fi
ln -si $HOME/dotfiles/.vimrc
ln -si $HOME/dotfiles/.gvimrc

if [ ! -d $HOME/neobundle.vim ]; then
  echo "Installing Neobundle..."
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh 2>/dev/null
  sh ./install.sh
  rm ./install.sh
else
  echo "neobundle found"
fi
