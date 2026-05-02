{pkgs}:

pkgs.writeShellScriptBin "exec-once-kitty-quake" ''
  #!${pkgs.bash}/bin/env bash

  CLASS="kitty-quake"

  WIN_ID=$(hyprctl clients -j | ${pkgs.jq}/bin/jq -r \
    '.[] | select(.class=="'"$CLASS"'" or .initialClass=="'"$CLASS"'") | .address' | head -n1)

  if [ -z "$WIN_ID" ]; then
    hyprctl dispatch exec "kitty --class kitty-quake"
    sleep 0.2
    hyprctl dispatch focuswindow class:"kitty-quake"
    hyprctl dispatch setfloating
    hyprctl dispatch resizeactive exact 600 400
    sleep 0.05
    hyprctl dispatch moveactive exact 12 60
  fi
''
