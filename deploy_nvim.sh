#!/bin/bash
HERE=$(cd $(dirname $0); pwd)

XDG_NVIM_DIR=$HOME/.config/nvim
mkdir -p $XDG_NVIM_DIR
echo "created $XDG_NVIM_DIR"


function link() {
    ln -s "$HERE/$1" "$XDG_NVIM_DIR/$1"
    echo "created symbolic link to $1"
}

link init.lua
link lua
