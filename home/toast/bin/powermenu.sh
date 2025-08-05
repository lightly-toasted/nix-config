#!/usr/bin/env bash
choice=$(printf """
󰍃 Logout
⏻ Shutdown
 Reboot
 Suspend
 Hibernate
""" | tofi)

case "$choice" in
  "󰍃 Logout") uwsm stop ;;
  "⏻ Shutdown") systemctl poweroff ;;
  " Reboot")  systemctl reboot ;;
  " Suspend") systemctl suspend ;;
  " Hibernate") systemctl hibernate ;;
esac
