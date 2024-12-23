#!bin/zsh

if [ $(cat /sys/class/net/enp4s0/operstate 2>/dev/null) == 'up' ]; then RX=$(cat /sys/class/net/enp4s0/statistics/rx_bytes); sleep 1; RX_NEW=$(cat /sys/class/net/enp4s0/statistics/rx_bytes); SPEED=$(( (RX_NEW - RX) / 1024 )); IP=$(ip -o -4 addr show enp4s0 | awk '{print $4}' | cut -d/ -f1); echo \"$SPEED KB/s | $IP\"; elif [ $(cat /sys/class/net/wlp3s0/operstate 2>/dev/null) == 'up' ]; then RX=$(cat /sys/class/net/wlp3s0/statistics/rx_bytes); sleep 1; RX_NEW=$(cat /sys/class/net/wlp3s0/statistics/rx_bytes); SPEED=$(( (RX_NEW - RX) / 1024 )); IP=$(ip -o -4 addr show wlp3s0 | awk '{print $4}' | cut -d/ -f1); echo \"$SPEED KB/s | $IP\"; else echo \"N/A\"; fi

