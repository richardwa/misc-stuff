#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo $DIR

# settings
ln -sf "$DIR" ~/.settings
ln -sf "$DIR/dotprofile" ~/.profile
ln -sf "$DIR/dotprofile" ~/.bash_profile
ln -sf "$DIR/dotprofile" ~/.bashrc
# ln -sf "$DIR/dottmux.conf" ~/.tmux.conf

# home
ln -sf "/mnt/h/Documents" ~/Documents
ln -sf "/mnt/h/3D" ~/3D
ln -sf "/mnt/c/Users/rwang/Downloads" ~/Downloads

# vim stuff
mkdir -p ~/.vim/bundle
mkdir -p ~/.config
ln -sf ~/.vim ~/.config/nvim
ln -sf "$DIR/dotvimrc" ~/.vimrc
ln -sf "$DIR/dotvimrc" ~/.config/nvim/init.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

