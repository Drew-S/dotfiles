#!/bin/bash

brave=" Brave"
mail=" Mail Spring"
steam=" Steam"
blender=" Blender"
krita=" Krita"
darktable=" Darktable"
spotify=" Spotify"
thunar=" Thunar"
writer=" Writer"
code=" Code"

result=$(echo "$brave|$mail|$steam|$blender|$krita|$darktable|$spotify|$thunar|$writer|$code" | rofi -sep '|' -dmenu -font "DroidSansMono Nerd Font Mono 10" -location 1 -yoffset 36 -xoffset 185 -width 7 -lines 10 -hide-scrollbar -i -p "")

case $result in
    $brave) brave & ;;
    $mail) mailspring & ;;
    $steam) steam & ;;
    $blender) $("blender-2.8") & ;;
    $krita) krita & ;;
    $darktable) darktable & ;;
    $spotify) spotify & ;;
    $thunar) thunar & ;;
    $writer) lowriter & ;;
    $code) code & ;;
    *)
esac
