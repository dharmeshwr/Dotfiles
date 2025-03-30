#!/usr/bin/env zsh

dir="$HOME/.config/rofi"
theme='style-1'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
