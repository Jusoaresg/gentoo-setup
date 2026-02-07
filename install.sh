#!/usr/bin/env bash
set -euo pipefail

DRY_RUN=${DRY_RUN:-0}

if [[ "$EUID" -eq 0 ]]; then
    echo "install.sh must NOT be run as root"
    exit 1
fi

as_root() {
    if [[ "$EUID" -eq 0 ]]; then
        "$@"
    else
        sudo "$@"
    fi
}

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#NOTE: Important Flags
RSYNC_FLAGS="-a --info=progress2"
EMERGE_FLAGS="--ask --verbose --noreplace --deep --newuse"

if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "DRY-RUN mode ( No changes will be made)"
    RSYNC_FLAGS="$RSYNC_FLAGS -n"
    EMERGE_FLAGS="$EMERGE_FLAGS --pretend"
fi

as_root bash "${ROOT}/scripts/portage.sh" "$ROOT" $RSYNC_FLAGS
as_root bash "${ROOT}/scripts/packages.sh" "$EMERGE_FLAGS"

bash "${ROOT}/scripts/dotfiles.sh" "$ROOT" $RSYNC_FLAGS

