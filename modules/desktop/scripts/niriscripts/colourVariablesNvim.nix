{ pkgs, ... }:

pkgs.writeShellScriptBin "generate-color-variables" ''
  #!/usr/bin/env bash
  # Generate colour variable files from DankMaterialShell JSON

  set -euo pipefail

  DMS_COLORS="$HOME/.cache/DankMaterialShell/dms-colors.json"

  OUT_LUA="$HOME/.config/nvim/lua/configs/colourVariables.lua"

  extract_color() {
      local path="$1"
      jq -r "$path" "$DMS_COLORS"
  }

generate_lua() {
    cat > "$OUT_LUA" <<EOF
return {

    -- =========================
    -- DARK COLOURS
    -- =========================

    darkBackground = "$(extract_color '.colors.dark.background')",
    darkError = "$(extract_color '.colors.dark.error')",
    darkErrorContainer = "$(extract_color '.colors.dark.error_container')",
    darkInverseOnSurface = "$(extract_color '.colors.dark.inverse_on_surface')",
    darkInversePrimary = "$(extract_color '.colors.dark.inverse_primary')",
    darkInverseSurface = "$(extract_color '.colors.dark.inverse_surface')",
    darkOnBackground = "$(extract_color '.colors.dark.on_background')",
    darkOnError = "$(extract_color '.colors.dark.on_error')",
    darkOnErrorContainer = "$(extract_color '.colors.dark.on_error_container')",
    darkOnPrimary = "$(extract_color '.colors.dark.on_primary')",
    darkOnPrimaryContainer = "$(extract_color '.colors.dark.on_primary_container')",
    darkOnPrimaryFixed = "$(extract_color '.colors.dark.on_primary_fixed')",
    darkOnPrimaryFixedVariant = "$(extract_color '.colors.dark.on_primary_fixed_variant')",
    darkOnSecondary = "$(extract_color '.colors.dark.on_secondary')",
    darkOnSecondaryContainer = "$(extract_color '.colors.dark.on_secondary_container')",
    darkOnSecondaryFixed = "$(extract_color '.colors.dark.on_secondary_fixed')",
    darkOnSecondaryFixedVariant = "$(extract_color '.colors.dark.on_secondary_fixed_variant')",
    darkOnSurface = "$(extract_color '.colors.dark.on_surface')",
    darkOnSurfaceVariant = "$(extract_color '.colors.dark.on_surface_variant')",
    darkOnTertiary = "$(extract_color '.colors.dark.on_tertiary')",
    darkOnTertiaryContainer = "$(extract_color '.colors.dark.on_tertiary_container')",
    darkOnTertiaryFixed = "$(extract_color '.colors.dark.on_tertiary_fixed')",
    darkOnTertiaryFixedVariant = "$(extract_color '.colors.dark.on_tertiary_fixed_variant')",
    darkOutline = "$(extract_color '.colors.dark.outline')",
    darkOutlineVariant = "$(extract_color '.colors.dark.outline_variant')",
    darkPrimary = "$(extract_color '.colors.dark.primary')",
    darkPrimaryContainer = "$(extract_color '.colors.dark.primary_container')",
    darkPrimaryFixed = "$(extract_color '.colors.dark.primary_fixed')",
    darkPrimaryFixedDim = "$(extract_color '.colors.dark.primary_fixed_dim')",
    darkScrim = "$(extract_color '.colors.dark.scrim')",
    darkSecondary = "$(extract_color '.colors.dark.secondary')",
    darkSecondaryContainer = "$(extract_color '.colors.dark.secondary_container')",
    darkSecondaryFixed = "$(extract_color '.colors.dark.secondary_fixed')",
    darkSecondaryFixedDim = "$(extract_color '.colors.dark.secondary_fixed_dim')",
    darkShadow = "$(extract_color '.colors.dark.shadow')",
    darkSourceColor = "$(extract_color '.colors.dark.source_color')",
    darkSurface = "$(extract_color '.colors.dark.surface')",
    darkSurfaceBright = "$(extract_color '.colors.dark.surface_bright')",
    darkSurfaceContainer = "$(extract_color '.colors.dark.surface_container')",
    darkSurfaceContainerHigh = "$(extract_color '.colors.dark.surface_container_high')",
    darkSurfaceContainerHighest = "$(extract_color '.colors.dark.surface_container_highest')",
    darkSurfaceContainerLow = "$(extract_color '.colors.dark.surface_container_low')",
    darkSurfaceContainerLowest = "$(extract_color '.colors.dark.surface_container_lowest')",
    darkSurfaceDim = "$(extract_color '.colors.dark.surface_dim')",
    darkSurfaceTint = "$(extract_color '.colors.dark.surface_tint')",
    darkSurfaceVariant = "$(extract_color '.colors.dark.surface_variant')",
    darkTertiary = "$(extract_color '.colors.dark.tertiary')",
    darkTertiaryContainer = "$(extract_color '.colors.dark.tertiary_container')",
    darkTertiaryFixed = "$(extract_color '.colors.dark.tertiary_fixed')",
    darkTertiaryFixedDim = "$(extract_color '.colors.dark.tertiary_fixed_dim')",

    -- =========================
    -- LIGHT COLOURS
    -- =========================

    lightBackground = "$(extract_color '.colors.light.background')",
    lightError = "$(extract_color '.colors.light.error')",
    lightErrorContainer = "$(extract_color '.colors.light.error_container')",
    lightInverseOnSurface = "$(extract_color '.colors.light.inverse_on_surface')",
    lightInversePrimary = "$(extract_color '.colors.light.inverse_primary')",
    lightInverseSurface = "$(extract_color '.colors.light.inverse_surface')",
    lightOnBackground = "$(extract_color '.colors.light.on_background')",
    lightOnError = "$(extract_color '.colors.light.on_error')",
    lightOnErrorContainer = "$(extract_color '.colors.light.on_error_container')",
    lightOnPrimary = "$(extract_color '.colors.light.on_primary')",
    lightOnPrimaryContainer = "$(extract_color '.colors.light.on_primary_container')",
    lightOnPrimaryFixed = "$(extract_color '.colors.light.on_primary_fixed')",
    lightOnPrimaryFixedVariant = "$(extract_color '.colors.light.on_primary_fixed_variant')",
    lightOnSecondary = "$(extract_color '.colors.light.on_secondary')",
    lightOnSecondaryContainer = "$(extract_color '.colors.light.on_secondary_container')",
    lightOnSecondaryFixed = "$(extract_color '.colors.light.on_secondary_fixed')",
    lightOnSecondaryFixedVariant = "$(extract_color '.colors.light.on_secondary_fixed_variant')",
    lightOnSurface = "$(extract_color '.colors.light.on_surface')",
    lightOnSurfaceVariant = "$(extract_color '.colors.light.on_surface_variant')",
    lightOnTertiary = "$(extract_color '.colors.light.on_tertiary')",
    lightOnTertiaryContainer = "$(extract_color '.colors.light.on_tertiary_container')",
    lightOnTertiaryFixed = "$(extract_color '.colors.light.on_tertiary_fixed')",
    lightOnTertiaryFixedVariant = "$(extract_color '.colors.light.on_tertiary_fixed_variant')",
    lightOutline = "$(extract_color '.colors.light.outline')",
    lightOutlineVariant = "$(extract_color '.colors.light.outline_variant')",
    lightPrimary = "$(extract_color '.colors.light.primary')",
    lightPrimaryContainer = "$(extract_color '.colors.light.primary_container')",
    lightPrimaryFixed = "$(extract_color '.colors.light.primary_fixed')",
    lightPrimaryFixedDim = "$(extract_color '.colors.light.primary_fixed_dim')",
    lightScrim = "$(extract_color '.colors.light.scrim')",
    lightSecondary = "$(extract_color '.colors.light.secondary')",
    lightSecondaryContainer = "$(extract_color '.colors.light.secondary_container')",
    lightSecondaryFixed = "$(extract_color '.colors.light.secondary_fixed')",
    lightSecondaryFixedDim = "$(extract_color '.colors.light.secondary_fixed_dim')",
    lightShadow = "$(extract_color '.colors.light.shadow')",
    lightSourceColor = "$(extract_color '.colors.light.source_color')",
    lightSurface = "$(extract_color '.colors.light.surface')",
    lightSurfaceBright = "$(extract_color '.colors.light.surface_bright')",
    lightSurfaceContainer = "$(extract_color '.colors.light.surface_container')",
    lightSurfaceContainerHigh = "$(extract_color '.colors.light.surface_container_high')",
    lightSurfaceContainerHighest = "$(extract_color '.colors.light.surface_container_highest')",
    lightSurfaceContainerLow = "$(extract_color '.colors.light.surface_container_low')",
    lightSurfaceContainerLowest = "$(extract_color '.colors.light.surface_container_lowest')",
    lightSurfaceDim = "$(extract_color '.colors.light.surface_dim')",
    lightSurfaceTint = "$(extract_color '.colors.light.surface_tint')",
    lightSurfaceVariant = "$(extract_color '.colors.light.surface_variant')",
    lightTertiary = "$(extract_color '.colors.light.tertiary')",
    lightTertiaryContainer = "$(extract_color '.colors.light.tertiary_container')",
    lightTertiaryFixed = "$(extract_color '.colors.light.tertiary_fixed')",
    lightTertiaryFixedDim = "$(extract_color '.colors.light.tertiary_fixed_dim')",

    -- =========================
    -- DANK16
    -- =========================

    color0Default = "$(extract_color '.dank16.color0.default')",
    color0Light = "$(extract_color '.dank16.color0.light')",
    color0Dark = "$(extract_color '.dank16.color0.dark')",

    color1Default = "$(extract_color '.dank16.color1.default')",
    color1Light = "$(extract_color '.dank16.color1.light')",
    color1Dark = "$(extract_color '.dank16.color1.dark')",

    color2Default = "$(extract_color '.dank16.color2.default')",
    color2Light = "$(extract_color '.dank16.color2.light')",
    color2Dark = "$(extract_color '.dank16.color2.dark')",

    color3Default = "$(extract_color '.dank16.color3.default')",
    color3Light = "$(extract_color '.dank16.color3.light')",
    color3Dark = "$(extract_color '.dank16.color3.dark')",

    color4Default = "$(extract_color '.dank16.color4.default')",
    color4Light = "$(extract_color '.dank16.color4.light')",
    color4Dark = "$(extract_color '.dank16.color4.dark')",

    color5Default = "$(extract_color '.dank16.color5.default')",
    color5Light = "$(extract_color '.dank16.color5.light')",
    color5Dark = "$(extract_color '.dank16.color5.dark')",

    color6Default = "$(extract_color '.dank16.color6.default')",
    color6Light = "$(extract_color '.dank16.color6.light')",
    color6Dark = "$(extract_color '.dank16.color6.dark')",

    color7Default = "$(extract_color '.dank16.color7.default')",
    color7Light = "$(extract_color '.dank16.color7.light')",
    color7Dark = "$(extract_color '.dank16.color7.dark')",

    color8Default = "$(extract_color '.dank16.color8.default')",
    color8Light = "$(extract_color '.dank16.color8.light')",
    color8Dark = "$(extract_color '.dank16.color8.dark')",

    color9Default = "$(extract_color '.dank16.color9.default')",
    color9Light = "$(extract_color '.dank16.color9.light')",
    color9Dark = "$(extract_color '.dank16.color9.dark')",

    color10Default = "$(extract_color '.dank16.color10.default')",
    color10Light = "$(extract_color '.dank16.color10.light')",
    color10Dark = "$(extract_color '.dank16.color10.dark')",

    color11Default = "$(extract_color '.dank16.color11.default')",
    color11Light = "$(extract_color '.dank16.color11.light')",
    color11Dark = "$(extract_color '.dank16.color11.dark')",

    color12Default = "$(extract_color '.dank16.color12.default')",
    color12Light = "$(extract_color '.dank16.color12.light')",
    color12Dark = "$(extract_color '.dank16.color12.dark')",

    color13Default = "$(extract_color '.dank16.color13.default')",
    color13Light = "$(extract_color '.dank16.color13.light')",
    color13Dark = "$(extract_color '.dank16.color13.dark')",

    color14Default = "$(extract_color '.dank16.color14.default')",
    color14Light = "$(extract_color '.dank16.color14.light')",
    color14Dark = "$(extract_color '.dank16.color14.dark')",

    color15Default = "$(extract_color '.dank16.color15.default')",
    color15Light = "$(extract_color '.dank16.color15.light')",
    color15Dark = "$(extract_color '.dank16.color15.dark')",
    }
EOF
}
  # Generate once at startup
  generate_lua
''
