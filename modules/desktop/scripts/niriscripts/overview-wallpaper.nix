{ pkgs, ... }:
pkgs.writeShellScriptBin "overview-wallpaper" ''
  #!/usr/bin/env bash

  # Get the current wallpaper from DMS
  CURRENT_WP=$(dms ipc call wallpaper get)

  # Update awww with the new image
  awww img "$CURRENT_WP" --transition-step 255 --transition-duration 0 --transition-type none
''
