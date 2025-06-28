#!/usr/bin/env bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sf "${DOTFILES_DIR}/.gitconfig" "${HOME}/.gitconfig"
ln -sf "${DOTFILES_DIR}/.vimrc" "${HOME}/.vimrc"
ln -sf "${DOTFILES_DIR}/.tmux.conf" "${HOME}/.tmux.conf"

# Augment existing .bashrc/.zshrc
MARKER_COMMENT="# Dotfiles additions"

RC_FILES=(
    "${HOME}/.bashrc"
    "${HOME}/.zshrc"
)

DOTFILES_TO_SOURCE=(
    "${DOTFILES_DIR}/.aliases"
    "${DOTFILES_DIR}/.functions"
)

for rcfile in "${RC_FILES[@]}"; do
    if [ ! -f "$rcfile" ]; then
        touch "$rcfile"
        echo "Created ${rcfile}"
    fi

    if ! grep -q "$MARKER_COMMENT" "$rcfile"; then
        echo "" >> "$rcfile"
        echo "$MARKER_COMMENT" >> "$rcfile"

        for file in "${DOTFILES_TO_SOURCE[@]}"; do
            if [ -f "$file" ]; then
                echo "if [ -f \"$file\" ]; then source \"$file\"; fi" >> "$rcfile"
            fi
        done
    fi
done
