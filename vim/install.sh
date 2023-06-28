#!/bin/bash

if [[ ! -f "$HOME/.vim/autoload/plug.vim" ]]
then
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ -f "$HOME/.vimrc" ]; then
  cp ~/.vimrc ./vimrc.old
fi
cp ./vimrc ~/.vimrc

mkdir -p ~/.vim/autoload/
cp autoload/*.vim ~/.vim/autoload

mkdir -p ~/.vim/scripts/
cp scripts/* ~/.vim/scripts/

mkdir -p ~/.vim/ftplugin
cp langs/*.vim ~/.vim/ftplugin/

mkdir -p ~/.vim/after/ftplugin
cp langs/after/*.vim ~/.vim/after/ftplugin
