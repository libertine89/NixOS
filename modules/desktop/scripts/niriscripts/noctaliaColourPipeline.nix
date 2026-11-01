# Noctalia v5 colour pipeline:
#   wallpaper -> v5 palette (faithful) -> legacy colors.json
#             -> nvim lua variables + starship.toml palette
#
# Used by the noctalia-v5 bar module's [hooks] (started, wallpaper_changed,
# colors_changed). The v4 equivalent is noctaliaOnWallpaperChanged.nix.
{ pkgs, ... }:

let
  export =
    pkgs.callPackage ./noctaliaColourExport.nix { };

  nvimGen =
    pkgs.callPackage ./noctaliaColourVariablesNvim.nix { };

  starshipGen =
    pkgs.callPackage ./noctaliaColourVariablesStarship.nix { };
in

pkgs.writeShellScript "noctaliaColourPipeline" ''
  #!/usr/bin/env bash

  # Best-effort by design: a missing daemon or stale colours.json must never
  # block Noctalia's own hooks.
  run() {
      if ! "$@"; then
          echo "[noctalia pipeline] step failed: $1" >&2
      fi
  }

  run ${export}/bin/noctalia-colours-export
  run ${nvimGen}/bin/generate-color-variables-noctalia-nvim     && echo "[noctalia pipeline] nvim colours updated"
  run ${starshipGen}/bin/generate-color-variables-noctalia-starship && echo "[noctalia pipeline] starship colours updated"
''
