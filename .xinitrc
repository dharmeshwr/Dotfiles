#!/bin/bash

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

notify-osd &

nm-applet &

xmodmap ~/.Xmodmap

slstatus &

sudo preload &

while :; do
  ssh-agent dwm || break
done
