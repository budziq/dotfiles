#!/bin/bash

START_DELAY=5
#WATCHED_FILE="/sys/class/backlight/acpi_video0/brightness"
WATCHED_FILE="/sys/class/drm/card0-HDMI-A-1/status"
ACTION_STATE="connected"
#sleep $START_DELAY


OLD_STATE="dummy"

while [ true ]; do
    STATE=$(cat $WATCHED_FILE)

    if [ "$OLD_STATE" != "$STATE" ]; then
        if [ "$STATE" == "$ACTION_STATE" ]; then
            echo "reconnected display: $STATE"
	    DISPLAY=:0.0 xrandr --output HDMI-1 --auto
        fi
    fi
    echo "state: $STATE"
    OLD_STATE="$STATE"
    inotifywait -q -e close "$WATCHED_FILE" >/dev/null
done

