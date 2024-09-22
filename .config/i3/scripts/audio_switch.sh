#!/bin/bash

sinks=($(pactl list short sinks | awk '{print $1}'))
sink_names=($(pactl list short sinks | awk '{print $2}'))

current_sink=$(pactl get-default-sink)

current_index=0
for i in "${!sinks[@]}"; do
    if [[ "${sink_names[$i]}" == "$current_sink" ]]; then
        current_index=$i
        break
    fi
done

next_index=$(( (current_index + 1) % ${#sinks[@]} ))

next_sink="${sinks[$next_index]}"
next_sink_name="${sink_names[$next_index]}"
pactl set-default-sink "$next_sink"

for stream in $(pactl list short sink-inputs | awk '{print $1}'); do
    pactl move-sink-input "$stream" "$next_sink"
done

notify-send "Audio Output Switched" "$next_sink_name"
