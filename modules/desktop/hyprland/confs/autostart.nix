{ ctx }:

let
  inherit (ctx)
    pkgs lib getExe getExe'
    browser terminal fileManager bar 
    batterynotify wallpaper;
in
{
  exec-once = [
    #"[workspace 1 silent] ${terminal}"
    #"[workspace 5 silent] ${browser}"
    #"[workspace 6 silent] spotify"
    #"[workspace special silent] ${browser} --private-window"
    #"[workspace special silent] ${terminal}"

    "${lib.getExe wallpaper}"
    "${bar}"
    "swaync"
    "nm-applet --indicator"
    # "wl-clipboard-history -t"
    "${getExe' pkgs.wl-clipboard "wl-paste"} --type text --watch cliphist store" # clipboard store text data
    "${getExe' pkgs.wl-clipboard "wl-paste"} --type image --watch cliphist store" # clipboard store image data
    "rm '$XDG_CACHE_HOME/cliphist/db'" # Clear clipboard
    "${getExe batterynotify}" # battery notification
    "polkit-agent-helper-1"
  ];
}
