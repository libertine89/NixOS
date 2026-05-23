{ pkgs, ... }:

pkgs.writeShellScriptBin "generate-color-variables-ohmyposh" ''
  #!/usr/bin/env bash

  set -euo pipefail

  DMS_COLORS="$HOME/.cache/DankMaterialShell/dms-colors.json"
  THEME_FILE="$HOME/NixOS/modules/core/oh-my-posh/oh-my-posh.omp.json"

  TMP_FILE="$(mktemp)"

  # Build palette JSON from DankMaterialShell colours
  PALETTE_JSON="$(
    jq '
    {
      darkBackground: .colors.dark.background,
      darkError: .colors.dark.error,
      darkErrorContainer: .colors.dark.error_container,
      darkInverseOnSurface: .colors.dark.inverse_on_surface,
      darkInversePrimary: .colors.dark.inverse_primary,
      darkInverseSurface: .colors.dark.inverse_surface,
      darkOnBackground: .colors.dark.on_background,
      darkOnError: .colors.dark.on_error,
      darkOnErrorContainer: .colors.dark.on_error_container,
      darkOnPrimary: .colors.dark.on_primary,
      darkOnPrimaryContainer: .colors.dark.on_primary_container,
      darkOnPrimaryFixed: .colors.dark.on_primary_fixed,
      darkOnPrimaryFixedVariant: .colors.dark.on_primary_fixed_variant,
      darkOnSecondary: .colors.dark.on_secondary,
      darkOnSecondaryContainer: .colors.dark.on_secondary_container,
      darkOnSecondaryFixed: .colors.dark.on_secondary_fixed,
      darkOnSecondaryFixedVariant: .colors.dark.on_secondary_fixed_variant,
      darkOnSurface: .colors.dark.on_surface,
      darkOnSurfaceVariant: .colors.dark.on_surface_variant,
      darkOnTertiary: .colors.dark.on_tertiary,
      darkOnTertiaryContainer: .colors.dark.on_tertiary_container,
      darkOnTertiaryFixed: .colors.dark.on_tertiary_fixed,
      darkOnTertiaryFixedVariant: .colors.dark.on_tertiary_fixed_variant,
      darkOutline: .colors.dark.outline,
      darkOutlineVariant: .colors.dark.outline_variant,
      darkPrimary: .colors.dark.primary,
      darkPrimaryContainer: .colors.dark.primary_container,
      darkPrimaryFixed: .colors.dark.primary_fixed,
      darkPrimaryFixedDim: .colors.dark.primary_fixed_dim,
      darkScrim: .colors.dark.scrim,
      darkSecondary: .colors.dark.secondary,
      darkSecondaryContainer: .colors.dark.secondary_container,
      darkSecondaryFixed: .colors.dark.secondary_fixed,
      darkSecondaryFixedDim: .colors.dark.secondary_fixed_dim,
      darkShadow: .colors.dark.shadow,
      darkSourceColor: .colors.dark.source_color,
      darkSurface: .colors.dark.surface,
      darkSurfaceBright: .colors.dark.surface_bright,
      darkSurfaceContainer: .colors.dark.surface_container,
      darkSurfaceContainerHigh: .colors.dark.surface_container_high,
      darkSurfaceContainerHighest: .colors.dark.surface_container_highest,
      darkSurfaceContainerLow: .colors.dark.surface_container_low,
      darkSurfaceContainerLowest: .colors.dark.surface_container_lowest,
      darkSurfaceDim: .colors.dark.surface_dim,
      darkSurfaceTint: .colors.dark.surface_tint,
      darkSurfaceVariant: .colors.dark.surface_variant,
      darkTertiary: .colors.dark.tertiary,
      darkTertiaryContainer: .colors.dark.tertiary_container,
      darkTertiaryFixed: .colors.dark.tertiary_fixed,
      darkTertiaryFixedDim: .colors.dark.tertiary_fixed_dim,

      lightBackground: .colors.light.background,
      lightError: .colors.light.error,
      lightErrorContainer: .colors.light.error_container,
      lightInverseOnSurface: .colors.light.inverse_on_surface,
      lightInversePrimary: .colors.light.inverse_primary,
      lightInverseSurface: .colors.light.inverse_surface,
      lightOnBackground: .colors.light.on_background,
      lightOnError: .colors.light.on_error,
      lightOnErrorContainer: .colors.light.on_error_container,
      lightOnPrimary: .colors.light.on_primary,
      lightOnPrimaryContainer: .colors.light.on_primary_container,
      lightOnPrimaryFixed: .colors.light.on_primary_fixed,
      lightOnPrimaryFixedVariant: .colors.light.on_primary_fixed_variant,
      lightOnSecondary: .colors.light.on_secondary,
      lightOnSecondaryContainer: .colors.light.on_secondary_container,
      lightOnSecondaryFixed: .colors.light.on_secondary_fixed,
      lightOnSecondaryFixedVariant: .colors.light.on_secondary_fixed_variant,
      lightOnSurface: .colors.light.on_surface,
      lightOnSurfaceVariant: .colors.light.on_surface_variant,
      lightOnTertiary: .colors.light.on_tertiary,
      lightOnTertiaryContainer: .colors.light.on_tertiary_container,
      lightOnTertiaryFixed: .colors.light.on_tertiary_fixed,
      lightOnTertiaryFixedVariant: .colors.light.on_tertiary_fixed_variant,
      lightOutline: .colors.light.outline,
      lightOutlineVariant: .colors.light.outline_variant,
      lightPrimary: .colors.light.primary,
      lightPrimaryContainer: .colors.light.primary_container,
      lightPrimaryFixed: .colors.light.primary_fixed,
      lightPrimaryFixedDim: .colors.light.primary_fixed_dim,
      lightScrim: .colors.light.scrim,
      lightSecondary: .colors.light.secondary,
      lightSecondaryContainer: .colors.light.secondary_container,
      lightSecondaryFixed: .colors.light.secondary_fixed,
      lightSecondaryFixedDim: .colors.light.secondary_fixed_dim,
      lightShadow: .colors.light.shadow,
      lightSourceColor: .colors.light.source_color,
      lightSurface: .colors.light.surface,
      lightSurfaceBright: .colors.light.surface_bright,
      lightSurfaceContainer: .colors.light.surface_container,
      lightSurfaceContainerHigh: .colors.light.surface_container_high,
      lightSurfaceContainerHighest: .colors.light.surface_container_highest,
      lightSurfaceContainerLow: .colors.light.surface_container_low,
      lightSurfaceContainerLowest: .colors.light.surface_container_lowest,
      lightSurfaceDim: .colors.light.surface_dim,
      lightSurfaceTint: .colors.light.surface_tint,
      lightSurfaceVariant: .colors.light.surface_variant,
      lightTertiary: .colors.light.tertiary,
      lightTertiaryContainer: .colors.light.tertiary_container,
      lightTertiaryFixed: .colors.light.tertiary_fixed,
      lightTertiaryFixedDim: .colors.light.tertiary_fixed_dim,

      color0Default: .dank16.color0.default,
      color0Light: .dank16.color0.light,
      color0Dark: .dank16.color0.dark,

      color1Default: .dank16.color1.default,
      color1Light: .dank16.color1.light,
      color1Dark: .dank16.color1.dark,

      color2Default: .dank16.color2.default,
      color2Light: .dank16.color2.light,
      color2Dark: .dank16.color2.dark,

      color3Default: .dank16.color3.default,
      color3Light: .dank16.color3.light,
      color3Dark: .dank16.color3.dark,

      color4Default: .dank16.color4.default,
      color4Light: .dank16.color4.light,
      color4Dark: .dank16.color4.dark,

      color5Default: .dank16.color5.default,
      color5Light: .dank16.color5.light,
      color5Dark: .dank16.color5.dark,

      color6Default: .dank16.color6.default,
      color6Light: .dank16.color6.light,
      color6Dark: .dank16.color6.dark,

      color7Default: .dank16.color7.default,
      color7Light: .dank16.color7.light,
      color7Dark: .dank16.color7.dark,

      color8Default: .dank16.color8.default,
      color8Light: .dank16.color8.light,
      color8Dark: .dank16.color8.dark,

      color9Default: .dank16.color9.default,
      color9Light: .dank16.color9.light,
      color9Dark: .dank16.color9.dark,

      color10Default: .dank16.color10.default,
      color10Light: .dank16.color10.light,
      color10Dark: .dank16.color10.dark,

      color11Default: .dank16.color11.default,
      color11Light: .dank16.color11.light,
      color11Dark: .dank16.color11.dark,

      color12Default: .dank16.color12.default,
      color12Light: .dank16.color12.light,
      color12Dark: .dank16.color12.dark,

      color13Default: .dank16.color13.default,
      color13Light: .dank16.color13.light,
      color13Dark: .dank16.color13.dark,

      color14Default: .dank16.color14.default,
      color14Light: .dank16.color14.light,
      color14Dark: .dank16.color14.dark,

      color15Default: .dank16.color15.default,
      color15Light: .dank16.color15.light,
      color15Dark: .dank16.color15.dark
    }
    ' "$DMS_COLORS"
  )"

  # Replace existing palette or create one if missing
  jq \
    --argjson palette "$PALETTE_JSON" \
    '
    .palette = $palette
    ' \
    "$THEME_FILE" > "$TMP_FILE"

  mv "$TMP_FILE" "$THEME_FILE"

  echo "Updated Oh My Posh palette in:"
  echo "  $THEME_FILE"
''
