#!/bin/bash

DAY=$(date +%a)

BASE_DIR=~/Pictures/wallpapers

case $DAY in
    Mon)   FOLDER="4k" ;;
    Tue)   FOLDER="anime" ;;
    Wed)   FOLDER="animated" ;;
    Thu)   FOLDER="cars" ;;
    Fri)   FOLDER="monochrome" ;;
    Sat)   FOLDER="anime" ;;      
    Sun)   FOLDER="4k" ;;        
    *)     FOLDER="anime" ;;    
esac

WALL=$(find "$BASE_DIR/$FOLDER" -type f | shuf -n 1)

feh --bg-scale "${WALL}" 
