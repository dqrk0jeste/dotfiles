#!/bin/bash

while :
do
  battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')
  is_charging=$(acpi -b | grep -c "Charging")

  if [[ $is_charging -eq 1 && ! -f /tmp/is_charging ]]; then
    touch /tmp/is_charging 
    rm /tmp/has_been_informed_low
    notify-send -u normal "Charging" "The charger is on."
  elif [[ $is_charging -eq 0 && -f /tmp/is_charging ]]; then
    rm /tmp/is_charging
    rm /tmp/has_been_informed_over_80
    notify-send -u normal "Discharging" "The charger is off."
  fi

  if [ $is_charging -eq 1 ] && [ $battery_level -ge 80 ] && [ ! -f /tmp/has_been_informed_over_80 ]; then
    notify-send -u normal "Battery is above 80%." "You may unplug the charger"
    touch /tmp/has_been_informed_over_80
  fi

  if [ $is_charging -eq 0 ] && [ $battery_level -lt 30 ] && [ ! -f /tmp/has_been_informed_low ]; then
    notify-send -u critical "Battery is low." "Plug in the charger"
    touch /tmp/has_been_informed_low
  fi

  sleep 3
done

