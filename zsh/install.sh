sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#!/bin/bash
if [ -f "$HOME/.zshrc" ]; then
  cp $HOME/.zshrc zshrc.old
fi

cp zshrc $HOME/.zshrc
