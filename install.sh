#!/usr/bin/env bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

shell_addition() {
    rcfile=$1
    add_file=$2
    marker="# Dotfile addition - ${add_file}"

    if [ ! -f "$rcfile" ]; then
        touch "$rcfile"
        echo "Created ${rcfile}"
    fi

    if ! grep -q "$marker" "$rcfile"; then
        echo "" >> "$rcfile"
        echo "$marker" >> "$rcfile"
        echo "if [ -f \"$add_file\" ]; then source \"$add_file\"; fi" >> "$rcfile"
    fi
}

# Basic dotfile links
ln -sf "${DOTFILES_DIR}/.gitconfig" "${HOME}/.gitconfig"
ln -sf "${DOTFILES_DIR}/.vimrc" "${HOME}/.vimrc"
ln -sf "${DOTFILES_DIR}/.tmux.conf" "${HOME}/.tmux.conf"

mkdir -p ${HOME}/.claude
ln -sf "${DOTFILES_DIR}/.claude/settings.json" "${HOME}/.claude/settings.json"

# Add things to shell rc files
shell_addition "${HOME}/.bashrc" "${DOTFILES_DIR}/.bashrc_additions"
shell_addition "${HOME}/.zshrc" "${DOTFILES_DIR}/.zshrc_additions"
