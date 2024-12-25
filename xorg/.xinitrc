#!/bin/bash

xhost +si:localuser:$USER &

/usr/libexec/polkit-gnome-authentication-agent-1 &

#notify-osd &

nm-applet &

xmodmap ~/.Xmodmap

slstatus &

#sudo preload &

feh --bg-scale ~/Pictures/wall.jpg &

while :; do
  ssh-agent dwm || break
done
