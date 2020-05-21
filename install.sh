#!/bin/sh
shopt -s dotglob
DIR=$(dirname $0)
EXCLUDED=${DIR}/.dotignore

for path in "$DIR"/*; do
    filename=$(basename ${path})
    grep -Fxq "$filename" ${EXCLUDED} && continue
    [ -r "$HOME/$filename" ] && continue
    ln -sv ${path} $HOME
done
