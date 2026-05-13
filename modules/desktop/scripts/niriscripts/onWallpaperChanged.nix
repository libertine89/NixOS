{ pkgs, ... }:

let
  overview-wallpaper = pkgs.callPackage ./overview-wallpaper.nix {};
  overview-wallpaper-bin = pkgs.lib.getExe overview-wallpaper;
  generate-colour-variables = pkgs.callPackage ./colourVariables.nix {};
  generate-colour-variables-bin = pkgs.lib.getExe generate-colour-variables;
in

pkgs.writeShellScript "onWallpaperChanged" ''
  #!/usr/bin/env bash

  # Space-separated list of scripts
  SCRIPTS="${overview-wallpaper-bin} ${generate-colour-variables-bin}"

  for script in $SCRIPTS; do
      if [ -x "$script" ]; then
          echo "Running $(basename "$script")..."
          "$script"
      else
          echo "Warning: $(basename "$script") not found or not executable"
      fi
  done
''
