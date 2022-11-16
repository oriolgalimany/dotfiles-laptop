#!/bin/bash

# The name of polybar bar which houses the main spotify module and the control modules.
PARENT_BAR="mybar"
PARENT_BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)

# Set the source audio player here.
# Players supporting the MPRIS spec are supported.
# Examples: spotify, vlc, chrome, mpv and others.
# Use `playerctld` to always detect the latest player.
# See more here: https://github.com/altdesktop/playerctl/#selecting-players-to-control
PLAYER="spotify"

# Format of the information displayed
# Eg. {{ artist }} - {{ album }} - {{ title }}
# See more attributes here: https://github.com/altdesktop/playerctl/#printing-properties-and-metadata
FORMAT="{{ title }} - {{ artist }}"

PLAYERCTL_STATUS=$(playerctl --player=$PLAYER status 2>/dev/null)
EXIT_CODE=$?

#spotify running
if [ $EXIT_CODE -eq 0 ]; then
    STATUS=$PLAYERCTL_STATUS
    polybar-msg action spotify-prev hook 0 1>/dev/null 2>&1
    polybar-msg action spotify-next hook 0 1>/dev/null 2>&1
    #polybar-msg action spotify-play-pause hook 0 1>/dev/null 2>&1
#spotify not running
else
    STATUS="No player is running"
    polybar-msg action spotify-prev hook 1 1>/dev/null 2>&1
    polybar-msg action spotify-next hook 1 1>/dev/null 2>&1
    polybar-msg action spotify-play-pause hook 2 1>/dev/null 2>&1
fi

#if status is arg send status string of the player
if [ "$1" == "--status" ]; then
    echo "$STATUS"
else #if no arg then set the correct hooks and orders
    if [ "$STATUS" = "Stopped" ]; then
        polybar-msg action spotify-play-pause hook 0 1>/dev/null 2>&1
        echo "No music is playing"

    elif [ "$STATUS" = "Paused"  ]; then
        # show pause button
        # stop scrolling
        polybar-msg action spotify-play-pause hook 0 1>/dev/null 2>&1
        playerctl --player=$PLAYER metadata --format "$FORMAT"
  
    #playing
    elif [ "$STATUS" = "Playing"  ]; then
        # show playing button
        # start scrolling
        polybar-msg action spotify-play-pause hook 1 1>/dev/null 2>&1
        playerctl --player=$PLAYER metadata --format "$FORMAT"
    fi
fi

