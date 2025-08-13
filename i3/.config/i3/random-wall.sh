#!/bin/bash

DAY=$(date +%a)

BASE_DIR=~/Pictures/wallpapers

case $DAY in
    Mon)   FOLDER="4k" ;;
    Tue)   FOLDER="anime" ;;
    Wed)   FOLDER="misc" ;;
    Thu)   FOLDER="cars" ;;
    Fri)   FOLDER="tokyo-night" ;;
    Sat)   FOLDER="decay" ;;      
    Sun)   FOLDER="gradients" ;;        
    *)     FOLDER="space" ;;    
esac

WALL=$(find "$BASE_DIR/$FOLDER" -type f | shuf -n 1)

feh --bg-fill "${WALL}" 
