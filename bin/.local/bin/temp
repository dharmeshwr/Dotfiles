#!/bin/zsh
temp=$(grep -o '"value": "[^"]*"' ~/.config/weather.txt | awk -F'"' '{print $4}')

echo "$temp"
