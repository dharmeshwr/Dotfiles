const unsigned int interval = 1000;
static const char unknown_str[] = "n/a";
#define MAXLEN 2048

static const struct arg args[] = {
    /* {netspeed_rx, "| %s", "enp0s20f0u3u1"}, */

    {cpu_perc, "| Sun %s%% ", NULL},

    /* {wifi_essid, "%s", "wlp3s0"}, */
    /* {wifi_perc, " (%s%%) | ", "wlp3s0"}, */

    {run_command, "| Shh %s%% ",
     "pactl get-sink-volume @DEFAULT_SINK@ | awk -F '[ %]+' '/Volume/ {print "
     "100 - $5}'"},

    {run_command, "| Sam %s ",
     "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g"},

    {run_command, "| %s ", "date '+%b %d %a %I:%M %p'"},

    /* {run_command, "Hotspot %1s | ", "systemctl is-active hotspot.service |
       grep -q '^active$' && echo 'On' || echo 'Off'"}, */

    // {run_command, "%2s | ",
    //  "if [ $(cat /sys/class/net/enp4s0/operstate 2>/dev/null) = 'up' ]; then
    //  " "echo \"Lan\"; " "elif [ $(cat /sys/class/net/wlan0/operstate
    //  2>/dev/null) = 'up' ]; then " "wifi_name=$(iwgetid wlan0 -r); echo
    //  \"Wifi $wifi_name\"; " "else echo \"Not connected\"; fi"},

    /* {run_command, "Vol %1s | ", "~/.local/bin/volume.sh"}, */

    /* {battery_perc, "Bat %s%% | ", "BAT1"}, */
};

/*
 * function            description                     argument (example)
 *
 * battery_perc        battery percentage              battery name (BAT0)
 *                                                     NULL on OpenBSD/FreeBSD
 * battery_state       battery charging state          battery name (BAT0)
 *                                                     NULL on OpenBSD/FreeBSD
 * battery_remaining   battery remaining HH:MM         battery name (BAT0)
 *                                                     NULL on OpenBSD/FreeBSD
 * cpu_perc            cpu usage in percent            NULL
 * cpu_freq            cpu frequency in MHz            NULL
 * datetime            date and time                   format string (%F %T)
 * disk_free           free disk space in GB           mountpoint path (/)
 * disk_perc           disk usage in percent           mountpoint path (/)
 * disk_total          total disk space in GB          mountpoint path (/")
 * disk_used           used disk space in GB           mountpoint path (/)
 * entropy             available entropy               NULL
 * gid                 GID of current user             NULL
 * hostname            hostname                        NULL
 * ipv4                IPv4 address                    interface name (eth0)
 * ipv6                IPv6 address                    interface name (eth0)
 * kernel_release      `uname -r`                      NULL
 * keyboard_indicators caps/num lock indicators        format string (c?n?)
 *                                                     see keyboard_indicators.c
 * keymap              layout (variant) of current     NULL
 *                     keymap
 * load_avg            load average                    NULL
 * netspeed_rx         receive network speed           interface name (wlan0)
 * netspeed_tx         transfer network speed          interface name (wlan0)
 * num_files           number of files in a directory  path
 *                                                     (/home/foo/Inbox/cur)
 * ram_free            free memory in GB               NULL
 * ram_perc            memory usage in percent         NULL
 * ram_total           total memory size in GB         NULL
 * ram_used            used memory in GB               NULL
 * run_command         custom shell command            command (echo foo)
 * swap_free           free swap in GB                 NULL
 * swap_perc           swap usage in percent           NULL
 * swap_total          total swap size in GB           NULL
 * swap_used           used swap in GB                 NULL
 * temp                temperature in degree celsius   sensor file
 *                                                     (/sys/class/thermal/...)
 *                                                     NULL on OpenBSD
 *                                                     thermal zone on FreeBSD
 *                                                     (tz0, tz1, etc.)
 * uid                 UID of current user             NULL
 * uptime              system uptime                   NULL
 * username            username of current user        NULL
 * vol_perc            OSS/ALSA volume in percent      mixer file (/dev/mixer)
 * wifi_perc           WiFi signal in percent          interface name (wlan0)
 * wifi_essid          WiFi ESSID                      interface name (wlan0)
 */
