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
    if [ -e ~/bashrc ] ; then
        cp -a ~/.bashrc ~/.bashrc.bak
        rm -f ~/.bashrc
    fi
    if [ -e ~/.vimrc ] ; then
        cp -a ~/.vimrc ~/.vimrc.bak
        rm -f ~/.vimrc
    fi
    if [ -e ~/.myalias ] ; then
        cp -a ~/.myalias ~/.myalias.bak
        rm -f ~/.myalias
    fi
    if [ -d ~/.vim ] ; then
        cp -R ~/.vim ~/.vim.bak
        rm -rf ~/.myalias
    fi
elif [ -e ~/.bashrc ] || [ -e ~/.vimrc ] || [ -e ~/.myalias ] || [ -d ~/.vim ] ; then
    echo "Files already exists. You can force with -f flag"
    exit 1
fi

ln -s ~/dotfiles/bashrc     ~/.bashrc
ln -s ~/dotfiles/vimrc      ~/.vimrc
ln -s ~/dotfiles/myalias    ~/.myalias


# TODO
# 1. Execute Vundle install
# 2. Update dotfile local git settings according to variables
# 3. Add update procedure
# 4. Make the code more generic fith file list
# 5. Write 'help' text

name='Yossi Nivin'
email='ynivin@gmail.com'
