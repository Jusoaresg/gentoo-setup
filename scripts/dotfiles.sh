#!/usr/bin/env bash

ROOT="${1:?No root}"
RSYNC_FLAGS="${2:-}"

rsync $RSYNC_FLAGS "${ROOT}/dotfiles/config/" "${HOME}/.config/"

#NOTE: Home Files
rsync $RSYNC_FLAGS "${ROOT}/dotfiles/bashrc" "${HOME}/.bashrc"
rsync $RSYNC_FLAGS "${ROOT}/dotfiles/fonts" "${HOME}/.fonts"
rsync $RSYNC_FLAGS "${ROOT}/dotfiles/bin/" "${HOME}/.bin/"

NVIM_CONFIG_DIR="${HOME}/.config/nvim"
NVIM_REPO_HTTP="https://github.com/jusoaresg/nvim-conf"
NVIM_REPO_SSH="git@github.com:jusoaresg/nvim-conf"

if [[ -d "$NVIM_CONFIG_DIR/.git" ]]; then

    echo "Updating neovim config..."
    (
        cd "$NVIM_CONFIG_DIR" || exit 1

        if git remote get-url origin-http >/dev/null 2>&1; then
            git pull origin-http main
        else
            git pull
            git remote rename origin origin-http
            git remote add origin "$NVIM_REPO_SSH"
        fi
    )
else

    echo "Cloning neovim config..."
    git clone "$NVIM_REPO_HTTP" "$NVIM_CONFIG_DIR"

    (
        cd "$NVIM_CONFIG_DIR" || exit 1
        git remote rename origin origin-http
        git remote add origin "$NVIM_REPO_SSH"

        git fetch origin
        git branch --set-upstream-to=origin/$(git symbolic-ref --short HEAD)
    )
fi

