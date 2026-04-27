{ pkgs }:

pkgs.writeShellScriptBin "toggle-layout" ''
  STATE_FILE="/tmp/hypr-layout-state"

  if [ -f "$STATE_FILE" ]; then
    state=$(cat "$STATE_FILE")
  else
    state="scrolling"
  fi

  if [ "$state" = "dwindle" ]; then
    ${pkgs.hyprland}/bin/hyprctl keyword general:layout scrolling
    sleep 0.3
    ${pkgs.hyprland}/bin/hyprctl dispatch layoutmsg "fit visible"
    echo "scrolling" > "$STATE_FILE"
    ${pkgs.libnotify}/bin/notify-send "Hyprland" "Layout switched to: Scrolling" -t 2000
  else
    ${pkgs.hyprland}/bin/hyprctl keyword general:layout dwindle
    echo "dwindle" > "$STATE_FILE"
    ${pkgs.libnotify}/bin/notify-send "Hyprland" "Layout switched to: Dwindle" -t 2000
  fi
''
