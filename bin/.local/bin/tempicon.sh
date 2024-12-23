#!/bin/zsh

temp=$(grep temp_C ~/.config/weather.txt| awk '{print $2}' | sed 's/\"//g' | sed 's/,//')

lotempicon=""
midtempicon=""
hitempicon=""

#print weather info
TEMP() {
if [ "$temp" -ge 80 ]; then
	echo $hitempicon
elif [ "$temp" -ge 50 ] && [ "$temp" -le 79 ]; then
	echo $midtempicon
elif [ "$temp" -le 49 ]; then
	echo $lotempicon
fi
}

echo $(TEMP)
