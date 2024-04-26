#!/usr/bin/env bash
# *** Input Settings ***

# Set keyboard repeat rate
riverctl set-repeat 25 300

# Mouse Settings
# Disable mouse acceleration on external mouse:
riverctl input pointer-1133-16505-Logitech_G_Pro accel-profile flat

# Warp the cursor when changing displays
riverctl set-cursor-warp on-output-change
riverctl focus-follows-cursor normal

# Hide cursor while typing
riverctl hide-cursor when-typing enabled
