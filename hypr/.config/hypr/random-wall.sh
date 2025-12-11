#!/bin/bash

DAY=$(date +%a)

BASE_DIR=~/Pictures/Wallpapers/catppuccin-dark

WALL=$(find "$BASE_DIR/$FOLDER" -type f | shuf -n 1)

swww query || swww-daemon

swww img "${WALL}" --transition-fps 100 --transition-type any --transition-duration 1

