#!/bin/sh
cd $HOME/dotfiles
if [ ! -f $HOME/.zshrc ];then
  ln -s ./.zshrc $HOME/.zshrc
fi
if [ ! -f $HOME/.zprofile ];then
  ln -s ./.zprofile $HOME/.zprofile
fi
echo "created symbolic link to .zshrc, .zprofile"
