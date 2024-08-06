#!/bin/zsh

# Get the mute status and volume percentage
VOLINFO="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
VOLONOFF=$(echo $VOLINFO | awk '{print $2}')
VOL=$(echo $VOLINFO | awk '{print $2 * 100 "%"}')

VOLICON=" "
MUTEICON=" "

if [ "$VOLONOFF" = 0.00 ]; then
    echo "$MUTEICON"
else
    echo "$VOL"
fi

