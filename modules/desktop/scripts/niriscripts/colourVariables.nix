{ pkgs, ... }:

pkgs.writeShellScriptBin "generate-color-variables" ''
  #!/usr/bin/env bash
  # Generate colorVariables.kdl once, without listening to Niri events

  set -euo pipefail

  DMS_COLORS="$HOME/.config/niri/dms/colors.kdl"
  OUT_KDL="$HOME/.config/niri/dms/colorVariables.kdl"
  OUT_SH="$HOME/.config/niri/dms/colorVariables.sh"
  OUT_LUA="$HOME/.config/nvim/lua/configs/colourVariables.lua"

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
      ' $DMS_COLORS
  }

  generate_kdl() {
      cat > "$OUT_KDL" <<EOF
colors {
    border_active   $(extract_color "border" "active-color")
    border_inactive $(extract_color "border" "inactive-color")
    focus_active    $(extract_color "focus-ring" "active-color")
    focus_inactive  $(extract_color "focus-ring" "inactive-color")
    tab_active      $(extract_color "tab-indicator" "active-color")
    tab_inactive    $(extract_color "tab-indicator" "inactive-color")
    shadow          $(extract_color "shadow" "color")
    insert_hint     $(extract_color "insert-hint" "color")
}
EOF
  }

  generate_sh() {
      cat > "$OUT_SH" <<EOF
    border_active   $(extract_color "border" "active-color")
    border_inactive $(extract_color "border" "inactive-color")
    focus_active    $(extract_color "focus-ring" "active-color")
    focus_inactive  $(extract_color "focus-ring" "inactive-color")
    tab_active      $(extract_color "tab-indicator" "active-color")
    tab_inactive    $(extract_color "tab-indicator" "inactive-color")
    shadow          $(extract_color "shadow" "color")
    insert_hint     $(extract_color "insert-hint" "color")
EOF
  }

generate_lua() {
    cat > "$OUT_LUA" <<EOF
return {
    border_active   = $(extract_color "border" "active-color"),
    border_inactive = $(extract_color "border" "inactive-color"),
    border_urgent   = $(extract_color "border" "urgent-color"),
    focus_active    = $(extract_color "focus-ring" "active-color"),
    focus_inactive  = $(extract_color "focus-ring" "inactive-color"),
    tab_active      = $(extract_color "tab-indicator" "active-color"),
    tab_inactive    = $(extract_color "tab-indicator" "inactive-color"),
    shadow          = $(extract_color "shadow" "color"),
    insert_hint     = $(extract_color "insert-hint" "color"),
}
EOF
}
  # Generate once at startup
  generate_lua
  generate_sh
  generate_kdl
''

