{ pkgs, ... }:

let
  overview-wallpaper = pkgs.callPackage ./overview-wallpaper.nix {};
  overview-wallpaper-bin = pkgs.lib.getExe overview-wallpaper;
  generate-colour-variables-nvim = pkgs.callPackage ./colourVariablesNvim.nix {};
  generate-colour-variables-nvim-bin = pkgs.lib.getExe generate-colour-variables-nvim;
  generate-colour-variables-prompt = pkgs.callPackage ./colourVariablesPrompt.nix {};
  generate-colour-variables-prompt-bin = pkgs.lib.getExe generate-colour-variables-prompt;
in

pkgs.writeShellScript "onWallpaperChanged" ''
  #!/usr/bin/env bash

  # Space-separated list of scripts
  SCRIPTS="${overview-wallpaper-bin} ${generate-colour-variables-nvim-bin} ${generate-colour-variables-prompt-bin}"

  for script in $SCRIPTS; do
      if [ -x "$script" ]; then
          echo "Running $(basename "$script")..."
          "$script"
      else
          echo "Warning: $(basename "$script") not found or not executable"
      fi
  done
''
