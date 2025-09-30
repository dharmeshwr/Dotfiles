#!/bin/sh
# Load profile
source ~/.profile

# Ensure runtime dir
export DESKTOP_SESSION="dwm"
export XDG_RUNTIME_DIR="/tmp/xdg-runtime-$(id -u)"
mkdir -p "$XDG_RUNTIME_DIR"
chmod 700 "$XDG_RUNTIME_DIR"

# Start dbus for apps
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY XDG_RUNTIME_DIR
eval "$(dbus-launch --sh-syntax --exit-with-session)"

# Start gnome-keyring (all components, safer for Mailspring)
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,gpg)
export SSH_AUTH_SOCK

eval $(ssh-agent -s) &

# Session settings
xrdb ~/.Xresources
xsetroot -cursor_name left_ptr
xmodmap ~/.Xmodmap
xset r rate 350 25

# Monitors
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto   # detect and enable all outputs
xrandr --output eDP-1-1 --mode 1920x1080 --pos 0x1080 --primary
xrandr --output HDMI-0 --mode 1920x1080 --above eDP-1-1 --auto

# Extras
feh --bg-fill ~/Pictures/Wallpapers/current.* &
pipewire &
xautolock -time 10 -locker slock &
picom --config $HOME/.config/picom/picom.conf -b &
sxhkd -c ~/.dotfiles/suckless/softwares/sxhkd/sxhkdrc &
dunst &
brightnessctl set 100+% &
dwmblocks &
zathura ~/Documents/Reverend_Insanity.pdf &

while true; do
  dwm >/dev/null 2>&1
done
