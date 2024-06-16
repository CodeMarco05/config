#!/bin/bash

# File to store the current display state
STATE_FILE="$HOME/.config/i3/display_state"

# Read the current state
if [ ! -f $STATE_FILE ]; then
  echo 0 > $STATE_FILE
fi

STATE=$(cat $STATE_FILE)

# Cycle through the states
case $STATE in
  0)
    autorandr --load both && notify-send 'Display setup: Both screens'
    STATE=1
    ;;
  1)
    autorandr --load laptop && notify-send 'Display setup: Laptop only'
    STATE=2
    ;;
  2)
    autorandr --load clamshell && notify-send 'Display setup: Clamshell mode'
    STATE=0
    ;;
  *)
    autorandr --load both && notify-send 'Display setup: Both screens'
    STATE=1
    ;;
esac

# Save the new state
echo $STATE > $STATE_FILE
