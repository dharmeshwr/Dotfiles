dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

export XDG_CURRENT_DESKTOP="dwm"

export XDG_RUNTIME_DIR="/tmp/xdg-runtime-$(id -u)"
mkdir -p $XDG_RUNTIME_DIR
chmod 700 $XDG_RUNTIME_DIR
pipewire &

dbus-daemon --session --address=unix:path=$XDG_RUNTIME_DIR/bus --nofork &
export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"

eval $(gnome-keyring-daemon --start --components=secrets) &
export SSH_AUTH_SOCK
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

eval $(ssh-agent -s) &

xrdb ~/.Xresources
xsetroot -cursor_name left_ptr 
xmodmap ~/.Xmodmap
xset r rate 250 20

# xrandr --output HDMI-1-1 --mode 1920x1080 --above eDP-1 &

chronyc -a makestep

feh --bg-fill ~/Pictures/wallpapers/backwater.png &

sxhkd -c ~/.dotfiles/suckless/softwares/sxhkd/sxhkdrc &

dunst &

dwmblocks &

exec dwm
