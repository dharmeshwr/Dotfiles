#!/bin/bash

export XDG_CACHE_HOME=/home/ninjafire/.cache
export GTK_THEME=Gruvbox-Dark 

dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

xrdb .Xresources

xhost +si:localuser:$USER &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# notify-osd &
dunst &

slstatus &

xmodmap ~/.Xmodmap

# flameshot &
nm-applet &

# sudo preload &

# feh --bg-scale ~/Pictures/wall.jpg &
# feh --randomize --bg-fill --no-fehbg ~/Pictures/Wallpapers/*

while :; do
  ssh-agent dwm || break
done
