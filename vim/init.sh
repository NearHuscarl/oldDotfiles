#!/bin/bash

# Make necessary directories if not exists
if [ ! -d ~/.vim/undo/ ]; then
   mkdir -p ~/.vim/undo/
fi

if [ ! -d ~/.vim/swapfiles/ ]; then
   mkdir -p ~/.vim/swapfiles/
fi

if [ ! -d ~/.vim/session/ ]; then
   mkdir -p ~/.vim/session/
fi

if [ ! -d ~/.vim/plugged/ ]; then
   mkdir -p ~/.vim/plugged/
fi

# Download plug.vim if not exists
if [ ! -s ~/.vim/autoload/plug.vim ]; then
   wget  -O ~/.vim/autoload/plug.vim "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi
