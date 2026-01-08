#!/usr/bin/env bash

EMERGE_FLAGS="${1:-}"

emerge $EMERGE_FLAGS eselect-repository

if [[ ! -d /var/db/repos/guru ]]; then
	eselect repository enable guru
fi

if [[ ! -d /var/db/repos/jaredallard-overlay ]]; then
	eselect repository add jaredallard-overlay git https://github.com/jaredallard/overlay.git
fi

emaint sync -r guru -r jaredallard-overlay


PACKAGES=(
	"app-editors/neovim"
	"media-video/mpv"
	"media-video/pipewire"
	"app-misc/fastfetch"
	"www-client/vivaldi"
	"app-misc/tmux"
	"gui-wm/mangowc"
	"dev-lang/go"
	"net-libs/nodejs"
	"gui-apps/foot"
	"gui-apps/wl-clipboard"
	"gui-apps/vicinae"
	"media-sound/pulsemixer"
)

emerge $EMERGE_FLAGS ${PACKAGES[@]}
