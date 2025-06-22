#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sf "${SCRIPT_DIR}/.gitconfig" "~/.gitconfig"
ln -sf "${SCRIPT_DIR}/.vimrc" "~/.vimrc"
ln -sf "${SCRIPT_DIR}/.tmux.conf" "~/.tmux.conf"
