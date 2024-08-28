#!/bin/bash

selection=$(slurp 2> /dev/null)

if [[ "$selection" == "" ]]; then
  echo "cancelled"
else
  grim -g "$selection" $HOME/screenshots/$(date +"%Y-%m-%d_%H-%M-%S").png
  notify-send -u normal "Screenshot captured." "Saved to ~/screenshots."
fi


