
{ pkgs, ... }:

let
  generate-colour-variables-noctalia-nvim = pkgs.callPackage ./noctaliaColourVariablesNvim.nix {};
  generate-colour-variables-noctalia-nvim-bin = pkgs.lib.getExe generate-colour-variables-noctalia-nvim;
  # generate-colour-variables-ohmyposh = pkgs.callPackage ./colourVariablesOhMyPosh.nix {};
  # generate-colour-variables-ohmyposh-bin = pkgs.lib.getExe generate-colour-variables-ohmyposh;
  generate-colour-variables-noctalia-starship = pkgs.callPackage ./noctaliaColourVariablesStarship.nix {};
  generate-colour-variables-noctalia-starship-bin = pkgs.lib.getExe generate-colour-variables-noctalia-starship;
in

pkgs.writeShellScript "noctaliaOnWallpaperChanged" ''
  #!/usr/bin/env bash

  # Space-separated list of scripts
  SCRIPTS="${generate-colour-variables-noctalia-nvim-bin} ${generate-colour-variables-noctalia-starship-bin}"

  for script in $SCRIPTS; do
      if [ -x "$script" ]; then
          echo "Running $(basename "$script")..."
          "$script"
      else
          echo "Warning: $(basename "$script") not found or not executable"
      fi
  done
''
