#!/bin/bash

send_notification() {
    local brightness=$(brightnessctl get)
    local max_brightness=$(brightnessctl max)


    local icon
    if ((brightness == 0 )); then
        icon="/usr/share/icons/Tela/22/panel/gpm-brightness-lcd-disabled.svg"
    else
        icon="/usr/share/icons/Tela/22/panel/xfpm-brightness-lcd.svg"
    fi

    brightness_percentage=$(( 100 * brightness / max_brightness ))

    dunstify -i "$icon" -a "brightness" -u low -r 9994 "" "Brightness" -h int:value:"$brightness_percentage"

}

case $1 in
    up)
        brightnessctl set +5%
        ;;
    down)
        brightnessctl set 5%-
        ;;
esac

send_notification
