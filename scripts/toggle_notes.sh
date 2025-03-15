#!/bin/bash

# Define the window class we're looking for
WINDOW_CLASS="ghostty.notes"

# Find our notes window ID from the full windows list
NOTES_WINDOW_ID=$(niri msg windows | grep -A 3 "Window ID" | grep -B 2 "App ID: \"$WINDOW_CLASS\"" | grep "Window ID" | sed 's/Window ID \([0-9]*\).*:/\1/')

# Get the currently focused window info
FOCUSED_ID=$(niri msg focused-window | head -n 1 | sed 's/Window ID \([0-9]*\).*:/\1/')

if [ -z "$NOTES_WINDOW_ID" ]; then
  # Notes window doesn't exist, create it
  nohup ghostty --class=$WINDOW_CLASS -e bash -c "cd ~/notes && nvim" >/dev/null 2>&1 &
elif [ "$NOTES_WINDOW_ID" = "$FOCUSED_ID" ]; then
  # Notes window is already focused, switch to previous window
  niri msg action focus-window-previous
else
  # Notes window exists but isn't focused, focus it
  niri msg action focus-window --id "$NOTES_WINDOW_ID"
fi
