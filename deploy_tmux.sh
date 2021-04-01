#!/bin/bash
HERE=$(cd $(dirname $0); pwd)

ln -s $HERE/.tmux.conf $HOME/.tmux.conf
echo "created symbolic link to .tmux.conf"

touch $HOME/.tmux.conf.local
echo "created .tmux.conf.local"
