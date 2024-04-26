#!/usr/bin/env bash

# *** Exec Commands ***

# Env variables
systemctl --user import-environment DISPLAY WAYLAND_DISPLAY &

# Notifications
riverctl spawn "mako"

# Flux/Redshift alternative
source ../wlsunset/location.sh # Don't dox me
riverctl spawn "wlsunset -l $lat -L $long"

# Wallpaper
riverctl spawn "swaybg --image ~/Pictures/Desktop/background.jpg -m fill"

# Bar
riverctl spawn "waybar -b bar"

# Wayland display management (Scaling, etc)
riverctl spawn "way-displays >/tmp/way-displays."${XDG_VTNR}"."${USER}".log 2>&1"
