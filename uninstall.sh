#!/usr/bin/env bash
shopt -s dotglob
DIR=$(dirname "$0")
EXCLUDED=${DIR}/.dotignore

for path in "${DIR}"/*; do
    filename=$(basename "${path}")
    grep -Fxq "${filename}" "${EXCLUDED}" && continue
    [ ! -L "$HOME/${filename}" ] && continue
    rm -fv "$HOME/${filename}"
done
