{ pkgs }:

pkgs.writeShellScriptBin "toggle-kitty-quake" ''
  #!${pkgs.bash}/bin/env bash

  CLASS="kitty-quake"

  WIN_ID=$(hyprctl clients -j | ${pkgs.jq}/bin/jq -r \
    '.[] | select(.initialClass=="'"$CLASS"'") | .address' | head -n1)

  if [ -z "$WIN_ID" ]; then
    hyprctl dispatch exec "kitty --class kitty-quake" &
    exit 0
  fi


  POS_Y=$(hyprctl clients -j | ${pkgs.jq}/bin/jq -r \
    '.[] | select(.initialClass=="'"$CLASS"'") | .at[1]' | head -n1)
  
    hyprctl dispatch focuswindow address:$WIN_ID
    sleep 0.5

  if [ "$POS_Y" -lt 50 ]; then 
    hyprctl dispatch movewindowpixel exact 12 60 
  else
    hyprctl dispatch movewindowpixel exact 12 -600
  fi
''
