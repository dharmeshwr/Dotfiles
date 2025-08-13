export XDG_CURRENT_DESKTOP="dwm"

export XDG_RUNTIME_DIR="/tmp/xdg-runtime-$(id -u)"
mkdir -p $XDG_RUNTIME_DIR
chmod 700 $XDG_RUNTIME_DIR
pipewire &

eval $(gnome-keyring-daemon --start --components=secrets,ssh)
export SSH_AUTH_SOCK
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

xrdb ~/.Xresources
xsetroot -cursor_name left_ptr 
xmodmap ~/.Xmodmap &

# xhost +si:localuser:$USER &
# xrandr --output HDMI-1-1 --mode 1920x1080 --above eDP-1 &
# xset r rate 200 &

feh --bg-fill ~/Pictures/wallpapers/backwater.png &

sxhkd -c ~/.dotfiles/suckless/softwares/sxhkd/sxhkdrc &

dunst &

dwmblocks &

exec dwm
