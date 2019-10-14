#!/bin/bash

cancel="Cancel"
power=""
reboot="ﰇ"
lock=""
suspend="鈴"
logout="﫼"

confirm() {
    echo $(echo "no|yes" | rofi -sep '|' -theme "~/.config/rofi/themes/power.rasi" -dmenu -l 2 -width 335 -mesg "$1?")
}

result=$(echo "$cancel|$power|$reboot|$lock|$suspend|$logout" | rofi -sep '|' -theme "~/.config/rofi/themes/power.rasi" -dmenu -l 6 -width 957)

case $result in
    $cancel) exit ;;
    $power)
        if [ "$(confirm "shutdown")" == "yes" ]; then
             systemctl poweroff
        fi
    ;;
    $reboot)
        if [ "$(confirm "reboot")" == "yes" ]; then
             systemctl reboot
        fi
    ;;
    $lock)
        if [ "$(confirm "lock session")" == "yes" ]; then
             dm-tool switch-to-greeter
        fi
    ;;
    $suspend)
        if [ "$(confirm "suspend")" == "yes" ]; then
             systemctl suspend
        fi
    ;;
    $logout)
        if [ "$(confirm "logout")" == "yes" ]; then
             dm-tool lock
        fi
    ;;
esac
