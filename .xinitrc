#!/bin/bash

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# xfce4-power-manager &

xmodmap ~/.Xmodmap

slstatus &

while :; do
  ssh-agent dwm || break
done
