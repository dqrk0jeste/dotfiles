#!/usr/bin/env bash

choice=$(printf "    lock\n    logout\n󰤄    suspend\n    reboot\n    shutdown" | rofi -dmenu -p "action ")
if [[ $choice == "    lock" ]];then
    hyprlock
elif [[ $choice == "    logout" ]];then
    pkill -KILL -u "$USER"
elif [[ $choice == "󰤄    suspend" ]];then
    systemctl suspend
elif [[ $choice == "    reboot" ]];then
    systemctl reboot
elif [[ $choice == "    shutdown" ]];then
    systemctl poweroff
fi
