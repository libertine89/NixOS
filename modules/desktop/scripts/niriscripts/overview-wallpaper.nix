{ pkgs, ... }:
pkgs.writeShellScriptBin "overview-wallpaper" ''
  #!/usr/bin/env bash

  # Get the current wallpaper from DMS
  CURRENT_WP=$(dms ipc call wallpaper get)

  # Update awww with the new image
  awww img "$CURRENT_WP" --transition-step 255 --transition-duration 0 --transition-type none

{
  echo "current-wallpaper hook ran at $(date)"
  echo "UID: $(id -u)"
  echo "USER: $USER"
  echo "PWD: $PWD"
  echo "PATH: $PATH"
  echo "Trying dms ipc call wallpaper get..."
  dms ipc call wallpaper get 2>&1
  echo "Trying to write /tmp/current-wallpaper.json..."
  echo "test" > /tmp/current-wallpaper.json 2>&1
} >> /tmp/current-wallpaper-hook.log 2>&1
''
