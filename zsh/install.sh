#!/bin/bash
if [[ ! -d "$HOME/.oh-my-zsh" ]]
then
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-vi-mode" ]]
then
git clone https://github.com/jeffreytse/zsh-vi-mode $HOME/.oh-my-zsh/custom/plugins/zsh-vi-mode
fi

cp zshrc $HOME/.james.zshrc

# Add source james.zshrc to ~/.zshrc if it doesn't already exist.
LINE='source $HOME/.james.zshrc'
FILE="$HOME/.zshrc"
grep -qF -- "$LINE" "$FILE" || sed -i.old '1s;^;'"$LINE"'\n;' "$FILE"

# Install fzf.
if [[ ! -d "$HOME/.fzf" ]]
then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

# Install ripgrep
which rg > /dev/null
if [[ $? != 0 ]]
then
  sudo apt-get update
  sudo apt-get install -y ripgrep
fi

# Install kubectx
if [[ ! -d "$HOME/.kubectx" ]]; then
  git clone --depth 1 https://github.com/ahmetb/kubectx "$HOME/.kubectx"
  ln -sf "$HOME/.kubectx/kubectx" "$HOME/bin/kubectx"
  ln -sf "$HOME/.kubectx/kubens" "$HOME/bin/kubens"
fi
