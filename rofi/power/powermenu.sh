#!/usr/bin/env sh

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

# Available Styles
# >> Styles Below Only Works With "rofi-git(AUR)", Current Version: 1.5.4-76-gca067234
# full     full_circle     full_rounded     full_alt
# card     card_circle     column     column_circle
# row     row_alt     row_circle
# single     single_circle     single_full     single_full_circle     single_rounded     single_text

style="single"

rofi_command="rofi -theme power/$style.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""
dir="$HOME/.config/rofi/power"

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"

prompt_confirm() {
    ans=$(sh $dir/confirm.sh)
    if [ "$ans" = Yes ]; then
        eval $1
    elif [ "$ans" = No ]; then
        exit
    fi
}

case $chosen in
    $shutdown)
		prompt_confirm "systemctl poweroff"
    ;;
    $reboot)
        prompt_confirm "systemctl reboot"
    ;;
    $lock)
        prompt_confirm "sh ~/.config/i3/scripts/locker.sh"
    ;;
    $suspend)	 
        prompt_confirm "mpc -q pause \
            amixer set Master mute \
            systemctl suspend"
    ;;
    $logout)
        prompt_confirm "openbox --exit"
    ;;
esac
