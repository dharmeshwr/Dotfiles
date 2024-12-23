#!/bin/bash
function run {
    if ! pgrep $1 > /dev/null ;
    then
        $@&
    fi
}

feh --bg-scale ~/Downloads/11.png &
greenclip daemon &
nm-applet &
run /usr/lib/polkit-kde-authentication-agent-1 &
xfce4-power-manager &
blueman-applet &
pa-applet &
systemctl --user start xfce4-notifyd &
picom --config ~/.config/picom/picom.conf &
