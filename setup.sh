#!/bin/bash

git clone https://github.com/k-takata/minpac.git \
    ~/.vim/pack/minpac/opt/minpac

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install ripgrep

rm -f ~/.vimrc
ln -s `pwd`/vimrc ~/.vimrc
rm -f ~/.zshrc
ln -s `pwd`/zsh ~/.zshrc
