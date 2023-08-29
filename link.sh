#!/bin/bash
cd $(dirname "$0")

function link() {
    SOURCE="$1"
    TARGET="$2"
    NAME="$3"
    echo ":: Linking $NAME configuration"
    if [[ -L "$TARGET" ]]; then
        echo "!! $NAME configuration is already a link, unlinking"
        unlink "$TARGET"
    else
        if [[ -d "$TARGET" ]]; then
            echo "!! Backing up old $NAME configuration"
            mv "$TARGET" "$PWD/old"
        fi
    fi
    ln -s "$SOURCE" "$TARGET"
    echo ":: Done"
}

link "$PWD/files/nvim" "$HOME/.config/nvim" "Neovim"
