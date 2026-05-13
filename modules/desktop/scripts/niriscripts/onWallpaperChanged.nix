{ pkgs, ... }:

let
  overview-wallpaper = pkgs.callPackage ./overview-wallpaper.nix { };
  overview-wallpaper-bin = pkgs.getExe overview-wallpaper;
  generate-colour-variables = pkgs.callPackage ./colourVariables.nix { };
  generate-colour-variables-bin = pkgs.getExe generate-colour-variables;
in

pkgs.writeShellScriptBin "onWallpaperChanged" ''
  #!/usr/bin/env bash
  # onWallpaperChanged - runs multiple scripts installed by Nix

  SCRIPTS=(
      "${overview-wallpaper-bin}"
      "${generate-colour-variables-bin}"
      # Add more scripts here
  )

  for script in "${SCRIPTS[@]}"; do
      if [[ -x "$script" ]]; then
          echo "Running $(basename "$script")..."
          "$script"
      else
          echo "Warning: $(basename "$script") not found or not executable"
      fi
  done
''
