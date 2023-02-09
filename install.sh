#!/bin/bash

set -e

cd $(dirname "$0")

cp .ideavimrc .tmux.conf .vimrc .zshrc ~/

# config vim
############

VIM_CONF_DIR=~/.vim
rm -rf "$VIM_CONF_DIR"

# install plugin manager
mkdir -p "$VIM_CONF_DIR/autoload" "$VIM_CONF_DIR/bundle"
curl -LSso "$VIM_CONF_DIR/autoload/pathogen.vim" https://tpo.pe/pathogen.vim

# install plugins
while read repo
do
    git -C "$VIM_CONF_DIR/bundle" clone "$repo"
done <vim-plugins
