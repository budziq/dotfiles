#!/bin/bash
export DISPLAY=:0.0

function connect(){
    xrandr --output HDMI1 --auto --right-of LVDS1
}

function disconnect(){
    xrandr --output HDMI1 --off
}

xrandr | grep "HDMI1 connected" &> /dev/null && connect || disconnect
