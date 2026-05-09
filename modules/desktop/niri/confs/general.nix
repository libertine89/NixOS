{ ctx, ... }:

''

prefer-no-csd

screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

// environment {
//     QT_QPA_PLATFORM "wayland"
//     DISPLAY null
// }

// cursor {
//     xcursor-theme "breeze_cursors"
//     xcursor-size 48
// 
//     hide-when-typing
//     hide-after-inactive-ms 1000
// }

overview {
    zoom 0.5
    // backdrop-color "#4c566a80" //irrelevant if you use wallaper

    workspace-shadow {
        // off
        softness 40
        spread 10
        offset x=0 y=10
        color "#00000050"
    }
}

xwayland-satellite {
    off
    // path "xwayland-satellite"
}

clipboard {
    disable-primary
}

hotkey-overlay {
    skip-at-startup
    hide-not-bound
}

// config-notification {
//     disable-failed
// }

blur {
   // off
   passes 3
   offset 3.0
   noise 0.02
   saturation 1.5
}
''
