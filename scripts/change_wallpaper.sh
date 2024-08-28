#!/bin/bash

wallpaper_count=$(wc -l <<< $(ls $HOME/wallpapers))
(( wallpaper_count-- ))

current=$(cat $HOME/state/current_wallpaper_index)

if [[ "$current" -ge "$wallpaper_count" ]]; then
  current=0
else 
  (( current++ ))
fi

echo "$current" > $HOME/state/current_wallpaper_index

cd $HOME/wallpapers
wallpapers=(*)

rm $HOME/state/current_wallpaper.png 2> /dev/null

ln -s $HOME/wallpapers/${wallpapers[current]} $HOME/state/current_wallpaper.png

swww img "$HOME/state/current_wallpaper.png" --transition-type grow --transition-pos 0.25,0.25 --transition-duration 2 --transition-fps 60

