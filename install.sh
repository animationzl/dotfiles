#!/bin/bash

cd $(dirname "$0")

[[ ! -e ~/.vimrc ]] && cp .vimrc ~/.vimrc
[[ ! -e ~/.tmux.conf ]] && cp .tmux.conf ~/.tmux.conf

mkdir -p ~/.vim/autoload ~/.vim/bundle

# Install tpope/vim-pathogen
if [[ ! -e ~/.vim/autoload/pathogen.vim ]]; then
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# Install vim plugins
while read repo
do
    short_name=${repo##*/}
    if [[ ! -d ~/.vim/bundle/"$short_name" ]]; then
        git clone https://github.com/"$repo" ~/.vim/bundle/"$short_name"
    fi
done < vim-plugins
