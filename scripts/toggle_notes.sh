#!/bin/bash

# Scratchpad-style toggle for the notes window. Niri has no hidden scratchpad
# workspace, so "hidden" means parked on the bottom-most workspace.
# The window rule for this app-id in niri/config.kdl makes it open floating.

WINDOW_CLASS="ghostty.notes"

NOTES=$(niri msg -j windows | jq -c --arg app "$WINDOW_CLASS" 'first(.[] | select(.app_id == $app)) // empty')

if [ -z "$NOTES" ]; then
  nohup ghostty --class=$WINDOW_CLASS -e bash -c "cd ~/notes && nvim" >/dev/null 2>&1 &
  exit 0
fi

NOTES_ID=$(jq -r '.id' <<<"$NOTES")

if [ "$(jq -r '.is_focused' <<<"$NOTES")" = "true" ]; then
  # Hide: an index past the last workspace refers to the bottom (empty) one.
  niri msg action move-window-to-workspace --window-id "$NOTES_ID" --focus false 255
  exit 0
fi

# Show: bring it to the current workspace as a floating window and focus it.
CURRENT_WS_ID=$(niri msg -j workspaces | jq -r 'first(.[] | select(.is_focused)) | .id')
if [ "$(jq -r '.workspace_id' <<<"$NOTES")" != "$CURRENT_WS_ID" ]; then
  CURRENT_WS_IDX=$(niri msg -j workspaces | jq -r 'first(.[] | select(.is_focused)) | .idx')
  niri msg action move-window-to-workspace --window-id "$NOTES_ID" --focus false "$CURRENT_WS_IDX"
fi
niri msg action focus-window --id "$NOTES_ID"
if [ "$(jq -r '.is_floating' <<<"$NOTES")" != "true" ]; then
  niri msg action move-window-to-floating
fi
