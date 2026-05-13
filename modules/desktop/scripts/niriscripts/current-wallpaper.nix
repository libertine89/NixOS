{ pkgs, ... }:
pkgs.writeShellScriptBin "current-wallpaper" ''
  #!/usr/bin/env bash

  # Directory to save the JSON file
  OUTPUT_DIR="${HOME}/.config/DankMaterialShell/"
  mkdir -p "$OUTPUT_DIR"

  # Get the current wallpaper from DMS
  CURRENT_WP=$(dms ipc call wallpaper get)

  # Write to JSON file
  echo "{\"wallpaper\": \"$CURRENT_WP\"}" > "$OUTPUT_DIR/current-wallpaper.json"
''
