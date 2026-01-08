#!/usr/bin/env bash
set -euo pipefail

DRY_RUN=${DRY_RUN:-0}

if [[ "$DRY_RUN" -ne 1 && $EUID -ne 0 ]]; then
    echo "You need to run as root"
    exit 1
fi

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#NOTE: Important Flags
RSYNC_FLAGS="-a --info=progress2"
EMERGE_FLAGS="--ask --verbose --noreplace --deep --newuse"

if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "DRY-RUN mode ( No changes will be made)"
    RSYNC_FLAGS="$RSYNC_FLAGS -n"
    EMERGE_FLAGS="$EMERGE_FLAGS --pretend"
fi

bash "${ROOT}/scripts/portage.sh" "$ROOT" $RSYNC_FLAGS
bash "${ROOT}/scripts/dotfiles.sh" "$ROOT" $RSYNC_FLAGS
bash "${ROOT}/scripts/packages.sh" "$EMERGE_FLAGS"
