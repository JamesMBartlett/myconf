#!/bin/bash
set -ex

subdirs=("zsh" "vim" "tmux" "git")
for dir in ${subdirs[@]}; do
  pushd "${dir}" && ./install.sh && popd
done
