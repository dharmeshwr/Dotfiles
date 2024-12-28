#!/bin/bash

export XDG_CACHE_HOME=/home/ninjafire/.cache
export GTK_THEME=Gruvbox-Dark 

xhost +si:localuser:$USER &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# notify-osd &
dunst &

slstatus &

xmodmap ~/.Xmodmap

nm-applet &

# sudo preload &

# feh --bg-scale ~/Pictures/wall.jpg &

while :; do
  ssh-agent dwm || break
done
