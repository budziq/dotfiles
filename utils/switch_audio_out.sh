#!/bin/bash

if pacmd list-cards | grep active | grep hdmi 1>/dev/null; then
    echo "hdmi -> analog"
    #set analog out
    pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo 1>/dev/null
    notify-send -u critical -i audio-volume-medium-symbolic "Analog audio active"
else
    echo "analog -> hdmi"
    #set hdmi out
    pacmd set-card-profile 0 output:hdmi-stereo+input:analog-stereo 1>/dev/null
    notify-send -u critical -i audio-volume-medium-symbolic "HDMI audio active"
fi


