{ pkgs }:
 
  pkgs.writeShellScriptBin "wrap-window-workspaces-next" ''
    MIN=1
    MAX=5

    current=$(${pkgs.hyprland}/bin/hyprctl activeworkspace -j | ${pkgs.jq}/bin/jq '.id')

    next=$((current+1))

    if [ "$next" -gt "$MAX" ]; then
      next=$MIN
    fi

    ${pkgs.hyprland}/bin/hyprctl dispatch movetoworkspace "$next"
    ''
