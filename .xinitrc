#!/bin/zsh

/usr/lib/polkit-kde-authentication-agent-1 & # provides extended privileges to applications.

xmodmap ~/.Xmodmap

slstatus & 
# dwmbar &

while :; do
	ssh-agent dwm || break
done
