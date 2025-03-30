#!/bin/bash

export XDG_CACHE_HOME=/home/ninjafire/.cache
export GTK_THEME=Tokyonight-Dark

dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &

xrdb .Xresources &
xmodmap ~/.Xmodmap &
xhost +si:localuser:$USER &
xrandr --output HDMI-1-1 --mode 1920x1080 --above eDP-1 &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

gnome-keyring-daemon --start &
# notify-osd &
dunst &
# slstatus &
# picom &
mailspring &
# flameshot &
nm-applet &
# sudo preload &

# feh --bg-scale ~/Pictures/wall.png &
# feh --randomize --bg-fill --no-fehbg ~/Pictures/Wallpapers/*

while :; do
  ssh-agent dwm || break
done
