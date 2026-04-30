{ ctx }:

let
  inherit (ctx)
    pkgs lib getExe getExe'
    browser terminal fileManager bar
    keybinds-yad toggle-layout wrap-workspaces-next
    wrap-workspaces-prev zoom gamemode clipmanager
    screen-record screenshot keyboardswitch fileManagerScript;
in
{
  ### === Singluar Binds === ###
  bind = [
    # Rebuild/Update NixOS, Restart hyprland with a KeyBind
    "$mainMod, CTRL, SHIFT, B, exec, $term -e rebuild"
    "$mainMod, CTRL, SHIFT, U, exec, -e update"
    "$mainMod, CTRL, SHIFT, R, exec, $term hyprctl reload"

    # Keybinds help menu
    "$mainMod, question, exec, ${getExe keybinds-yad}"
    "$mainMod, slash, exec, ${getExe keybinds-yad}"
    "$mainMod CTRL, K, exec, ${getExe keybinds-yad}"

    # Night Mode (lower value means warmer temp)
    "$mainMod, F9, exec, ${getExe pkgs.hyprsunset} --temperature 2500" # good values: 3500, 3000, 2500
    "$mainMod, F10, exec, pkill hyprsunset"

    # Window/Session actions
    "$mainMod, Q, killactive"
    "ALT, F4, forcekillactive"
    "$mainMod, delete, exit" # kill hyperland session
    "$mainMod, W, togglefloating" # toggle the window on focus to float
    "$mainMod SHIFT, G, togglegroup" # toggle the window on focus to float
    "$mainMod, T, exec, ${getExe toggle-layout}"
    "$mainMod, F, fullscreen" # toggle the window on focus to fullscreen
    "$mainMod, M, fullscreen, 1" # Set focus maximised
    "$CONTROL, L, exec, hyprlock" # lock screen
    "$mainMod, backspace, exec, pkill -x wlogout || wlogout -b 4" # logout menu
    "$CONTROL, ESCAPE, exec, pkill \"waybar|hyprpanel|noctalia-shell|caelestia-shell|.quickshell\" || ${bar}" # toggle bar
    "$mainMod CTRL, mouse_down, exec, ${getExe zoom} in" # zoom in
    "$mainMod CTRL, mouse_up, exec, ${getExe zoom} out" # zoom out
    "$CONTROL, equal, exec, ${getExe zoom} in" # zoom in
    "$CONTROL, minus, exec, ${getExe zoom} out" # zoom out

    # Applications/Programs
    "$mainMod, Return, exec, $term"
    "$mainMod CTRL, Return, togglespecialworkspace, quake" # kitty --class kitty-quake"
    "$mainMod, E, exec, ${getExe fileManagerScript} ${fileManager}"
    "$mainMod, C, exec, $editor"
    "$mainMod, B, exec, $browser"
    "$mainMod SHIFT, S, exec, spotify"
    "$mainMod SHIFT, Y, exec, youtube-music"
    "$CONTROL ALT, DELETE, exec, $term -e '${getExe pkgs.btop}'" # System Monitor
    "$CONTROL ALT, M, exec, $term --class \"microfetch\" --hold -e microfetch" # System Monitor
    "$mainMod CTRL, C, exec, ${getExe pkgs.hyprpicker} --autocopy --format=hex" # Colour Picker

    "$mainMod, A, exec, launcher drun" # launch desktop applications
    "$mainMod, SPACE, exec, launcher drun" # launch desktop applications
    "$mainMod SHIFT, W, exec, launcher wallpaper" # launch wallpaper switcher
    "$mainMod, Z, exec, launcher emoji" # launch emoji picker
    "$mainMod SHIFT, T, exec, launcher tmux" # launch tmux sessions
    "$mainMod, G, exec, launcher games" # game launcher
    # "$mainMod, tab, exec, launcher window" # switch between desktop applications

    "$mainMod ALT, K, exec, ${getExe keyboardswitch}" # change keyboard layout
    "$mainMod SHIFT, N, exec, swaync-client -t -sw" # swayNC panel
    "$mainMod SHIFT, Q, exec, swaync-client -t -sw" # swayNC panel
    "$mainMod ALT, G, exec, ${getExe gamemode}" # disable hypr effects for gamemode
    "$mainMod, V, exec, ${getExe clipmanager}" # Clipboard Manager
  
    # Screenshot/Screencapture
    "$mainMod SHIFT, R, exec, ${getExe screen-record} a" # Screen Record (area select)
    "$mainMod CTRL, R, exec, ${getExe screen-record} m" # Screen Record (monitor select)
    "$mainMod, P, exec, ${getExe screenshot} s" # drag to snip an area / click on a window to print it
    "$mainMod CTRL, P, exec, ${getExe screenshot} sf" # frozen screen, drag to snip an area / click on a window to print it
    "$mainMod, print, exec, ${getExe screenshot} m" # print focused monitor
    "$mainMod ALT, P, exec, ${getExe screenshot} p" # print all monitor outputs

    # Functional keybinds
    ",xf86Sleep, exec, systemctl suspend" # Put computer into sleep mode
    ",XF86AudioMicMute,exec,${pkgs.pamixer}/bin/pamixer --default-source -t" # mute mic
    ",XF86AudioMute,exec,${pkgs.pamixer}/bin/pamixer -t" # mute audio
    ",XF86AudioPlay,exec,${pkgs.playerctl}/bin/playerctl play-pause" # Play/Pause media
    ",XF86AudioPause,exec,${pkgs.playerctl}/bin/playerctl play-pause" # Play/Pause media
    ",xf86AudioNext,exec,${pkgs.playerctl}/bin/playerctl next" # go to next media
    ",xf86AudioPrev,exec,${pkgs.playerctl}/bin/playerctl previous" # go to previous media

    # ",xf86AudioNext,exec,${getExe mediactrl} next" # go to next media
    # ",xf86AudioPrev,exec,${getExe mediactrl} previous" # go to previous media
    # ",XF86AudioPlay,exec,${getExe mediactrl} play-pause" # go to next media
    # ",XF86AudioPause,exec,${getExe mediactrl} play-pause" # go to next media

    ### === Focus Movement === ###
    # Move focus with mainMod + arrow keys
    "$mainMod, left, movefocus, l"
    "$mainMod, right, movefocus, r"
    "$mainMod, up, movefocus, u"
    "$mainMod, down, movefocus, d"
    "ALT, Tab, movefocus, d"

    # Move focus with mainMod + HJKL keys
    "$mainMod, h, movefocus, l"
    "$mainMod, l, movefocus, r"
    "$mainMod, k, movefocus, u"
    "$mainMod, j, movefocus, d"

    # to switch between windows in a floating workspace
    "$mainMod, Tab, cyclenext"
    "$mainMod, Tab, bringactivetotop"

    ### === Window Movement === ###
    # Move active window around current workspace with mainMod + SHIFT [←→↑↓]
    "$mainMod SHIFT, left, movewindow, l"
    "$mainMod SHIFT, right, movewindow, r"
    "$mainMod SHIFT, up, movewindow, u"
    "$mainMod SHIFT, down, movewindow, d"

    # Move active window around current workspace with mainMod + SHIFT [HLJK]
    "$mainMod SHIFT, H, movewindow, l"
    "$mainMod SHIFT, L, movewindow, r"
    "$mainMod SHIFT, K, movewindow, u"
    "$mainMod SHIFT, J, movewindow, d"

    # Move active window to a relative workspace with mainMod + CTRL + ALT + [←→]
    "$mainMod CTRL SHIFT, right, movetoworkspace, r+1"
    "$mainMod CTRL SHIFT, left, movetoworkspace, r-1"

    # Switch scrolling columns
    "$mainMod, period, layoutmsg, move +col"
    "$mainMod, comma, layoutmsg, move -col"

    ### === Workspace Movement === ###
    # Switch workspaces relative to the active workspace with mainMod + CTRL + [←→]
    "$mainMod CTRL, right, exec, ${getExe wrap-workspaces-next}"
    "$mainMod CTRL, left, exec, ${getExe wrap-workspaces-prev}"
    "$mainMod CTRL, L, exec, ${getExe wrap-workspaces-next}"
    "$mainMod CTRL, H, exec, ${getExe wrap-workspaces-prev}"

    # move to the first empty workspace instantly with mainMod + CTRL + [↓]
    "$mainMod CTRL, down, workspace, empty"

    ### === Special workspaces === ###
    "$mainMod CTRL, S, movetoworkspacesilent, special"
    "$mainMod ALT, S, movetoworkspacesilent, special"
    "$mainMod, S, togglespecialworkspace,"
  ];

  ### === Repeating Binds === ###          
  binde = [
    # Resize windows Tiling
    "$mainMod, equal, resizeactive, 10 0"
    "$mainMod, minus, resizeactive, -10 0"

    # Resize windows Scrolling
    "$mainMod, equal, layoutmsg, colresize +conf"
    "$mainMod, minus, layoutmsg, colresize -conf"
    "$mainMod SHIFT, equal, resizeactive, 0 10"
    "$mainMod SHIFT, minus, resizeactive, 0 -10"

    # Functional keybinds
    ",XF86MonBrightnessDown,exec,${pkgs.brightnessctl}/bin/brightnessctl set 2%-"
    ",XF86MonBrightnessUp,exec,${pkgs.brightnessctl}/bin/brightnessctl set +2%"
    ",XF86AudioLowerVolume,exec,${pkgs.pamixer}/bin/pamixer -d 2"
    ",XF86AudioRaiseVolume,exec,${pkgs.pamixer}/bin/pamixer -i 2"
  ];

  ### === Mouse Binds === ###
  bindm = [
    # Move/Resize windows with mainMod + LMB/RMB and dragging
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];
}
