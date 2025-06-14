#!/usr/bin/env bash
shopt -s dotglob
DIR=$(dirname "$0")
EXCLUDED=${DIR}/.dotignore

for path in "${DIR}"/*; do
    filename=$(basename "${path}")
    grep -Fxq "${filename}" "${EXCLUDED}" && continue
    [ -r "$HOME/${filename}" ] && continue
    ln -sv "${path}" "$HOME"
done

# XDG Base Directory
mkdir -p ~/{.config,.cache,.local/share,.local/state}
