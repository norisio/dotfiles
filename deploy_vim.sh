#!/bin/sh
cd $HOME/dotfiles
if [ ! -f $HOME/.vimrc ];then
  ln -s ./.vimrc $HOME/.vimrc
fi
if [ ! -f $HOME/.gvimrc ];then
  ln -s ./.gvimrc $HOME/.gvimrc
fi
if [ ! -d $HOME/neobundle.vim ]; then
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
  sh ./install.sh
  rm ./install.sh
fi
echo "created symbolic link to .(g)vimrc"
