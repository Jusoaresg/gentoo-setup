#!/usr/bin/env bash

EMERGE_FLAGS="${1:-}"

PACKAGES=(
	"app-editors/nvim"
	"media-video/mpv"
	"media-sound/pipewire"
	"app-misc/fastfetch"
)

emerge $EMERGE_FLAGS ${PACKAGES[@]}
