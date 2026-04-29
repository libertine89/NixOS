{ pkgs }:

pkgs.writeShellScriptBin "toggle-kitty-quake" ''
  #!/usr/bin/env bash

  CLASS="kitty-quake"

  WIN_ID=$(hyprctl clients -j | jq -r ".[] | select(.class==\"$CLASS\") | .address")

  if [ -z "$WIN_ID" ] then
    kitty --class $CLASS &
    exit 0
  fi

  POS_Y=$(hyprctl clients -j | jq -r ".[] | select(.class==\"$CLASS\") | .at[1]")

  if [ "$POS_Y" -lt 0 ]; then 
    hyprctl dispatch movewindowpixel exact 12 60,address:$WIN_ID
    hyprctl dispatch focuswindow address:$WIN_ID
  else
    hyprctl dispatch movewindowpixel exact 12 -600,address:$WIN_ID
    # sleep 0.25
    # hyprctl dispatch closewindow address:$WIN_ID
  fi
''
