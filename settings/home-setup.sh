#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo $DIR
ln -sf "$DIR/dotprofile" ~/.profile
ln -sf "$DIR/dotbash_profile" ~/.bash_profile
ln -sf "$DIR/dotbash_profile" ~/.bashrc

#vim stuff
mkdir -p ~/.vim/bundle
mkdir -p ~/.config
ln -sf ~/.vim ~/.config/nvim
ln -sf "$DIR/dotvimrc" ~/.vimrc
ln -sf "$DIR/dotvimrc" ~/.config/nvim/init.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

