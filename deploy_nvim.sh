#!/bin/bash
HERE=$(cd $(dirname $0); pwd)

XDG_NVIM_DIR=$HOME/.config/nvim
mkdir -p $XDG_NVIM_DIR
echo "created $XDG_NVIM_DIR"

ln -s $HERE/init.vim $XDG_NVIM_DIR/init.vim
echo "created symbolic link to init.vim"
ln -s $HERE/nvim-plugins.toml $XDG_NVIM_DIR/nvim-plugins.toml
echo "created symbolic link to nvim-plugins.toml"
ln -s $HERE/nvim-plugins-lazy.toml $XDG_NVIM_DIR/nvim-plugins-lazy.toml
echo "created symbolic link to nvim-plugins-lazy.toml"
