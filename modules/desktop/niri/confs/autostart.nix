{ ctx, ... }:

let
  inherit (ctx)
  pkgs lib getExe
  bar wallpaper colourVariables windowBehaviour;

  dmsWrapper = ctx.dmsWrapper or null;
in
''
  ${lib.optionalString (dmsWrapper != null) ''
    spawn-at-startup "${lib.getExe dmsWrapper}"
    spawn-at-startup "${lib.getExe colourVariables}"
    spawn-at-startup "${lib.getExe windowBehaviour}"
  ''}
  ${lib.optionalString (bar != "dms-shell") ''
    spawn-at-startup "${bar}"
    spawn-at-startup "${lib.getExe wallpaper}"
  ''}

  // spawn-at-startup "swaylock"
  // spawn-at-startup "swayidle"
  // spawn-at-startup "swaync"
  // spawn-at-startup "waypaper" "--restore"

  workspace "1"
  workspace "2"
  workspace "3"
  // workspace "4"
''
