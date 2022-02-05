#!/bin/bash
if [ -f "$HOME/.tmux.conf" ]; then
  cp $HOME/.tmux.conf ./tmux.conf.old
fi
cp tmux.conf $HOME/.tmux.conf
