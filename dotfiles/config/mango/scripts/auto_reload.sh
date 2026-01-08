#!/usr/bin/env bash

inotifywait -m -e close_write,moved_to $HOME/.config/mango/ | while read event file; do
	mmsg -d reload_config
done
