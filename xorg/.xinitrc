#!/bin/sh

export DESKTOP_SESSION="dwm"

# Start dbus for apps
# dbus-update-activation-environment --systemd DISPLAY XAUTHORITY # XDG_RUNTIME_DIR
# eval "$(dbus-launch --sh-syntax --exit-with-session)"

# Start gnome-keyring (all components, safer for Mailspring)
# eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,gpg)
# export SSH_AUTH_SOCK

# eval $(ssh-agent -s) &

# Session settings
xrdb ~/.Xresources
xsetroot -cursor_name left_ptr
xmodmap ~/.Xmodmap
xset r rate 350 25

# Monitors
# Xft.dpi is 160 (for the HiDPI eDP panel), but X has a single global DPI.
# The external is a ~96 DPI 1080p panel, so render it at 3200x1800 and let
# the GPU downscale to 1920x1080 -- 160/96 = 1.667, so sizes come out right.
EXT="DisplayPort-5"
if xrandr --query | grep -q "^$EXT connected"; then
  xrandr --output "$EXT" --mode 1920x1080 --scale-from 3200x1800 --pos 0x0 \
         --output eDP --mode 3072x1920 --scale 1x1 --pos 0x1800 --primary
else
  xrandr --output eDP --mode 3072x1920 --scale 1x1 --pos 0x0 --primary
fi

# Extras
clipmenud &
picom --config $HOME/.config/picom/picom.conf -b &
sxhkd -c ~/.dotfiles/suckless/sxhkd/sxhkdrc &
dunst &
# brightnessctl set 100+% &
slstatus &
# dwmblocks &
feh --bg-fill ~/Pictures/Wallpapers/current.* &
# zathura ~/Documents/Reverend_Insanity.pdf &

while true; do
  dwm >/dev/null 2>&1
done
