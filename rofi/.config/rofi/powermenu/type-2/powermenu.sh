#!/usr/bin/env bash

# Configuration
dir="$HOME/.config/rofi/powermenu/type-2"
theme='style-5'

# Options
shutdown=''
reboot=''
lock='󰌾'
suspend='󰒲'
logout='󰍃'
yes=''
no=''

# Get uptime and host
uptime=$(uptime -p | sed 's/up //')
host=$(hostname)

# Rofi CMD to display options
run_rofi() {
    echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi -dmenu -p "Uptime: $uptime" -theme "${dir}/${theme}.rasi"
}


# Main action
chosen=$(run_rofi)
case "$chosen" in
    $shutdown) poweroff ;;
    $reboot) reboot ;;
    $lock) hyprlock ;;
    $suspend) suspend ;;
    $logout) logout ;;
esac

