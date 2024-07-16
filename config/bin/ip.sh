#!/bin/zsh
ip="$(ip a | grep .255 | grep -v wlp | cut -d' ' -f6 | sed 's/\/24//')"

echo $ip
