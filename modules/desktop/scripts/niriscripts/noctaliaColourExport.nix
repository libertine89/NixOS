# Exports Noctalia v5's resolved wallpaper palette into the legacy
# ~/.config/noctalia/colors.json form (mPrimary, mSurface, ...) that the
# nvim and starship colour-variable generators consume. Wired up through
# Noctalia's [hooks] (started / wallpaper_changed / colors_changed) via
# noctaliaColourPipeline.nix.
{ pkgs, ... }:

pkgs.writeShellScriptBin "noctalia-colours-export" ''
  #!/usr/bin/env bash

  set -euo pipefail

  SCHEME="faithful" # same generator as [theme].wallpaper_scheme in shell config
  OUT_JSON="$HOME/.config/noctalia/colors.json"

  # 1) Resolve the active wallpaper: ask the running shell first, fall back
  #    to the persisted state file (works before IPC is up).
  WALL="$(noctalia msg wallpaper-get 2>/dev/null || true)"
  if [ -z "$WALL" ]; then
      WALL="$(awk '/^\[wallpaper\.default\]/{f=1;next} /^\[/{f=0} f && $0 ~ /^path/ {sub(/^path = "/,""); sub(/"$/,""); print; exit}' "$HOME/.local/state/noctalia/settings.toml" 2>/dev/null || true)"
  fi

  # Solid-colour wallpapers have no image to sample - keep existing colours.
  if [ -z "$WALL" ] || [ ! -f "$WALL" ]; then
      echo "noctalia-colours-export: no usable wallpaper ('$WALL'), keeping existing colours" >&2
      exit 0
  fi

  # 2) Generate the palette from the image, dark variant (matches v4
  #    colors.json which only carried the dark set).
  PAL="$(noctalia theme "$WALL" --scheme "$SCHEME" --dark)"
  echo "$PAL" | ${pkgs.jq}/bin/jq -e 'has("primary")' > /dev/null

  # 3) Translate v5 role names into the legacy m* keys.
  echo "$PAL" | ${pkgs.jq}/bin/jq -n \
      --argjson p "$(cat /dev/stdin)" \
      '{
          mPrimary:          $p.primary,
          mOnPrimary:        $p.on_primary,
          mSecondary:        $p.secondary,
          mOnSecondary:      $p.on_secondary,
          mTertiary:         $p.tertiary,
          mOnTertiary:       $p.on_tertiary,
          mError:            $p.error,
          mOnError:          $p.on_error,
          mSurface:          $p.surface,
          mOnSurface:        $p.on_surface,
          mSurfaceVariant:   $p.surface_variant,
          mOnSurfaceVariant: $p.on_surface_variant,
          mOutline:          $p.outline,
          mShadow:           $p.shadow,
          mHover:            $p.hover,
          mOnHover:          $p.on_hover
      }' > "''${OUT_JSON}.tmp"

  mkdir -p "$(dirname "$OUT_JSON")"
  mv "''${OUT_JSON}.tmp" "$OUT_JSON"
  echo "noctalia-colours-export: exported colours from $WALL"
''
