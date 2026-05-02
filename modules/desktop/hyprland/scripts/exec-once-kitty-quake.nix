{ pkgs }:

pkgs.writeShellScriptBin "exec-once-kitty-quake" ''
  #!${pkgs.bash}/bin/env bash

  CLASS="kitty-quake"

  WIN_ID=$(hyprctl clients -j | ${pkgs.jq}/bin/jq -r \
    '.[] | select(.initialClass=="'"$CLASS"'") | .address' | head -n1)

  if [ -z "$WIN_ID" ]; then
    hyprctl dispatch exec "kitty --class kitty-quake" &
    exit 0
  fi
''
