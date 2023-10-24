#!/bin/bash
WALLPAPER_DIR=~/wallpapers
WALLPAPER_SELECT=$(ls ~/wallpapers | dmenu -l 10; sleep 0.001)
feh --bg-scale $WALLPAPER_DIR/$WALLPAPER_SELECT

