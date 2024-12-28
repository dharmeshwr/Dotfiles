#!/bin/zsh

# Get volume information
VOLINFO="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

# Extract the volume and mute state from the volume info
VOL=$(echo $VOLINFO | awk '{print $2 * 100 "%"}')
MUTED=$(echo $VOLINFO | grep -o "\[MUTED\]")

# Define icons for volume and mute
VOLICON=" "
MUTEICON=" "

# Check if muted
if [ "$MUTED" = "[MUTED]" ]; then
    echo "0%"
else
    echo "$VOL"
fi

