#!/usr/bin/env bash

EMERGE_FLAGS="${1:-}"

emerge $EMERGE_FLAGS eselect-repository
eselect repository enable guru
emaint sync -r guru

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
)

emerge $EMERGE_FLAGS ${PACKAGES[@]}
