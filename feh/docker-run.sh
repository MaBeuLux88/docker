#!/usr/bin/env bash
docker run --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v $XAUTHORITY:/.Xauthority -e XAUTHORITY=/.Xauthority -e DISPLAY -v /home/polux/Pictures/wallpaper:/wallpaper --hostname hafx mabeulux88/feh --bg-tile /wallpaper/wallpaper.png
