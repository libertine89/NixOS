{ pkgs, ... }:
let
  flakePath = "$HOME/ZyNixOS/flake.nix";
in
pkgs.writeShellScriptBin "keybinds-yad" ''
  if ${pkgs.procps}/bin/pidof rofi >/dev/null; then
    ${pkgs.procps}/bin/pkill rofi
  fi

  if ${pkgs.procps}/bin/pidof yad >/dev/null; then
    ${pkgs.procps}/bin/pkill yad
  fi

  get_nix_value() {
    ${pkgs.gawk}/bin/awk '
    /settings = {/ {inside_settings=1; next}
    inside_settings && /}/ {inside_settings=0}
    inside_settings && $0 ~ key {print gensub(/.*"([^"]+)".*/, "\\1", "g", $0)}
    ' key="$1" "${flakePath}"
  }

  _browser=$(get_nix_value "browser =")
  _terminal=$(get_nix_value "terminal =")
  _fileManager=$(get_nix_value "fileManager =")

  ${pkgs.yad}/bin/yad \
    --center \
    --title="Hyprland Keybinds" \
    --no-buttons \
    --list \
    --width=745 \
    --height=920 \
    --column=Key: \
    --column=Description: \
    --column=Command: \
    --timeout-indicator=bottom \


    "SUPER CTRL SHIFT B" "Rebuild system" "$_terminal -e rebuild" \
    "SUPER CTRL SHIFT U" "Update system" "$_terminal -e update" \
    "SUPER CTRL SHIFT R" "Reload Hyprland" "hyprctl reload" \


    "SUPER /" "Keybinds menu" "keybinds-yad" \
    "SUPER ?" "Keybinds menu" "keybinds-yad" \
    "SUPER CTRL K" "Keybinds menu" "keybinds-yad" \

    "SUPER Return" "Launch terminal" "$_terminal" \
    "SUPER CTRL Return" "Toggle quake terminal" "togglespecialworkspace quake" \
    "SUPER E" "File manager" "$_fileManager" \
    "SUPER C" "Editor" "$editor" \
    "SUPER B" "Browser" "$_browser" \
    "SUPER SHIFT S" "Spotify" "spotify" \
    "SUPER SHIFT Y" "YouTube Music" "youtube-music" \
    "CTRL ALT Delete" "System monitor" "$_terminal -e btop" \
    "CTRL ALT M" "Microfetch" "$_terminal --class microfetch --hold -e microfetch" \
    "SUPER CTRL C" "Colour picker" "hyprpicker --autocopy --format=hex" \

    "SUPER A" "App launcher" "launcher drun" \
    "SUPER SPACE" "App launcher" "launcher drun" \
    "SUPER SHIFT W" "Wallpaper menu" "launcher wallpaper" \
    "SUPER Z" "Emoji picker" "launcher emoji" \
    "SUPER SHIFT T" "Tmux sessions" "launcher tmux" \
    "SUPER G" "Game launcher" "launcher games" \

    "SUPER F9" "Enable night mode" "hyprsunset --temperature 2500" \
    "SUPER F10" "Disable night mode" "pkill hyprsunset" \
    "CTRL L" "Lock screen" "hyprlock" \
    "SUPER Backspace" "Power menu" "wlogout -b 4" \
    "CTRL Escape" "Toggle bar" "pkill waybar|hyprpanel|noctalia-shell|caelestia-shell|.quickshell || waybar" \

    "SUPER Q" "Close window" "killactive" \
    "ALT F4" "Force close window" "forcekillactive" \
    "SUPER Delete" "Exit Hyprland" "exit" \
    "SUPER W" "Toggle floating" "togglefloating" \
    "SUPER SHIFT G" "Toggle group" "togglegroup" \
    "SUPER T" "Toggle layout" "toggle-layout" \
    "SUPER F" "Fullscreen" "fullscreen" \
    "SUPER M" "Maximise window" "fullscreen 1" \

    "SUPER CTRL Mouse Down" "Zoom in" "zoom in" \
    "SUPER CTRL Mouse Up" "Zoom out" "zoom out" \
    "CTRL =" "Zoom in" "zoom in" \
    "CTRL -" "Zoom out" "zoom out" \

    "SUPER SHIFT N" "Notifications panel" "swaync-client -t -sw" \
    "SUPER SHIFT Q" "Notifications panel" "swaync-client -t -sw" \
    "SUPER ALT K" "Keyboard layout" "keyboardswitch" \
    "SUPER ALT G" "Game mode" "gamemode" \
    "SUPER V" "Clipboard manager" "clipmanager" \

    "SUPER SHIFT R" "Record area" "screen-record a" \
    "SUPER CTRL R" "Record monitor" "screen-record m" \
    "SUPER P" "Screenshot area" "screenshot s" \
    "SUPER CTRL P" "Screenshot frozen" "screenshot sf" \
    "SUPER Print" "Screenshot monitor" "screenshot m" \
    "SUPER ALT P" "Screenshot all" "screenshot p" \

    "XF86AudioMicMute" "Mute mic" "pamixer --default-source -t" \
    "XF86AudioMute" "Mute audio" "pamixer -t" \
    "XF86AudioPlay" "Play/Pause" "playerctl play-pause" \
    "XF86AudioPause" "Play/Pause" "playerctl play-pause" \
    "XF86AudioNext" "Next track" "playerctl next" \
    "XF86AudioPrev" "Previous track" "playerctl previous" \

    "XF86MonBrightnessDown" "Brightness -" "brightnessctl set 2%-" \
    "XF86MonBrightnessUp" "Brightness +" "brightnessctl set +2%" \
    "XF86AudioLowerVolume" "Volume -" "pamixer -d 2" \
    "XF86AudioRaiseVolume" "Volume +" "pamixer -i 2" \

    "SUPER ←" "Focus left" "movefocus l" \
    "SUPER →" "Focus right" "movefocus r" \
    "SUPER ↑" "Focus up" "movefocus u" \
    "SUPER ↓" "Focus down" "movefocus d" \
    "SUPER H" "Focus left (vim)" "movefocus l" \
    "SUPER L" "Focus right (vim)" "movefocus r" \
    "SUPER K" "Focus up (vim)" "movefocus u" \
    "SUPER J" "Focus down (vim)" "movefocus d" \
    "ALT Tab" "Focus down" "movefocus d" \

    "SUPER SHIFT ←" "Move window left" "movewindow l" \
    "SUPER SHIFT →" "Move window right" "movewindow r" \
    "SUPER SHIFT ↑" "Move window up" "movewindow u" \
    "SUPER SHIFT ↓" "Move window down" "movewindow d" \
    "SUPER SHIFT H" "Move window left (vim)" "movewindow l" \
    "SUPER SHIFT L" "Move window right (vim)" "movewindow r" \
    "SUPER SHIFT K" "Move window up (vim)" "movewindow u" \
    "SUPER SHIFT J" "Move window down (vim)" "movewindow d" \

    "SUPER CTRL →" "Next workspace" "wrap-workspaces-next" \
    "SUPER CTRL ←" "Previous workspace" "wrap-workspaces-prev" \
    "SUPER CTRL ↓" "Empty workspace" "workspace empty" \
    "SUPER 1-0" "Switch to workspace 1-10" "workspace 1-10" \

    "SUPER CTRL SHIFT →" "Send window next workspace" "wrap-window-workspace-next" \
    "SUPER CTRL SHIFT ←" "Send window prev workspace" "wrap-window-workspace-prev" \
    "SUPER SHIFT 1-0" "Move to workspace 1-10" "movetoworkspace 1-10"

    "SUPER CTRL S" "Send to scratchpad" "movetoworkspacesilent special" \
    "SUPER ALT S" "Send to scratchpad" "movetoworkspacesilent special" \
    "SUPER S" "Toggle scratchpad" "togglespecialworkspace" \

    "SUPER ." "Move column right" "layoutmsg move +col" \
    "SUPER ," "Move column left" "layoutmsg move -col" \

    "SUPER Tab" "Next window" "cyclenext" \
    "SUPER Tab" "Bring to top" "bringactivetotop" \

    "SUPER + Left Click" "Move window" "movewindow" \
    "SUPER + Right Click" "Resize window" "resizewindow"
''



