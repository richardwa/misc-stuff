#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo $DIR
ln -sf "$DIR/dotprofile" ~/.profile
ln -sf "$DIR/dotbash_profile" ~/.bash_profile
ln -sf "$DIR/dotbash_profile" ~/.bashrc

ln -sf "$DIR/dotvimrc" ~/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

