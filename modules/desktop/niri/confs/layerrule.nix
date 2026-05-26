{ ctx, ... }:

let
  inherit (ctx)
  pkgs lib getExe
  bar;
in
''
// ── Examples ────────────────────────────────────────────────────────────────
// Make a specific layer surface semi-transparent:
// layer-rule {
//     match namespace="waybar"
//     opacity 0.9
// }
//
// Block a layer surface from screen capture:
// layer-rule {
//     match namespace="some-private-overlay"
//     block-out-from "screencast"
// }

// Set up what controls wallpaper
  ${if bar == "noctalia-shell" then ''
  layer-rule {
      match namespace="^noctalia-overview-Virtual-1"
      place-within-backdrop true
  }
  ''
  else if bar == "dms-shell" then ''
  include "dms/wpblur.kdl"
  layer-rule {
      match namespace="^awww-daemon$"
      place-within-backdrop true
  }
  ''
  else ''
  layer-rule {
      match namespace="^awww-daemon$"
      place-within-backdrop true
  }
  ''}
''
