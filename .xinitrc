#!/bin/bash

/usr/lib/polkit-kde-authentication-agent-1 &

xfce4-power-manager &

xmodmap ~/.Xmodmap

slstatus &

while :; do
    ssh-agent dwm || break
done
