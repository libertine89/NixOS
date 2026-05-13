#!/usr/bin/env bash
# Watch Niri events and regenerate colorVariables.kdl dynamically

set -euo pipefail

DMS_COLORS="$HOME/.config/niri/dms/colors.kdl"
OUT_KDL="$HOME/.config/niri/dms/colorVariables.kdl"

extract_color() {
    local section="$1"
    local key="$2"
    awk -v sec="$section" -v key="$key" '
        $0 ~ sec { in_section=1; next }
        in_section && $0 ~ key {
            match($0, /"#([0-9a-fA-F]{6,8})"/, m)
            print m[0]
            exit
        }
        in_section && $0 ~ /^}/ { in_section=0 }
    ' "$DMS_COLORS"
}

generate_kdl() {
    cat > "$OUT_KDL" <<EOF
colors {
    border_active   "$(extract_color "border" "active-color")"
    border_inactive "$(extract_color "border" "inactive-color")"
    focus_active    "$(extract_color "focus-ring" "active-color")"
    focus_inactive  "$(extract_color "focus-ring" "inactive-color")"
    tab_active      "$(extract_color "tab-indicator" "active-color")"
    tab_inactive    "$(extract_color "tab-indicator" "inactive-color")"
    shadow          "$(extract_color "shadow" "color")"
    insert_hint     "$(extract_color "insert-hint" "color")"
}
EOF
}

# Generate initially
generate_kdl

# Listen to Niri window events
niri msg event-stream | while read -r event; do
    case "$event" in
        *window-opened*|*focused-window-changed*)
            generate_kdl
            ;;
    esac
done

HOW TO USE, 
set up script above in nix, let into dms.nix
file is generated below at location set in script
set up conditional section in layout.nix for niri
include colourVariables.kdl
set new condition layouts with those colours in one branch
set old layout in other branch
set this script to spawn at start in autostart.nix

Generated file: colorVariables.kdl
colors {
    border_active   "#eac300"
    border_inactive "#98907c"
    focus_active    "#eac300"
    focus_inactive  "#98907c"
    tab_active      "#eac300"
    tab_inactive    "#98907c"
    shadow          "#00000070"
    insert_hint     "#eac30080"
}
Each “variable” is just a key/value pair.
Think of it as a dictionary of colors.
Main config.kdl using it
include "dms/colorVariables.kdl"

layout {
    border {
        active-color colors.border_active
        inactive-color colors.border_inactive
    }
    focus-ring {
        active-color colors.focus_active
        inactive-color colors.focus_inactive
    }
    tab-indicator {
        active-color colors.tab_active
        inactive-color colors.tab_inactive
    }
}
