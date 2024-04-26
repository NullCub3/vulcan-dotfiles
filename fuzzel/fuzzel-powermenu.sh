#!/bin/bash

# SELECTION="$(printf "1 - Lock\n2 - Suspend\n3 - Log out\n4 - Reboot\n5 - Reboot to UEFI\n6 - Hard reboot\n7 - Shutdown" | fuzzel --dmenu -l 7 -p "Power Menu: ")"
# SELECTION="$(printf "󰒲 Suspend\n󰍃 Log out\n󰜉 Reboot\n Reboot to UEFI\n⏻ Shutdown" | fuzzel --dmenu -l 5 -p "Power Menu: ")"
SELECTION="$(printf "󰍃 Log out\n󰜉 Reboot\n Reboot to UEFI\n⏻ Shutdown" | fuzzel --dmenu -l 4 -p "󰐦 Power: ")"

case $SELECTION in
# *"Lock")
# 	swaylock
# 	;;
# *"Suspend")
# 	systemctl suspend
# 	;;
*"Log out")
	riverctl exit
	;;
*"Reboot")
	systemctl reboot
	;;
*"Reboot to UEFI")
	systemctl reboot --firmware-setup
	;;
# *"Hard reboot")
# 	pkexec "echo b > /proc/sysrq-trigger"
# 	;;
*"Shutdown")
	systemctl poweroff
	;;
esac
