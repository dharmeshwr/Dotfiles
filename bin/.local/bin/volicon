#!/bin/zsh

VOLONOFF="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')"

VOLICON="🔊"
MUTEICON="🔇"

if [ "$VOLONOFF" = 0.00 ]; then
    echo "$MUTEICON"
else
    echo "$VOLICON"
fi

