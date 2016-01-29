#!/bin/sh
cd $HOME/dotfiles
if [ ! -f $HOME/.zshrc ];then
  ln -s `pwd`/.zshrc $HOME/.zshrc
fi
if [ ! -f $HOME/.zprofile ];then
  ln -s `pwd`/.zprofile $HOME/.zprofile
fi
echo "created symbolic link to .zshrc, .zprofile"
