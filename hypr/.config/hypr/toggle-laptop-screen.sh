#!/usr/bin/env bash

INTERNAL="eDP-1"
EXTERNAL="HDMI-A-1" 

if hyprctl monitors | grep -q "$EXTERNAL"; then
    if hyprctl monitors | grep -q "$INTERNAL"; then
        hyprctl keyword monitor "$INTERNAL,disable"
        notify-send "Laptop screen disabled"
    else
        notify-send "Laptop screen enabled"
        hyprctl keyword monitor "$INTERNAL,preferred,auto,1"
    fi
else
    notify-send "External monitor not connected"
fi
