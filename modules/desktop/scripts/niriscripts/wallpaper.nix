{ pkgs, defaultWallpaper, ... }:
pkgs.writeShellScriptBin "wallpaper" ''
#!/usr/bin/env bash

# Determine wallpaper
if [ -n "$1" ]; then
    CURRENT="$1"
else
    CURRENT="${../../../themes/wallpapers/${defaultWallpaper}}"
fi

# Kill any previous wallpaper windows
awww stop &> /dev/null

# Force launch wallpaper with the namespace
awww img "$CURRENT" \
    --transition-step 255 \
    --transition-duration 1 \
    --transition-fps 60 \
    --transition-type none \
    --name wallpaper
''
