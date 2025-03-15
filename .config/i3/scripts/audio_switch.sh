#!/bin/bash

# Get the list of available sinks (audio outputs)
sinks=($(pactl list short sinks | awk '{print $1}'))
sink_names=($(pactl list short sinks | awk '{print $2}'))

# Get the currently active (default) sink
current_sink=$(pactl get-default-sink)

# Find the index of the current sink in the list
current_index=0
for i in "${!sinks[@]}"; do
    if [[ "${sink_names[$i]}" == "$current_sink" ]]; then
        current_index=$i
        break
    fi
done

# find sink that is not "hdmi-stereo"
find_next_sink() {
    local index=$(( (current_index + 1) % ${#sinks[@]} ))
    while [[ "${sink_names[$index]}" == *"hdmi-stereo"* ]]; do
        index=$(( (index + 1) % ${#sinks[@]} ))
        if [[ $index -eq $current_index ]]; then
            exit 1
        fi
    done
    echo "$index"
}

# Calculate the index of the next sink to switch to
next_index=$(find_next_sink)

# Switch to the next sink
next_sink="${sinks[$next_index]}"
next_sink_name="${sink_names[$next_index]}"
pactl set-default-sink "$next_sink"

# Move all currently playing streams to the new sink
for stream in $(pactl list short sink-inputs | awk '{print $1}'); do
    pactl move-sink-input "$stream" "$next_sink"
done

# Format notification message
if [[ $next_sink_name == *"HyperX_Virtual_Surround_Sound"* ]]; then
    next_sink_name="Altaveus"
elif [[ $next_sink_name == *"HyperX_7.1"* ]]; then
    next_sink_name="Auriculars"
elif [[ $next_sink_name == *"analog-stereo"* ]]; then
    next_sink_name="Altaveus Portàtil"
elif [[ $next_sink_name == *"hdmi-stereo"* ]]; then
    next_sink_name="HDMI"
fi

# Send notification with the new sink name using dunst and notify-send
notify-send "Audio Output Canviat" "$next_sink_name"
