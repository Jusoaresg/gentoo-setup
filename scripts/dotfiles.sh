#!/usr/bin/env bash

ROOT="${1:?No root}"
RSYNC_FLAGS="${2:-}"

rsync $RSYNC_FLAGS "${ROOT}/configs/" "${HOME}/.config/"
