#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="$HOME/.config/rofi/"
rofi_command="rofi -theme $dir/powermenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="⏻"
reboot=""
exit=""
suspend="⏾"
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$exit\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "$uptime" -dmenu -selected-row 0)"
case $chosen in
$shutdown)
  systemctl poweroff
  ;;
$reboot)
  systemctl reboot
  ;;
$exit)
  ls
  ;;
$suspend)
  systemctl suspend
  ;;
$logout)
  qtile cmd-obj -o cmd -f shutdown
  ;;
esac
