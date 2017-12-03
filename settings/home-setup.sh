#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo $DIR
ln -sf "$DIR/dotprofile" ~/.profile
ln -sf "$DIR/dotbash_profile" ~/.bash_profile
ln -sf "$DIR/dotbash_profile" ~/.bashrc
ln -sf "$DIR/dotvimrc" ~/.vimrc
ln -sfn "$DIR/dotvim" ~/.vim

mkdir ~/.xmonad
ln -sfn "$DIR/xmonad.hs" ~/.xmonad/xmonad.hs
