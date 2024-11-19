#!/bin/bash

get_volume() {
    amixer get Master | grep -oP '\[\d+%\]' | head -1 | tr -d '[]%'
}

is_muted() {
    amixer get Master | grep '\[off\]' > /dev/null
    return $?
}

send_notification() {
    local volume=$(get_volume)

    local icon
    if is_muted; then
       icon="/usr/share/icons/Tela/22/panel/audio-volume-muted.svg"
    elif ((volume == 0)); then
       icon="/usr/share/icons/Tela/22/panel/audio-volume-low.svg"
    elif ((volume <= 50)); then
       icon="/usr/share/icons/Tela/22/panel/audio-volume-medium.svg"
    else
       icon="/usr/share/icons/Tela/22/panel/audio-volume-high.svg"
    fi

    dunstify -i "$icon" -a "volume" -u low -r 9993 "" "Volum" -h int:value:"$volume"
}

case $1 in
    up)
        amixer set Master 2%+ unmute
        ;;
    down)
        amixer set Master 2%- unmute
        ;;
    mute)
        amixer set Master toggle
        ;;
esac

send_notification
