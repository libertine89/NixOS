{ pkgs }:

  pkgs.writeShellScriptBin "wrap-window-workspace-prev" ''
    MIN=1
    MAX=5

    current=$(${pkgs.hyprland}/bin/hyprctl activeworkspace -j | ${pkgs.jq}/bin/jq '.id')

    next=$((current-1))

    if [ "$next" -lt "$MIN" ]; then
      next=$MAX
    fi

    ${pkgs.hyprland}/bin/hyprctl dispatch movetoworkspace "$next"
    ''
