#!/bin/bash

START_DELAY=10
#WATCHED_FILE="/sys/class/backlight/acpi_video0/brightness"
WATCHED_FILE="/sys/class/drm/card0-HDMI-A-1/status"
ACTION_STATE="connected"


OLD_STATE="dummy"

while [ true ]; do
    STATE=$(cat $WATCHED_FILE)
    export DISPLAY=:0.0
    if [ "$OLD_STATE" != "$STATE" ]; then
        if [ "$STATE" == "$ACTION_STATE" ]; then
            echo "sleep 10 - reconnected display: $STATE"
		  for T in $(seq 1 20); do
		    if /usr/bin/xdpyinfo 1> /dev/null 2>&1; then
		      echo "1yes-$T"; break
		    fi
		    echo "1no-$T"; sleep 0.5
		  done

            echo "reconnected display: $STATE"
	    su -c "DISPLAY=:0.0 /usr/bin/xrandr --output HDMI-1 --auto" odroid
            echo "killing kodi: $STATE"
	    pkill kodi
        fi
    fi
    echo "state: $STATE"
    OLD_STATE="$STATE"
    inotifywait -q -e close "$WATCHED_FILE" >/dev/null
done

