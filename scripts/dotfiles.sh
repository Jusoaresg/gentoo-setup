#!/usr/bin/env bash

ROOT="${1:?No root}"
RSYNC_FLAGS="${2:-}"

rsync $RSYNC_FLAGS "${ROOT}/configs/" "${HOME}/.config/"

NVIM_CONFIG_DIR="${HOME}/.config/nvim"
NVIM_REPO="https://github.com/jusoaresg/nvim-conf"

if [[ -d "$NVIM_CONFIG_DIR" ]]; then
    echo "Updating existing Neovim config..."
    git -C "$NVIM_CONFIG_DIR" pull
else
    echo "Cloning Neovim config..."
    git clone "$NVIM_REPO" "$NVIM_CONFIG_DIR"
fi
