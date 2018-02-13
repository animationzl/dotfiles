#!/bin/bash

TOP_DIR=$(cd $(dirname "$0") && pwd)

# Install tpope/vim-pathogen
if [[ ! -e ~/.vim/autoload/pathogen.vim ]]; then
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# Install vim plugins
while read repo
do
    short_name=${repo##*/}
    if [[ ! -d ~/.vim/bundle/$short_name ]]; then
        git clone https://github.com/$repo ~/.vim/bundle/$short_name
    fi
done < $TOP_DIR/vim-plugins

if [[ ! -e ~/.vimrc ]]; then
    cp $TOP_DIR/.vimrc ~/.vimrc
fi

if [[ ! -e ~/.tmux.conf ]]; then
    cp $TOP_DIR/.tmux.conf ~/.tmux.conf
fi
