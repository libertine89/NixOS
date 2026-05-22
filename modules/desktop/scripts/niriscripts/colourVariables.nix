{ pkgs, ... }:

pkgs.writeShellScriptBin "generate-color-variables" ''
  #!/usr/bin/env bash
  # Generate colour variable files from DankMaterialShell JSON

  set -euo pipefail

  DMS_COLORS="$HOME/.cache/DankMaterialShell/dms-colors.json"

  OUT_KDL="$HOME/.config/niri/dms/colourVariables.kdl"
  OUT_SH="$HOME/.config/niri/dms/colourVariables.sh"
  OUT_LUA="$HOME/.config/nvim/lua/configs/colourVariables.lua"
  OUT_YAML="$HOME/.config/oh-my-posh/colourVariables.omp.yaml"

  extract_color() {
      local path="$1"
      jq -r "$path" "$DMS_COLORS"
  }

  generate_kdl() {
      cat > "$OUT_KDL" <<EOF
colors {

    // =========================
    // DARK COLOURS
    // =========================

    darkBackground              "$(extract_color '.colors.dark.background')"
    darkError                   "$(extract_color '.colors.dark.error')"
    darkErrorContainer          "$(extract_color '.colors.dark.error_container')"
    darkInverseOnSurface        "$(extract_color '.colors.dark.inverse_on_surface')"
    darkInversePrimary          "$(extract_color '.colors.dark.inverse_primary')"
    darkInverseSurface          "$(extract_color '.colors.dark.inverse_surface')"
    darkOnBackground            "$(extract_color '.colors.dark.on_background')"
    darkOnError                 "$(extract_color '.colors.dark.on_error')"
    darkOnErrorContainer        "$(extract_color '.colors.dark.on_error_container')"
    darkOnPrimary               "$(extract_color '.colors.dark.on_primary')"
    darkOnPrimaryContainer      "$(extract_color '.colors.dark.on_primary_container')"
    darkOnPrimaryFixed          "$(extract_color '.colors.dark.on_primary_fixed')"
    darkOnPrimaryFixedVariant   "$(extract_color '.colors.dark.on_primary_fixed_variant')"
    darkOnSecondary             "$(extract_color '.colors.dark.on_secondary')"
    darkOnSecondaryContainer    "$(extract_color '.colors.dark.on_secondary_container')"
    darkOnSecondaryFixed        "$(extract_color '.colors.dark.on_secondary_fixed')"
    darkOnSecondaryFixedVariant "$(extract_color '.colors.dark.on_secondary_fixed_variant')"
    darkOnSurface               "$(extract_color '.colors.dark.on_surface')"
    darkOnSurfaceVariant        "$(extract_color '.colors.dark.on_surface_variant')"
    darkOnTertiary              "$(extract_color '.colors.dark.on_tertiary')"
    darkOnTertiaryContainer     "$(extract_color '.colors.dark.on_tertiary_container')"
    darkOnTertiaryFixed         "$(extract_color '.colors.dark.on_tertiary_fixed')"
    darkOnTertiaryFixedVariant  "$(extract_color '.colors.dark.on_tertiary_fixed_variant')"
    darkOutline                 "$(extract_color '.colors.dark.outline')"
    darkOutlineVariant          "$(extract_color '.colors.dark.outline_variant')"
    darkPrimary                 "$(extract_color '.colors.dark.primary')"
    darkPrimaryContainer        "$(extract_color '.colors.dark.primary_container')"
    darkPrimaryFixed            "$(extract_color '.colors.dark.primary_fixed')"
    darkPrimaryFixedDim         "$(extract_color '.colors.dark.primary_fixed_dim')"
    darkScrim                   "$(extract_color '.colors.dark.scrim')"
    darkSecondary               "$(extract_color '.colors.dark.secondary')"
    darkSecondaryContainer      "$(extract_color '.colors.dark.secondary_container')"
    darkSecondaryFixed          "$(extract_color '.colors.dark.secondary_fixed')"
    darkSecondaryFixedDim       "$(extract_color '.colors.dark.secondary_fixed_dim')"
    darkShadow                  "$(extract_color '.colors.dark.shadow')"
    darkSourceColor             "$(extract_color '.colors.dark.source_color')"
    darkSurface                 "$(extract_color '.colors.dark.surface')"
    darkSurfaceBright           "$(extract_color '.colors.dark.surface_bright')"
    darkSurfaceContainer        "$(extract_color '.colors.dark.surface_container')"
    darkSurfaceContainerHigh    "$(extract_color '.colors.dark.surface_container_high')"
    darkSurfaceContainerHighest "$(extract_color '.colors.dark.surface_container_highest')"
    darkSurfaceContainerLow     "$(extract_color '.colors.dark.surface_container_low')"
    darkSurfaceContainerLowest  "$(extract_color '.colors.dark.surface_container_lowest')"
    darkSurfaceDim              "$(extract_color '.colors.dark.surface_dim')"
    darkSurfaceTint             "$(extract_color '.colors.dark.surface_tint')"
    darkSurfaceVariant          "$(extract_color '.colors.dark.surface_variant')"
    darkTertiary                "$(extract_color '.colors.dark.tertiary')"
    darkTertiaryContainer       "$(extract_color '.colors.dark.tertiary_container')"
    darkTertiaryFixed           "$(extract_color '.colors.dark.tertiary_fixed')"
    darkTertiaryFixedDim        "$(extract_color '.colors.dark.tertiary_fixed_dim')"

    // =========================
    // LIGHT COLOURS
    // =========================

    lightBackground              "$(extract_color '.colors.light.background')"
    lightError                   "$(extract_color '.colors.light.error')"
    lightErrorContainer          "$(extract_color '.colors.light.error_container')"
    lightInverseOnSurface        "$(extract_color '.colors.light.inverse_on_surface')"
    lightInversePrimary          "$(extract_color '.colors.light.inverse_primary')"
    lightInverseSurface          "$(extract_color '.colors.light.inverse_surface')"
    lightOnBackground            "$(extract_color '.colors.light.on_background')"
    lightOnError                 "$(extract_color '.colors.light.on_error')"
    lightOnErrorContainer        "$(extract_color '.colors.light.on_error_container')"
    lightOnPrimary               "$(extract_color '.colors.light.on_primary')"
    lightOnPrimaryContainer      "$(extract_color '.colors.light.on_primary_container')"
    lightOnPrimaryFixed          "$(extract_color '.colors.light.on_primary_fixed')"
    lightOnPrimaryFixedVariant   "$(extract_color '.colors.light.on_primary_fixed_variant')"
    lightOnSecondary             "$(extract_color '.colors.light.on_secondary')"
    lightOnSecondaryContainer    "$(extract_color '.colors.light.on_secondary_container')"
    lightOnSecondaryFixed        "$(extract_color '.colors.light.on_secondary_fixed')"
    lightOnSecondaryFixedVariant "$(extract_color '.colors.light.on_secondary_fixed_variant')"
    lightOnSurface               "$(extract_color '.colors.light.on_surface')"
    lightOnSurfaceVariant        "$(extract_color '.colors.light.on_surface_variant')"
    lightOnTertiary              "$(extract_color '.colors.light.on_tertiary')"
    lightOnTertiaryContainer     "$(extract_color '.colors.light.on_tertiary_container')"
    lightOnTertiaryFixed         "$(extract_color '.colors.light.on_tertiary_fixed')"
    lightOnTertiaryFixedVariant  "$(extract_color '.colors.light.on_tertiary_fixed_variant')"
    lightOutline                 "$(extract_color '.colors.light.outline')"
    lightOutlineVariant          "$(extract_color '.colors.light.outline_variant')"
    lightPrimary                 "$(extract_color '.colors.light.primary')"
    lightPrimaryContainer        "$(extract_color '.colors.light.primary_container')"
    lightPrimaryFixed            "$(extract_color '.colors.light.primary_fixed')"
    lightPrimaryFixedDim         "$(extract_color '.colors.light.primary_fixed_dim')"
    lightScrim                   "$(extract_color '.colors.light.scrim')"
    lightSecondary               "$(extract_color '.colors.light.secondary')"
    lightSecondaryContainer      "$(extract_color '.colors.light.secondary_container')"
    lightSecondaryFixed          "$(extract_color '.colors.light.secondary_fixed')"
    lightSecondaryFixedDim       "$(extract_color '.colors.light.secondary_fixed_dim')"
    lightShadow                  "$(extract_color '.colors.light.shadow')"
    lightSourceColor             "$(extract_color '.colors.light.source_color')"
    lightSurface                 "$(extract_color '.colors.light.surface')"
    lightSurfaceBright           "$(extract_color '.colors.light.surface_bright')"
    lightSurfaceContainer        "$(extract_color '.colors.light.surface_container')"
    lightSurfaceContainerHigh    "$(extract_color '.colors.light.surface_container_high')"
    lightSurfaceContainerHighest "$(extract_color '.colors.light.surface_container_highest')"
    lightSurfaceContainerLow     "$(extract_color '.colors.light.surface_container_low')"
    lightSurfaceContainerLowest  "$(extract_color '.colors.light.surface_container_lowest')"
    lightSurfaceDim              "$(extract_color '.colors.light.surface_dim')"
    lightSurfaceTint             "$(extract_color '.colors.light.surface_tint')"
    lightSurfaceVariant          "$(extract_color '.colors.light.surface_variant')"
    lightTertiary                "$(extract_color '.colors.light.tertiary')"
    lightTertiaryContainer       "$(extract_color '.colors.light.tertiary_container')"
    lightTertiaryFixed           "$(extract_color '.colors.light.tertiary_fixed')"
    lightTertiaryFixedDim        "$(extract_color '.colors.light.tertiary_fixed_dim')"

    // =========================
    // DANK16
    // =========================

    color0Default  "$(extract_color '.dank16.color0.default')"
    color0Light    "$(extract_color '.dank16.color0.light')"
    color0Dark     "$(extract_color '.dank16.color0.dark')"

    color1Default  "$(extract_color '.dank16.color1.default')"
    color1Light    "$(extract_color '.dank16.color1.light')"
    color1Dark     "$(extract_color '.dank16.color1.dark')"

    color2Default  "$(extract_color '.dank16.color2.default')"
    color2Light    "$(extract_color '.dank16.color2.light')"
    color2Dark     "$(extract_color '.dank16.color2.dark')"

    color3Default  "$(extract_color '.dank16.color3.default')"
    color3Light    "$(extract_color '.dank16.color3.light')"
    color3Dark     "$(extract_color '.dank16.color3.dark')"

    color4Default  "$(extract_color '.dank16.color4.default')"
    color4Light    "$(extract_color '.dank16.color4.light')"
    color4Dark     "$(extract_color '.dank16.color4.dark')"

    color5Default  "$(extract_color '.dank16.color5.default')"
    color5Light    "$(extract_color '.dank16.color5.light')"
    color5Dark     "$(extract_color '.dank16.color5.dark')"

    color6Default  "$(extract_color '.dank16.color6.default')"
    color6Light    "$(extract_color '.dank16.color6.light')"
    color6Dark     "$(extract_color '.dank16.color6.dark')"

    color7Default  "$(extract_color '.dank16.color7.default')"
    color7Light    "$(extract_color '.dank16.color7.light')"
    color7Dark     "$(extract_color '.dank16.color7.dark')"

    color8Default  "$(extract_color '.dank16.color8.default')"
    color8Light    "$(extract_color '.dank16.color8.light')"
    color8Dark     "$(extract_color '.dank16.color8.dark')"

    color9Default  "$(extract_color '.dank16.color9.default')"
    color9Light    "$(extract_color '.dank16.color9.light')"
    color9Dark     "$(extract_color '.dank16.color9.dark')"

    color10Default "$(extract_color '.dank16.color10.default')"
    color10Light   "$(extract_color '.dank16.color10.light')"
    color10Dark    "$(extract_color '.dank16.color10.dark')"

    color11Default "$(extract_color '.dank16.color11.default')"
    color11Light   "$(extract_color '.dank16.color11.light')"
    color11Dark    "$(extract_color '.dank16.color11.dark')"

    color12Default "$(extract_color '.dank16.color12.default')"
    color12Light   "$(extract_color '.dank16.color12.light')"
    color12Dark    "$(extract_color '.dank16.color12.dark')"

    color13Default "$(extract_color '.dank16.color13.default')"
    color13Light   "$(extract_color '.dank16.color13.light')"
    color13Dark    "$(extract_color '.dank16.color13.dark')"

    color14Default "$(extract_color '.dank16.color14.default')"
    color14Light   "$(extract_color '.dank16.color14.light')"
    color14Dark    "$(extract_color '.dank16.color14.dark')"

    color15Default "$(extract_color '.dank16.color15.default')"
    color15Light   "$(extract_color '.dank16.color15.light')"
    color15Dark    "$(extract_color '.dank16.color15.dark')"
}
EOF
  }
generate_sh() {
      cat > "$OUT_SH" <<EOF
  # =========================
  # DARK COLOURS
  # =========================

  export darkBackground="$(extract_color '.colors.dark.background')"
  export darkError="$(extract_color '.colors.dark.error')"
  export darkErrorContainer="$(extract_color '.colors.dark.error_container')"
  export darkInverseOnSurface="$(extract_color '.colors.dark.inverse_on_surface')"
  export darkInversePrimary="$(extract_color '.colors.dark.inverse_primary')"
  export darkInverseSurface="$(extract_color '.colors.dark.inverse_surface')"
  export darkOnBackground="$(extract_color '.colors.dark.on_background')"
  export darkOnError="$(extract_color '.colors.dark.on_error')"
  export darkOnErrorContainer="$(extract_color '.colors.dark.on_error_container')"
  export darkOnPrimary="$(extract_color '.colors.dark.on_primary')"
  export darkOnPrimaryContainer="$(extract_color '.colors.dark.on_primary_container')"
  export darkOnPrimaryFixed="$(extract_color '.colors.dark.on_primary_fixed')"
  export darkOnPrimaryFixedVariant="$(extract_color '.colors.dark.on_primary_fixed_variant')"
  export darkOnSecondary="$(extract_color '.colors.dark.on_secondary')"
  export darkOnSecondaryContainer="$(extract_color '.colors.dark.on_secondary_container')"
  export darkOnSecondaryFixed="$(extract_color '.colors.dark.on_secondary_fixed')"
  export darkOnSecondaryFixedVariant="$(extract_color '.colors.dark.on_secondary_fixed_variant')"
  export darkOnSurface="$(extract_color '.colors.dark.on_surface')"
  export darkOnSurfaceVariant="$(extract_color '.colors.dark.on_surface_variant')"
  export darkOnTertiary="$(extract_color '.colors.dark.on_tertiary')"
  export darkOnTertiaryContainer="$(extract_color '.colors.dark.on_tertiary_container')"
  export darkOnTertiaryFixed="$(extract_color '.colors.dark.on_tertiary_fixed')"
  export darkOnTertiaryFixedVariant="$(extract_color '.colors.dark.on_tertiary_fixed_variant')"
  export darkOutline="$(extract_color '.colors.dark.outline')"
  export darkOutlineVariant="$(extract_color '.colors.dark.outline_variant')"
  export darkPrimary="$(extract_color '.colors.dark.primary')"
  export darkPrimaryContainer="$(extract_color '.colors.dark.primary_container')"
  export darkPrimaryFixed="$(extract_color '.colors.dark.primary_fixed')"
  export darkPrimaryFixedDim="$(extract_color '.colors.dark.primary_fixed_dim')"
  export darkScrim="$(extract_color '.colors.dark.scrim')"
  export darkSecondary="$(extract_color '.colors.dark.secondary')"
  export darkSecondaryContainer="$(extract_color '.colors.dark.secondary_container')"
  export darkSecondaryFixed="$(extract_color '.colors.dark.secondary_fixed')"
  export darkSecondaryFixedDim="$(extract_color '.colors.dark.secondary_fixed_dim')"
  export darkShadow="$(extract_color '.colors.dark.shadow')"
  export darkSourceColor="$(extract_color '.colors.dark.source_color')"
  export darkSurface="$(extract_color '.colors.dark.surface')"
  export darkSurfaceBright="$(extract_color '.colors.dark.surface_bright')"
  export darkSurfaceContainer="$(extract_color '.colors.dark.surface_container')"
  export darkSurfaceContainerHigh="$(extract_color '.colors.dark.surface_container_high')"
  export darkSurfaceContainerHighest="$(extract_color '.colors.dark.surface_container_highest')"
  export darkSurfaceContainerLow="$(extract_color '.colors.dark.surface_container_low')"
  export darkSurfaceContainerLowest="$(extract_color '.colors.dark.surface_container_lowest')"
  export darkSurfaceDim="$(extract_color '.colors.dark.surface_dim')"
  export darkSurfaceTint="$(extract_color '.colors.dark.surface_tint')"
  export darkSurfaceVariant="$(extract_color '.colors.dark.surface_variant')"
  export darkTertiary="$(extract_color '.colors.dark.tertiary')"
  export darkTertiaryContainer="$(extract_color '.colors.dark.tertiary_container')"
  export darkTertiaryFixed="$(extract_color '.colors.dark.tertiary_fixed')"
  export darkTertiaryFixedDim="$(extract_color '.colors.dark.tertiary_fixed_dim')"

  # =========================
  # LIGHT COLOURS
  # =========================

  export lightBackground="$(extract_color '.colors.light.background')"
  export lightError="$(extract_color '.colors.light.error')"
  export lightErrorContainer="$(extract_color '.colors.light.error_container')"
  export lightInverseOnSurface="$(extract_color '.colors.light.inverse_on_surface')"
  export lightInversePrimary="$(extract_color '.colors.light.inverse_primary')"
  export lightInverseSurface="$(extract_color '.colors.light.inverse_surface')"
  export lightOnBackground="$(extract_color '.colors.light.on_background')"
  export lightOnError="$(extract_color '.colors.light.on_error')"
  export lightOnErrorContainer="$(extract_color '.colors.light.on_error_container')"
  export lightOnPrimary="$(extract_color '.colors.light.on_primary')"
  export lightOnPrimaryContainer="$(extract_color '.colors.light.on_primary_container')"
  export lightOnPrimaryFixed="$(extract_color '.colors.light.on_primary_fixed')"
  export lightOnPrimaryFixedVariant="$(extract_color '.colors.light.on_primary_fixed_variant')"
  export lightOnSecondary="$(extract_color '.colors.light.on_secondary')"
  export lightOnSecondaryContainer="$(extract_color '.colors.light.on_secondary_container')"
  export lightOnSecondaryFixed="$(extract_color '.colors.light.on_secondary_fixed')"
  export lightOnSecondaryFixedVariant="$(extract_color '.colors.light.on_secondary_fixed_variant')"
  export lightOnSurface="$(extract_color '.colors.light.on_surface')"
  export lightOnSurfaceVariant="$(extract_color '.colors.light.on_surface_variant')"
  export lightOnTertiary="$(extract_color '.colors.light.on_tertiary')"
  export lightOnTertiaryContainer="$(extract_color '.colors.light.on_tertiary_container')"
  export lightOnTertiaryFixed="$(extract_color '.colors.light.on_tertiary_fixed')"
  export lightOnTertiaryFixedVariant="$(extract_color '.colors.light.on_tertiary_fixed_variant')"
  export lightOutline="$(extract_color '.colors.light.outline')"
  export lightOutlineVariant="$(extract_color '.colors.light.outline_variant')"
  export lightPrimary="$(extract_color '.colors.light.primary')"
  export lightPrimaryContainer="$(extract_color '.colors.light.primary_container')"
  export lightPrimaryFixed="$(extract_color '.colors.light.primary_fixed')"
  export lightPrimaryFixedDim="$(extract_color '.colors.light.primary_fixed_dim')"
  export lightScrim="$(extract_color '.colors.light.scrim')"
  export lightSecondary="$(extract_color '.colors.light.secondary')"
  export lightSecondaryContainer="$(extract_color '.colors.light.secondary_container')"
  export lightSecondaryFixed="$(extract_color '.colors.light.secondary_fixed')"
  export lightSecondaryFixedDim="$(extract_color '.colors.light.secondary_fixed_dim')"
  export lightShadow="$(extract_color '.colors.light.shadow')"
  export lightSourceColor="$(extract_color '.colors.light.source_color')"
  export lightSurface="$(extract_color '.colors.light.surface')"
  export lightSurfaceBright="$(extract_color '.colors.light.surface_bright')"
  export lightSurfaceContainer="$(extract_color '.colors.light.surface_container')"
  export lightSurfaceContainerHigh="$(extract_color '.colors.light.surface_container_high')"
  export lightSurfaceContainerHighest="$(extract_color '.colors.light.surface_container_highest')"
  export lightSurfaceContainerLow="$(extract_color '.colors.light.surface_container_low')"
  export lightSurfaceContainerLowest="$(extract_color '.colors.light.surface_container_lowest')"
  export lightSurfaceDim="$(extract_color '.colors.light.surface_dim')"
  export lightSurfaceTint="$(extract_color '.colors.light.surface_tint')"
  export lightSurfaceVariant="$(extract_color '.colors.light.surface_variant')"
  export lightTertiary="$(extract_color '.colors.light.tertiary')"
  export lightTertiaryContainer="$(extract_color '.colors.light.tertiary_container')"
  export lightTertiaryFixed="$(extract_color '.colors.light.tertiary_fixed')"
  export lightTertiaryFixedDim="$(extract_color '.colors.light.tertiary_fixed_dim')"

  # =========================
  # DANK16
  # =========================

  export color0Default="$(extract_color '.dank16.color0.default')"
  export color0Light="$(extract_color '.dank16.color0.light')"
  export color0Dark="$(extract_color '.dank16.color0.dark')"

  export color1Default="$(extract_color '.dank16.color1.default')"
  export color1Light="$(extract_color '.dank16.color1.light')"
  export color1Dark="$(extract_color '.dank16.color1.dark')"

  export color2Default="$(extract_color '.dank16.color2.default')"
  export color2Light="$(extract_color '.dank16.color2.light')"
  export color2Dark="$(extract_color '.dank16.color2.dark')"

  export color3Default="$(extract_color '.dank16.color3.default')"
  export color3Light="$(extract_color '.dank16.color3.light')"
  export color3Dark="$(extract_color '.dank16.color3.dark')"

  export color4Default="$(extract_color '.dank16.color4.default')"
  export color4Light="$(extract_color '.dank16.color4.light')"
  export color4Dark="$(extract_color '.dank16.color4.dark')"

  export color5Default="$(extract_color '.dank16.color5.default')"
  export color5Light="$(extract_color '.dank16.color5.light')"
  export color5Dark="$(extract_color '.dank16.color5.dark')"

  export color6Default="$(extract_color '.dank16.color6.default')"
  export color6Light="$(extract_color '.dank16.color6.light')"
  export color6Dark="$(extract_color '.dank16.color6.dark')"

  export color7Default="$(extract_color '.dank16.color7.default')"
  export color7Light="$(extract_color '.dank16.color7.light')"
  export color7Dark="$(extract_color '.dank16.color7.dark')"

  export color8Default="$(extract_color '.dank16.color8.default')"
  export color8Light="$(extract_color '.dank16.color8.light')"
  export color8Dark="$(extract_color '.dank16.color8.dark')"

  export color9Default="$(extract_color '.dank16.color9.default')"
  export color9Light="$(extract_color '.dank16.color9.light')"
  export color9Dark="$(extract_color '.dank16.color9.dark')"

  export color10Default="$(extract_color '.dank16.color10.default')"
  export color10Light="$(extract_color '.dank16.color10.light')"
  export color10Dark="$(extract_color '.dank16.color10.dark')"

  export color11Default="$(extract_color '.dank16.color11.default')"
  export color11Light="$(extract_color '.dank16.color11.light')"
  export color11Dark="$(extract_color '.dank16.color11.dark')"

  export color12Default="$(extract_color '.dank16.color12.default')"
  export color12Light="$(extract_color '.dank16.color12.light')"
  export color12Dark="$(extract_color '.dank16.color12.dark')"

  export color13Default="$(extract_color '.dank16.color13.default')"
  export color13Light="$(extract_color '.dank16.color13.light')"
  export color13Dark="$(extract_color '.dank16.color13.dark')"

  export color14Default="$(extract_color '.dank16.color14.default')"
  export color14Light="$(extract_color '.dank16.color14.light')"
  export color14Dark="$(extract_color '.dank16.color14.dark')"

  export color15Default="$(extract_color '.dank16.color15.default')"
  export color15Light="$(extract_color '.dank16.color15.light')"
  export color15Dark="$(extract_color '.dank16.color15.dark')"
EOF
}

generate_omp_yaml() {
      cat > "$OUT_YAML" <<EOF
version: 4
blocks:
  - type: prompt
    alignment: left
    segments:
      - type: text
        template: " "   # minimal dummy segment
        foreground: "#ffffff"
palette:
  # Dark Theme Colors
  dark-background: "$(extract_color '.colors.dark.background')"
  dark-error: "$(extract_color '.colors.dark.error')"
  dark-error_container: "$(extract_color '.colors.dark.error_container')"
  dark-inverse_on_surface: "$(extract_color '.colors.dark.inverse_on_surface')"
  dark-inverse_primary: "$(extract_color '.colors.dark.inverse_primary')"
  dark-inverse_surface: "$(extract_color '.colors.dark.inverse_surface')"
  dark-on_background: "$(extract_color '.colors.dark.on_background')"
  dark-on_error: "$(extract_color '.colors.dark.on_error')"
  dark-on_error_container: "$(extract_color '.colors.dark.on_error_container')"
  dark-on_primary: "$(extract_color '.colors.dark.on_primary')"
  dark-on_primary_container: "$(extract_color '.colors.dark.on_primary_container')"
  dark-on_primary_fixed: "$(extract_color '.colors.dark.on_primary_fixed')"
  dark-on_primary_fixed_variant: "$(extract_color '.colors.dark.on_primary_fixed_variant')"
  dark-on_secondary: "$(extract_color '.colors.dark.on_secondary')"
  dark-on_secondary_container: "$(extract_color '.colors.dark.on_secondary_container')"
  dark-on_secondary_fixed: "$(extract_color '.colors.dark.on_secondary_fixed')"
  dark-on_secondary_fixed_variant: "$(extract_color '.colors.dark.on_secondary_fixed_variant')"
  dark-on_surface: "$(extract_color '.colors.dark.on_surface')"
  dark-on_surface_variant: "$(extract_color '.colors.dark.on_surface_variant')"
  dark-on_tertiary: "$(extract_color '.colors.dark.on_tertiary')"
  dark-on_tertiary_container: "$(extract_color '.colors.dark.on_tertiary_container')"
  dark-on_tertiary_fixed: "$(extract_color '.colors.dark.on_tertiary_fixed')"
  dark-on_tertiary_fixed_variant: "$(extract_color '.colors.dark.on_tertiary_fixed_variant')"
  dark-outline: "$(extract_color '.colors.dark.outline')"
  dark-outline_variant: "$(extract_color '.colors.dark.outline_variant')"
  dark-primary: "$(extract_color '.colors.dark.primary')"
  dark-primary_container: "$(extract_color '.colors.dark.primary_container')"
  dark-primary_fixed: "$(extract_color '.colors.dark.primary_fixed')"
  dark-primary_fixed_dim: "$(extract_color '.colors.dark.primary_fixed_dim')"
  dark-scrim: "$(extract_color '.colors.dark.scrim')"
  dark-secondary: "$(extract_color '.colors.dark.secondary')"
  dark-secondary_container: "$(extract_color '.colors.dark.secondary_container')"
  dark-secondary_fixed: "$(extract_color '.colors.dark.secondary_fixed')"
  dark-secondary_fixed_dim: "$(extract_color '.colors.dark.secondary_fixed_dim')"
  dark-shadow: "$(extract_color '.colors.dark.shadow')"
  dark-source_color: "$(extract_color '.colors.dark.source_color')"
  dark-surface: "$(extract_color '.colors.dark.surface')"
  dark-surface_bright: "$(extract_color '.colors.dark.surface_bright')"
  dark-surface_container: "$(extract_color '.colors.dark.surface_container')"
  dark-surface_container_high: "$(extract_color '.colors.dark.surface_container_high')"
  dark-surface_container_highest: "$(extract_color '.colors.dark.surface_container_highest')"
  dark-surface_container_low: "$(extract_color '.colors.dark.surface_container_low')"
  dark-surface_container_lowest: "$(extract_color '.colors.dark.surface_container_lowest')"
  dark-surface_dim: "$(extract_color '.colors.dark.surface_dim')"
  dark-surface_tint: "$(extract_color '.colors.dark.surface_tint')"
  dark-surface_variant: "$(extract_color '.colors.dark.surface_variant')"
  dark-tertiary: "$(extract_color '.colors.dark.tertiary')"
  dark-tertiary_container: "$(extract_color '.colors.dark.tertiary_container')"
  dark-tertiary_fixed: "$(extract_color '.colors.dark.tertiary_fixed')"
  dark-tertiary_fixed_dim: "$(extract_color '.colors.dark.tertiary_fixed_dim')"

    # Light Theme Colors
  light-background: "$(extract_color '.colors.light.background')"
  light-error: "$(extract_color '.colors.light.error')"
  light-error_container: "$(extract_color '.colors.light.error_container')"
  light-inverse_on_surface: "$(extract_color '.colors.light.inverse_on_surface')"
  light-inverse_primary: "$(extract_color '.colors.light.inverse_primary')"
  light-inverse_surface: "$(extract_color '.colors.light.inverse_surface')"
  light-on_background: "$(extract_color '.colors.light.on_background')"
  light-on_error: "$(extract_color '.colors.light.on_error')"
  light-on_error_container: "$(extract_color '.colors.light.on_error_container')"
  light-on_primary: "$(extract_color '.colors.light.on_primary')"
  light-on_primary_container: "$(extract_color '.colors.light.on_primary_container')"
  light-on_primary_fixed: "$(extract_color '.colors.light.on_primary_fixed')"
  light-on_primary_fixed_variant: "$(extract_color '.colors.light.on_primary_fixed_variant')"
  light-on_secondary: "$(extract_color '.colors.light.on_secondary')"
  light-on_secondary_container: "$(extract_color '.colors.light.on_secondary_container')"
  light-on_secondary_fixed: "$(extract_color '.colors.light.on_secondary_fixed')"
  light-on_secondary_fixed_variant: "$(extract_color '.colors.light.on_secondary_fixed_variant')"
  light-on_surface: "$(extract_color '.colors.light.on_surface')"
  light-on_surface_variant: "$(extract_color '.colors.light.on_surface_variant')"
  light-on_tertiary: "$(extract_color '.colors.light.on_tertiary')"
  light-on_tertiary_container: "$(extract_color '.colors.light.on_tertiary_container')"
  light-on_tertiary_fixed: "$(extract_color '.colors.light.on_tertiary_fixed')"
  light-on_tertiary_fixed_variant: "$(extract_color '.colors.light.on_tertiary_fixed_variant')"
  light-outline: "$(extract_color '.colors.light.outline')"
  light-outline_variant: "$(extract_color '.colors.light.outline_variant')"
  light-primary: "$(extract_color '.colors.light.primary')"
  light-primary_container: "$(extract_color '.colors.light.primary_container')"
  light-primary_fixed: "$(extract_color '.colors.light.primary_fixed')"
  light-primary_fixed_dim: "$(extract_color '.colors.light.primary_fixed_dim')"
  light-scrim: "$(extract_color '.colors.light.scrim')"
  light-secondary: "$(extract_color '.colors.light.secondary')"
  light-secondary_container: "$(extract_color '.colors.light.secondary_container')"
  light-secondary_fixed: "$(extract_color '.colors.light.secondary_fixed')"
  light-secondary_fixed_dim: "$(extract_color '.colors.light.secondary_fixed_dim')"
  light-shadow: "$(extract_color '.colors.light.shadow')"
  light-source_color: "$(extract_color '.colors.light.source_color')"
  light-surface: "$(extract_color '.colors.light.surface')"
  light-surface_bright: "$(extract_color '.colors.light.surface_bright')"
  light-surface_container: "$(extract_color '.colors.light.surface_container')"
  light-surface_container_high: "$(extract_color '.colors.light.surface_container_high')"
  light-surface_container_highest: "$(extract_color '.colors.light.surface_container_highest')"
  light-surface_container_low: "$(extract_color '.colors.light.surface_container_low')"
  light-surface_container_lowest: "$(extract_color '.colors.light.surface_container_lowest')"
  light-surface_dim: "$(extract_color '.colors.light.surface_dim')"
  light-surface_tint: "$(extract_color '.colors.light.surface_tint')"
  light-surface_variant: "$(extract_color '.colors.light.surface_variant')"
  light-tertiary: "$(extract_color '.colors.light.tertiary')"
  light-tertiary_container: "$(extract_color '.colors.light.tertiary_container')"
  light-tertiary_fixed: "$(extract_color '.colors.light.tertiary_fixed')"
  light-tertiary_fixed_dim: "$(extract_color '.colors.light.tertiary_fixed_dim')"

    # Dank16 Colors
  color0Default: "$(extract_color '.dank16.color0.default')"
  color0Light: "$(extract_color '.dank16.color0.light')"
  color0Dark: "$(extract_color '.dank16.color0.dark')"

  color1Default: "$(extract_color '.dank16.color1.default')"
  color1Light: "$(extract_color '.dank16.color1.light')"
  color1Dark: "$(extract_color '.dank16.color1.dark')"

  color2Default: "$(extract_color '.dank16.color2.default')"
  color2Light: "$(extract_color '.dank16.color2.light')"
  color2Dark: "$(extract_color '.dank16.color2.dark')"

  color3Default: "$(extract_color '.dank16.color3.default')"
  color3Light: "$(extract_color '.dank16.color3.light')"
  color3Dark: "$(extract_color '.dank16.color3.dark')"

  color4Default: "$(extract_color '.dank16.color4.default')"
  color4Light: "$(extract_color '.dank16.color4.light')"
  color4Dark: "$(extract_color '.dank16.color4.dark')"

  color5Default: "$(extract_color '.dank16.color5.default')"
  color5Light: "$(extract_color '.dank16.color5.light')"
  color5Dark: "$(extract_color '.dank16.color5.dark')"

  color6Default: "$(extract_color '.dank16.color6.default')"
  color6Light: "$(extract_color '.dank16.color6.light')"
  color6Dark: "$(extract_color '.dank16.color6.dark')"

  color7Default: "$(extract_color '.dank16.color7.default')"
  color7Light: "$(extract_color '.dank16.color7.light')"
  color7Dark: "$(extract_color '.dank16.color7.dark')"

  color8Default: "$(extract_color '.dank16.color8.default')"
  color8Light: "$(extract_color '.dank16.color8.light')"
  color8Dark: "$(extract_color '.dank16.color8.dark')"

  color9Default: "$(extract_color '.dank16.color9.default')"
  color9Light: "$(extract_color '.dank16.color9.light')"
  color9Dark: "$(extract_color '.dank16.color9.dark')"

  color10Default: "$(extract_color '.dank16.color10.default')"
  color10Light: "$(extract_color '.dank16.color10.light')"
  color10Dark: "$(extract_color '.dank16.color10.dark')"

  color11Default: "$(extract_color '.dank16.color11.default')"
  color11Light: "$(extract_color '.dank16.color11.light')"
  color11Dark: "$(extract_color '.dank16.color11.dark')"

  color12Default: "$(extract_color '.dank16.color12.default')"
  color12Light: "$(extract_color '.dank16.color12.light')"
  color12Dark: "$(extract_color '.dank16.color12.dark')"

  color13Default: "$(extract_color '.dank16.color13.default')"
  color13Light: "$(extract_color '.dank16.color13.light')"
  color13Dark: "$(extract_color '.dank16.color13.dark')"

  color14Default: "$(extract_color '.dank16.color14.default')"
  color14Light: "$(extract_color '.dank16.color14.light')"
  color14Dark: "$(extract_color '.dank16.color14.dark')"

  color15Default: "$(extract_color '.dank16.color15.default')"
  color15Light: "$(extract_color '.dank16.color15.light')"
  color15Dark: "$(extract_color '.dank16.color15.dark')"
EOF
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
  generate_sh
  generate_omp_yaml
  generate_kdl
''
