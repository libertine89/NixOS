{ pkgs, ... }:
pkgs.writeShellScriptBin "keybindings" ''

#!/bin/bash
# Extract binds from KDL config and replace mainMod/modeMod

CONFIG_FILE="$HOME/.config/niri/config.kdl"

keybinds=$(awk '
    BEGIN { in_binds=0 }
    # Enter binds block
    /^\s*binds\s*{/ { in_binds=1; next }
    # Exit binds block
    /^\s*}/ { if (in_binds) in_binds=0; next }
    # Process lines inside binds block
    in_binds && /\S/ {
        # Remove comments
        gsub(/\/\/.*$/, "", $0)
        # Skip empty lines
        if (length($0) == 0) next

        # Replace variables
        gsub(/\$mainMod/, "SUPER", $0)
        gsub(/\$modeMod/, "SHIFT", $0)

        # Split key combo from command
        if (match($0, /^[^ ]+/)) {
            key=substr($0, RSTART, RLENGTH)
            cmd=substr($0, RLENGTH+1)
            gsub(/[{}]/, "", cmd)
            gsub(/^ +| +$/, "", cmd)
            print key " \r " cmd
        }
    }
' "$CONFIG_FILE")

# Show results in rofi menu
rofi -dmenu -i -markup -eh 2 -replace -p "Keybinds" <<<"$keybinds"
''
