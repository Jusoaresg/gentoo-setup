#!/usr/bin/env bash

EMERGE_FLAGS="${1:-}"

emerge $EMERGE_FLAGS eselect-repository

if [[ ! -d /var/db/repos/guru ]]; then
	eselect repository enable guru
fi

if [[ ! -d /var/db/repos/jaredallard ]]; then
	eselect repository add jaredallard git https://github.com/jaredallard/overlay.git
fi

if [[ ! -d /var/db/repos/steam-overlay ]]; then
	eselect repository enable steam-overlay
fi

if [[ ! -d /var/db/repos/haskell ]]; then
	eselect repository enable haskell
fi

emaint sync -r guru -r jaredallard-overlay -r steam-overlay -r haskell


PACKAGES=(
	"app-editors/neovim"
	"media-video/mpv"
	"media-video/pipewire"
	"app-misc/fastfetch"
	"www-client/vivaldi"
	"app-misc/tmux"
	#"gui-wm/mangowc"
	"dev-lang/go"
	"net-libs/nodejs"
	"gui-apps/wl-clipboard"
	"gui-apps/vicinae"
	"media-sound/pulsemixer"
	"gui-apps/swappy"
	"gui-apps/grim"
	"gui-apps/slurp"
	"sys-fs/squashfuse"
	"media-fonts/noto-cjk"
	"media-fonts/noto-emoji"
	"media-fonts/noto"
	"app-shells/fzf"
	"sys-apps/ripgrep"
	"gui-apps/awww"
	"media-gfx/imv"
	"x11-terms/wezterm"
	"games-util/steam-launcher"
	"gui-apps/quickshell"
	"games-action/prismlauncher"
	"media-video/obs-studio"
	"dev-java/openjdk:17"
	"dev-java/openjdk-bin:21"
	"sys-apps/xdg-desktop-portal"
	"sys-apps/xdg-desktop-portal-gtk"
	"gui-libs/xdg-desktop-portal-wlr"
	"dev-dotnet/dotnet-sdk-bin"
	"app-misc/jq"
	"dev-games/godot-dotnet"
	"media-sound/playerctl"
	"media-fonts/adwaita-fonts"
	"dev-dotnet/netcoredbg"
	"dev-lang/rust-bin"
	"x11-themes/gnome-themes-standard"
	"app-containers/docker"
	"app-containers/docker-compose"
	"dev-util/tree-sitter-cli"
	"media-gfx/gimp"
	"gui-wm/niri"
	"gui-apps/xwayland-satellite"
	"x11-wm/xmonad"
	"x11-wm/xmonad-contrib"
	"app-portage/gentoolkit"
	"x11-misc/pcmanfm"
	"x11-apps/setxkbmap"
	"x11-misc/picom"
	"media-gfx/feh"
	"x11-apps/xrandr"
	"app-arch/unrar"
)

emerge $EMERGE_FLAGS ${PACKAGES[@]}
