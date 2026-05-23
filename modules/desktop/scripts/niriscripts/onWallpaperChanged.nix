{ pkgs, ... }:

let
  overview-wallpaper = pkgs.callPackage ./overview-wallpaper.nix {};
  overview-wallpaper-bin = pkgs.lib.getExe overview-wallpaper;
  generate-colour-variables-nvim = pkgs.callPackage ./colourVariablesNvim.nix {};
  generate-colour-variables-nvim-bin = pkgs.lib.getExe generate-colour-variables-nvim;
  generate-colour-variables-ohmyposh = pkgs.callPackage ./colourVariablesOhMyPosh.nix {};
  generate-colour-variables-ohmyposh-bin = pkgs.lib.getExe generate-colour-variables-ohmyposh;
  generate-colour-variables-starship = pkgs.callPackage ./colourVariablesStarship.nix {};
  generate-colour-variables-starship-bin = pkgs.lib.getExe generate-colour-variables-starship;
in

pkgs.writeShellScript "onWallpaperChanged" ''
  #!/usr/bin/env bash

  # Space-separated list of scripts
  SCRIPTS="${overview-wallpaper-bin} ${generate-colour-variables-nvim-bin} ${generate-colour-variables-ohmyposh-bin} ${generate-colour-variables-starship-bin}"

  for script in $SCRIPTS; do
      if [ -x "$script" ]; then
          echo "Running $(basename "$script")..."
          "$script"
      else
          echo "Warning: $(basename "$script") not found or not executable"
      fi
  done
''
