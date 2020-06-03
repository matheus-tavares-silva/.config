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
        prompt_confirm "systemctl suspend && sh ~/.config/i3/scripts/locker.sh"
    ;;
    $logout)
        prompt_confirm "i3-msg exit"
    ;;
esac
