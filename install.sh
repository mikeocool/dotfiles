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
mkdir -p ${HOME}/.config/zellij && ln -sf "${DOTFILES_DIR}/.config/zellij/config.kdl" "${HOME}/.config/zellij/config.kdl"
mkdir -p ${HOME}/.config/ghostty && ln -sf "${DOTFILES_DIR}/.config/ghostty/config" "${HOME}/.config/ghostty/config"

mkdir -p ${HOME}/.claude
ln -sf "${DOTFILES_DIR}/.claude/settings.json" "${HOME}/.claude/settings.json"

mkdir -p ${HOME}/.pi/agent/extensions
ln -sf "${DOTFILES_DIR}/.pi/agent/APPEND_SYSTEM.md" "${HOME}/.pi/agent/APPEND_SYSTEM.md"
# TODO only do this on tailscale system?`
ln -sf "${DOTFILES_DIR}/.pi/agent/extensions/ts-aperture.ts" "${HOME}/.pi/agent/extensions/ts-aperture.ts"

# Add things to shell rc files
shell_addition "${HOME}/.bashrc" "${DOTFILES_DIR}/.bashrc_additions"
shell_addition "${HOME}/.zshrc" "${DOTFILES_DIR}/.zshrc_additions"
