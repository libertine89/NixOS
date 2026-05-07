{ ctx, ... }:

''
// ── Global defaults ─────────────────────────────────────────────────────────
// Round every window's corners and clip content to match.
// Works best with prefer-no-csd (set in config.kdl).
window-rule {
    geometry-corner-radius 16
    clip-to-geometry true
}

// Dim unfocused windows slightly for visual hierarchy.
window-rule {
    match is-active=false
    opacity 0.9
}

// ── Per-app fixes ───────────────────────────────────────────────────────────

window-rule {
    // Match by "dropdown" app ID.
    // You need to set this app ID when running your terminal, e.g.:
    // spawn "alacritty" "--class" "dropdown"
    match app-id="^dropdown$"

    // Open it as floating.
    open-floating true
    // Anchor to the top edge of the screen.
    default-floating-position x=0 y=0 relative-to="top"
    // Half of the screen high.
    default-window-height { proportion 0.5; }
    // 80% of the screen wide.
    default-column-width { proportion 0.8; }
}

// WezTerm: work around initial configure bug (needs an empty default width).
window-rule {
    match app-id=r#"^org\.wezfurlong\.wezterm$"#
    default-column-width {}
}

// Firefox / Zen: picture-in-picture window opens floating.
window-rule {
    match app-id=r#"firefox$"# title="^Picture-in-Picture$"
    open-floating true
}
window-rule {
    match app-id=r#"zen$"# title="^Picture-in-Picture$"
    open-floating true
}

window-rule {
    match app-id="steam" title=r#"^notificationtoasts_\d+_desktop$"#
    default-floating-position x=10 y=10 relative-to="bottom-right"
}

// ── Privacy: block password managers from screen capture ────────────────────
// Uncomment the block below to hide these apps during screencasts.
// /-window-rule {
//     match app-id=r#"^org\.keepassxc\.KeePassXC$"#
//     match app-id=r#"^org\.gnome\.World\.Secrets$"#
//     block-out-from "screen-capture"
// }

// ── Floating apps ───────────────────────────────────────────────────────────
// Apps that work better as floating windows.
// window-rule {
//     match app-id="pavucontrol"
//     open-floating true
// }
// window-rule {
//     match app-id="nm-connection-editor"
//     open-floating true
// }
// window-rule {
//     match app-id=r#"^org\.gnome\.Calculator$"#
//     open-floating true
// }
''
