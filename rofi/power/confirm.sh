#!/usr/bin/env sh

#options
style="confirm"

rofi_command="rofi -theme power/$style.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
accept="Yes"
decline="No"

# Variable passed to rofi
options="$accept\n$decline"

chosen="$(echo "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"

echo $chosen