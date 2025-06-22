#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sf "${SCRIPT_DIR}/.gitconfig" "${HOME}/.gitconfig"
ln -sf "${SCRIPT_DIR}/.vimrc" "${HOME}/.vimrc"
ln -sf "${SCRIPT_DIR}/.tmux.conf" "${HOME}/.tmux.conf"
