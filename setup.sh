#!/bin/bash

git clone https://github.com/k-takata/minpac.git \
    ~/.vim/pack/minpac/opt/minpac

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install ripgrep

ln -s `pwd`/the_dots/vimrc ~/.vimrc
rm -f `pwd`/.zshrc
ln -s `pwd`/the_dots/zsh ~/.zshrc
