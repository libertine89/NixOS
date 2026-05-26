{ ctx, ... }:

let
  inherit (ctx)
  pkgs lib getExe
  bar wallpaper windowBehaviour
  colourVariablesNvim colourVariablesOhMyPosh colourVariablesStarship;

  dmsWrapper = ctx.dmsWrapper or null;
in
''
  ${lib.optionalString (dmsWrapper != null) ''
    spawn-at-startup "${lib.getExe dmsWrapper}"
    spawn-at-startup "${lib.getExe colourVariablesNvim}"
    spawn-at-startup "${lib.getExe colourVariablesOhMyPosh}"
    spawn-at-startup "${lib.getExe colourVariablesStarship}"
    spawn-at-startup "${lib.getExe windowBehaviour}"
  ''}
  ${lib.optionalString (bar != "dms-shell") ''
    spawn-at-startup "${bar}"
    //spawn-at-startup "${lib.getExe wallpaper}"
    spawn-at-startup "${lib.getExe windowBehaviour}"
  ''}

  // spawn-at-startup "swaylock"
  // spawn-at-startup "swayidle"
  // spawn-at-startup "swaync"
  // spawn-at-startup "waypaper" "--restore"

  workspace "1"
  workspace "2"
  workspace "3"
  workspace "4"
''
