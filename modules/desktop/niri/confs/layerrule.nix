{ ctx, ... }:

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
''
