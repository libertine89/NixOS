
{ pkgs, ... }:

pkgs.writeShellScriptBin "generate-color-variables-noctalia-nvim" ''
  #!/usr/bin/env bash
  # Generate colour variable files from DankMaterialShell JSON

  set -euo pipefail

  NOC_COLORS="$HOME/.config/noctalia/colors.json"

  OUT_LUA="$HOME/.config/nvim/lua/configs/colourVariables.lua"

  extract_color() {
      local path="$1"
      jq -r "$path" "$NOC_COLORS"
  }

generate_lua() {
    cat > "$OUT_LUA" <<EOF
return {
    -- =========================
    -- DARK COLOURS (mapped from m*)
    -- =========================

    darkPrimary = "$(extract_color '.mPrimary')",
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
