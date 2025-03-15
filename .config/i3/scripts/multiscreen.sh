#!/bin/bash

displays_info=$(xrandr | grep 'DisplayPort.* connected' -A 1)

ports=()
resolutions=()

while IFS= read -r line; do
    if [[ $line == *"DisplayPort"* ]]; then
        ports+=($(echo "$line" | awk '{print $1}'))
    elif [[ $line == *"+"* ]]; then
        resolutions+=($(echo "$line" | awk '{print $1}'))
    fi
done <<< "$displays_info"

if [[ ${#ports[@]} -eq 0 ]]; then
    # echo "No s'han trobat monitors DisplayPort. Sortint del script."
    exit 1
fi

primary_added=false
xrandr_command="xrandr"
previous_port=""

all_ports=($(xrandr | grep -E '\bconnected\b' | awk '{print $1}'))

for port in "${all_ports[@]}"; do
    if [[ ! " ${ports[@]} " =~ " ${port} " ]]; then
        # Disable unused ports
        xrandr_command+=" --output $port --off"
    fi
done

# Disable eDP if DisplayPort is found
if [[ ${#ports[@]} -gt 0 ]]; then
    xrandr_command+=" --output eDP --off"
fi

for i in "${!ports[@]}"; do
    xrandr_command+=" --output ${ports[$i]} --mode ${resolutions[$i]}"

    if [[ -n $previous_port ]]; then
        xrandr_command+=" --left-of $previous_port"
    fi

    if [[ ${resolutions[$i]} == "1920x1080" && $primary_added == false ]]; then
        xrandr_command+=" --primary"
        primary_added=true
    fi

    previous_port="${ports[$i]}"
done

eval "$xrandr_command"
