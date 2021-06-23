#!/bin/bash
HERE=$(cd $(dirname $0); pwd)
if [ ! -f $HOME/.zshrc ];then
  ln -s $HERE/.zshrc $HOME/.zshrc
fi
if [ ! -f $HOME/.zprofile ];then
  ln -s $HERE/.zprofile $HOME/.zprofile
fi
echo "created symbolic link to .zshrc, .zprofile"
touch $HOME/.zshrc.local
touch $HOME/.zprofile.local
echo "created .locals"
