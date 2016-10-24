#!/bin/sh
DIR=`pwd`
if ! which git >/dev/null 2>&1;then
  if which apt >/dev/null 2>&1;then
    echo "Installing git..."
    sudo apt install git -y
  else
    echo "not found git but couldn't install."
  fi
else
  echo "git found"
fi


if ! which vim >/dev/null 2>&1;then
  if which apt >/dev/null 2>&1;then
    echo "Installing vim..."
    sudo apt install vim -y
  else
    echo "not found vim but couldn't install."
  fi
else
  echo "vim found"
fi

if ! which curl >/dev/null 2>&1;then
  if which apt >/dev/null 2>&1;then
    echo "Installing vim..."
    sudo apt install curl -y
  else
    echo "not found curl but couldn't install."
  fi
else
  echo "curl found"
fi

cd $DIR
ln -si $DIR/.vimrc $HOME/.vimrc
ln -si $DIR/.gvimrc $HOME/.gvimrc

if [ ! -d $HOME/.vim ]; then
echo "Creating .vim directory..."
mkdir $HOME/.vim
echo "Creating vimbackup directory..."
mkdir $HOME/vimbackup
fi

if [ ! -d $DIR/neobundle.vim ]; then
  echo "Installing Neobundle..."
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh 2>/dev/null
  sh ./install.sh
  rm ./install.sh
else
  echo "neobundle found"
fi
