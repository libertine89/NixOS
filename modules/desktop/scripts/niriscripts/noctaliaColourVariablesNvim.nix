
{ pkgs, ... }:

pkgs.writeShellScriptBin "generate-color-variables-noctalia-nvim" ''
  #!/usr/bin/env bash
  # Generate colour variable files from DankMaterialShell JSON

  set -euo pipefail

  NOC_COLORS="$HOME/.config/noctalia/colors.json"

  OUT_LUA="$HOME/.config/nvim/lua/configs/noctaliaColourVariables.lua"

  extract_color() {
      local path="$1"
      jq -r "$path" "$NOC_COLORS"
  }

darken() {
    local hex
    hex=$(echo "$1" | sed 's/^#//' | tr '[:lower:]' '[:upper:]')

    local factor="$2"

    local r=$((16#''${hex:0:2}))
    local g=$((16#''${hex:2:2}))
    local b=$((16#''${hex:4:2}))

    r=$(awk "BEGIN { printf \"%d\", $r * $factor }")
    g=$(awk "BEGIN { printf \"%d\", $g * $factor }")
    b=$(awk "BEGIN { printf \"%d\", $b * $factor }")

    printf "#%02X%02X%02X\n" "$r" "$g" "$b"
}

generate_lua() {
    cat > "$OUT_LUA" <<EOF
return {
    -- =========================
    -- DARK COLOURS (mapped from m*)
    -- =========================

    darkPrimary = "$(extract_color '.mPrimary')",
    darkPrimaryDim1 = "$(darken "$(extract_color '.mPrimary')" 0.90)",
    darkPrimaryDim2 = "$(darken "$(extract_color '.mPrimary')" 0.70)",
    darkPrimaryDim3 = "$(darken "$(extract_color '.mPrimary')" 0.50)",
    darkOnPrimary = "$(extract_color '.mOnPrimary')",

    darkSecondary = "$(extract_color '.mSecondary')",
    darkOnSecondary = "$(extract_color '.mOnSecondary')",

    darkTertiary = "$(extract_color '.mTertiary')",
    darkOnTertiary = "$(extract_color '.mOnTertiary')",

    darkError = "$(extract_color '.mError')",
    darkOnError = "$(extract_color '.mOnError')",

    darkSurface = "$(extract_color '.mSurface')",
    darkOnSurface = "$(extract_color '.mOnSurface')",

    darkSurfaceVariant = "$(extract_color '.mSurfaceVariant')",
    darkOnSurfaceVariant = "$(extract_color '.mOnSurfaceVariant')",

    darkOutline = "$(extract_color '.mOutline')",
    darkShadow = "$(extract_color '.mShadow')",

    darkHover = "$(extract_color '.mHover')",
    darkOnHover = "$(extract_color '.mOnHover')",
}
EOF
}
  # Generate once at startup
  generate_lua
''
