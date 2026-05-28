{ pkgs, ... }:

let
  generate-colour-variables-noctalia-nvim =
    pkgs.callPackage ./noctaliaColourVariablesNvim.nix {};

  generate-colour-variables-noctalia-starship =
    pkgs.callPackage ./noctaliaColourVariablesStarship.nix {};
in

pkgs.writeShellScript "noctaliaOnWallpaperChanged" ''
  #!/usr/bin/env bash

  # Space-separated list of scripts
  SCRIPTS="${pkgs.lib.getExe generate-colour-variables-noctalia-nvim} ${pkgs.lib.getExe generate-colour-variables-noctalia-starship}"

  for script in $SCRIPTS; do
      if [ -x "$script" ]; then
          echo "Running $(basename "$script")..."
          "$script"
      else
          echo "Warning: $(basename "$script") not found or not executable"
      fi
  done
''
