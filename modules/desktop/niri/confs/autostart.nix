{ ctx, ... }:

let
  inherit (ctx)
  pkgs lib getExe
  bar wallpaper
  dmsWrapper;
in 
''
  spawn-at-startup "${lib.getExe dmsWrapper}"
  spawn-at-startup "${bar}"
  spawn-at-startup "${lib.getExe wallpaper}"
  // spawn-at-startup "swaylock"
  // spawn-at-startup "swayidle"
  // spawn-at-startup "swaync"
  // spawn-at-startup "waypaper" "--restore"

  workspace "1"
  workspace "2"
  workspace "3"
  // workspace "4"
''
