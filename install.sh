#!/bin/sh

DIR=$(dirname "$0")
DOTFILES=(
    '.aliases'
    '.bash_profile'
    '.bashrc'
	'.bin'
    '.exports'
    '.functions'
    '.gitconfig'
    '.gitignore_global'
    '.inputrc'
    '.nanorc'
    '.vimrc'
    '.wallpaper'
)
# DO_NOT_LINK( ._system .gitignore install.sh README.md )

for dotfile in "${DOTFILES[@]}"; do
    ln -sv "${DIR}/${dotfile}" ~
#    rm ${dotfile}
done
