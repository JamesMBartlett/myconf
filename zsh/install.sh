#!/bin/bash
if [[ ! -d "$HOME/.oh-my-zsh" ]]
then
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ -f "$HOME/.zshrc" ]; then
  cp $HOME/.zshrc zshrc.old
fi

cp zshrc $HOME/.zshrc

# Install fzf.
if [[ ! -d "$HOME/.fzf" ]]
then
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
fi
