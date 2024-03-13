#~/usr/bin/env bash

# initializing wallpaper daemon
hyprpaper &
# connect to the internet
nm-applet --indicator &
blueman-applet &

#start the bar
waybar &

# Notifications
mako
