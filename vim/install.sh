#!/bin/bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -f "$HOME/.vimrc" ]; then
  cp ~/.vimrc ./vimrc.old
fi
cp ./vimrc ~/.vimrc

mkdir -p ~/.vim/ftplugin
cp langs/* ~/.vim/ftplugin/
