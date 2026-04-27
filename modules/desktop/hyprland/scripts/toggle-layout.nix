{ pkgs }:

pkgs.writeShellScriptBin "toggle-layout" ''
  current_layout=$(${pkgs.hyprland}/bin/hyprctl getoption general:layout | 
    ${pkgs.gnugrep}/bin/grep 'str:' | 
  ${pkgs.gawk}/bing/awk '{print $2}')

  if [ "$current_layout" = "dwindle" ]; then
    ${pkgs.hyprland}/bin/hyprctl keyword general:layout scrolling
    sleep 0.3
    ${pkgs.hyprland}/bin/hyprctl dispatch layoutmsg "fit visible"
    ${pkgs.libnotify}/bin/notify-send "Hyprland" "Layout switched to: Scrolling" -t 2000
  else
    ${pkgs.hyprland}/bin/hyprctl keyword general:layout dwindle
    ${pkgs.libnotify}/bin/notify-send "Hyprland" "Layout switched to: dwindle" -t 2000
  fi
''
