#!/bin/bash

while getopts 'hf' flag; do
    case "${flag}" in
        h) echo "Help will come here" ;;
        f) force=true ;;
        # f) files="${OPTARG}" ;;
    esac
done

if [ "${force}" ] ; then
    echo "Force"
    if test -e ~/.bashrc ; then
        rm -f ~/.bashrc.bak
        cp -a ~/.bashrc ~/.bashrc.bak
        rm -f ~/.bashrc
    fi
    if test -e ~/.gitconfig ; then
        rm -f ~/.gitconfig.bak
        cp -a ~/.gitconfig ~/.gitconfig.bak
        rm -f ~/.gitconfig
    fi
    if test -e ~/.vimrc ; then
        rm -f ~/.vimrc.bak
        cp -a ~/.vimrc ~/.vimrc.bak
        rm -f ~/.vimrc
    fi
    if test -e ~/.myalias ; then
        rm -f ~/.myalias.bak
        cp -a ~/.myalias ~/.myalias.bak
        rm -f ~/.myalias
    fi
    if test -d ~/.vim ; then
        rm -rf ~/.vim.bak
        cp -R ~/.vim ~/.vim.bak
        rm -rf ~/.vim
   fi
elif test -e ~/.bashrc || test -e ~/.gitgonfig || test -e ~/.vimrc || test -e ~/.myalias || test -d ~/.vim ; then
    echo "Files already exists. You can force with -f flag"
    exit 1
fi

ln -s ~/dotfiles/bash/bashrc    ~/.bashrc
ln -s ~/dotfiles/git/gitconfig  ~/.gitconfig
ln -s ~/dotfiles/vim/vimrc      ~/.vimrc
ln -s ~/dotfiles/bash/myalias   ~/.myalias
ln -s ~/dotfiles/vim/dotvim     ~/.vim


# TODO
# 1. Execute Vundle install
# 2. Add update procedure
# 3. Make the code more generic fith file/alias list
# 4. Write 'help' text
# 5. Add progress messages


