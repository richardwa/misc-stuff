#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo $DIR

# settings
if grep -q dotprofile ~/.bashrc; then
  echo profile already added
else
  echo source $DIR/dotprofile >> ~/.bashrc
fi

# vim stuff
mkdir -p ~/.vim/bundle
ln -sf "$DIR/dotvimrc" ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# copy vim config to nvm
mkdir -p ~/.config
ln -sf ~/.vim ~/.config/nvim
ln -sf "$DIR/dotvimrc" ~/.config/nvim/init.vim


