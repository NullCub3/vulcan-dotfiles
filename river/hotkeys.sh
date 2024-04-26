#!/usr/bin/env bash
# *** Hotkeys Setup and Config **

# Start SWHKD
#killall swhks
#swhks &
#pkexec swhkd -d --device "Apple Inc. Apple Internal Keyboard / Trackpad" &

# ******************
# ***  Keybinds  ***
# ******************

# *** Program Shortcuts ***

riverctl map normal Super+Shift Return spawn 'alacritty'
riverctl map normal Super Space spawn 'fuzzel'
riverctl map normal Alt Space spawn 'fuzzel'
#riverctl map normal Super+Shift S spawn 'grim -g "$(slurp)" - | wl-copy -t image/png'

# *** Media Keys ***

# Various media key mapping examples for both normal and locked mode which do not have a modifier
for mode in normal locked; do
	# Eject the optical drive (well if you still have one that is)
	riverctl map $mode None XF86Eject spawn 'eject -T'

	# Control pulse audio volume with pamixer (https://github.com/cdemoulins/pamixer)
	riverctl map $mode None XF86AudioRaiseVolume spawn 'pamixer -i 5'
	riverctl map $mode None XF86AudioLowerVolume spawn 'pamixer -d 5'
	riverctl map $mode None XF86AudioMute spawn 'pamixer --toggle-mute'

	# Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
	riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
	riverctl map $mode None XF86AudioPlay spawn 'playerctl play-pause'
	riverctl map $mode None XF86AudioPrev spawn 'playerctl previous'
	riverctl map $mode None XF86AudioNext spawn 'playerctl next'

	# Control screen backlight brightness with light (https://github.com/haikarainen/light)
	riverctl map $mode None XF86MonBrightnessUp spawn 'brillo -lA 2'
	riverctl map $mode None XF86MonBrightnessDown spawn 'brillo -lU 2'

	riverctl map $mode None XF86KbdBrightnessUp spawn 'brillo -kA 5'
	riverctl map $mode None XF86KbdBrightnessDown spawn 'brillo -kU 5'
done

# *** Window Management ***

# Super+Shift+Q to close the focused view
riverctl map normal Super+Shift Q close
# Super+Alt+Shift+Escape to exit river
riverctl map normal Super+Alt+Shift Escape exit
# Super+J and Super+K to focus the next/previous view in the layout stack
riverctl map normal Alt J focus-view next
riverctl map normal Alt K focus-view previous
# Alt+Shift+J and Alt+Shift+K to swap the focused view with the next/previous view in the layout stack
riverctl map normal Alt+Shift J swap next
riverctl map normal Alt+Shift K swap previous
# Alt+Period and Super+Comma to focus the next/previous output
riverctl map normal Alt Period focus-output next
riverctl map normal Alt Comma focus-output previous
# Alt+Shift+{Period,Comma} to send the focused view to the next/previous output
riverctl map normal Alt+Shift Period send-to-output next
riverctl map normal Alt+Shift Comma send-to-output previous
# Alt+Return to bump the focused view to the top of the layout stack
riverctl map normal Alt Return zoom

# *** Layout Management ***

# Super+{Up,Right,Down,Left} to change layout orientation
riverctl map normal Super Up send-layout-cmd rivertile "main-location top"
riverctl map normal Super Right send-layout-cmd rivertile "main-location right"
riverctl map normal Super Down send-layout-cmd rivertile "main-location bottom"
riverctl map normal Super Left send-layout-cmd rivertile "main-location left"

# Alt+H and Super+L to decrease/increase the main ratio of rivertile(1)
riverctl map normal Alt H send-layout-cmd rivertile "main-ratio -0.05"
riverctl map normal Alt L send-layout-cmd rivertile "main-ratio +0.05"
# Alt+Shift+H and Super+Shift+L to increment/decrement the main count of rivertile(1)
riverctl map normal Alt+Shift H send-layout-cmd rivertile "main-count +1"
riverctl map normal Alt+Shift L send-layout-cmd rivertile "main-count -1"

# *** Floating Windows ***

# Super+Alt+{H,J,K,L} to move views
riverctl map normal Super+Alt H move left 100
riverctl map normal Super+Alt J move down 100
riverctl map normal Super+Alt K move up 100
riverctl map normal Super+Alt L move right 100
# Super+Alt+Control+{H,J,K,L} to snap views to screen edges
riverctl map normal Super+Alt+Control H snap left
riverctl map normal Super+Alt+Control J snap down
riverctl map normal Super+Alt+Control K snap up
riverctl map normal Super+Alt+Control L snap right
# Super+Alt+Shift+{H,J,K,L} to resize views
riverctl map normal Super+Alt+Shift H resize horizontal -100
riverctl map normal Super+Alt+Shift J resize vertical 100
riverctl map normal Super+Alt+Shift K resize vertical -100
riverctl map normal Super+Alt+Shift L resize horizontal 100

# Super + Left Mouse Button to move views
riverctl map-pointer normal Super BTN_LEFT move-view
# Super + Right Mouse Button to resize views
riverctl map-pointer normal Super BTN_RIGHT resize-view
# Super + Middle Mouse Button to toggle float
riverctl map-pointer normal Super BTN_MIDDLE toggle-float

# Super+Shift+F to toggle float
riverctl map normal Super+Shift F toggle-float

# Super+F11 to toggle fullscreen
riverctl map normal Super F11 toggle-fullscreen

# *** Tag Management ***

riverctl map normal Alt Tab focus-previous-tags

for i in $(seq 1 9); do
	tags=$((1 << (i - 1)))

	# Alt+[1-9] to focus tag [0-8]
	riverctl map normal Alt "$i" set-focused-tags "$tags"

	# Alt+Shift+[1-9] to tag focused view with tag [0-8]
	riverctl map normal Alt+Shift "$i" set-view-tags "$tags"

	# Alt+Control+[1-9] to toggle focus of tag [0-8]
	riverctl map normal Alt+Control "$i" toggle-focused-tags $tags

	# Alt+Shift+Control+[1-9] to toggle tag [0-8] of focused view
	riverctl map normal Alt+Shift+Control "$i" toggle-view-tags "$tags"
done

# Alt+0 to focus all tags
# Alt+Shift+0 to tag focused view with all tags
all_tags=$(((1 << 32) - 1))
riverctl map normal Alt 0 set-focused-tags $all_tags
riverctl map normal Alt+Shift 0 set-view-tags $all_tags
