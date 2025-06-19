#!/bin/bash

wallpaper=$(find ~/Pictures/Wallpaper/ -type f -name "*.jpg" -o -name "*.png" -o -name "*.gif" | shuf -n 1)

rm ~/.config/wallpaperchanger/current_wallpaper.conf
echo '$WALLPAPER' =  $wallpaper >> ~/.config/wallpaperchanger/current_wallpaper.conf


swww img $wallpaper --transition-type random --transition-step 100 --transition-fps 60 --transition-duration .3

wal -c
wal -i $wallpaper

pywalfox update

#~/.config/swaync/refresh.sh

swaync-client --reload-css

walogram

killall -SIGUSR2 waybar &

rm -rf $HOME/.cache/swww
