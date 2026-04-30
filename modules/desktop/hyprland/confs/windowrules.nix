{ ctx }:

{
  windowrule = [

    # =========================
    # Browsers (full opacity)
    # =========================
    "opacity 1.00 1.00, match:class ^(firefox|Brave-browser|floorp|zen|zen-beta)$"

    # =========================
    # Editors / dev tools (slight transparency)
    # =========================
    "opacity 0.90 0.80, match:class ^(Emacs|nvim-wrapper|VSCodium|codium-url-handler|code|code-url-handler)$"
    "opacity 0.90 0.80, match:class ^(obsidian|gcr-prompter)$"
    "opacity 0.90 0.80, match:title ^(Hyprland Polkit Agent)$"

    # =========================
    # Games / heavy apps
    # =========================
    "opacity 0.90 0.80, match:class ^(heroic|Lutris|lutris|net.lutris.Lutris)$"
    "opacity 0.80 0.70, match:class ^(Steam|steam|steamwebhelper|com.obsproject.Studio)$"
    "opacity 0.80 0.70, match:class ^(Spotify|spotify|com.github.th_ch.youtube_music)$"
    "opacity 0.80 0.70, match:class ^(Signal|WebCord)$"

    # =========================
    # Terminals
    # =========================
    "opacity 0.80 0.70, match:class ^(
        kitty|
        alacritty|
        wezterm
        )$"

    # =========================
    # File managers / system tools
    # =========================
    "opacity 0.80 0.70, match:class ^(
        org.gnome.Nautilus|
        Thunar|
        pcmanfm|
        org.kde.dolphin|
        org.kde.ark|
        gnome-disks|
        org.gnome.FileRoller
        )$"

    # =========================
    # GTK / Qt tools
    # =========================
    "opacity 0.80 0.70, match:class ^(
        qt5ct|
        qt6ct|
        nwg-look|
        yad|
        gjs
        )$"

    # =========================
    # Comms / utilities
    # =========================
    "opacity 0.80 0.70, match:class ^(
        discord|
        com.github.rafostar.Clapper|
        com.github.tchx84.Flatseal|
        hu.kramo.Cartridges|
        app.drey.Warp|
        net.davidotek.pupgui2|
        io.gitlab.theevilskeleton.Upscaler
        )$"

    # =========================
    # System utilities
    # =========================
    "opacity 0.80 0.70, match:class ^(
        pavucontrol|
        blueman-manager|
        nm-applet|
        nm-connection-editor|
        org.kde.polkit-kde-authentication-agent-1|
        xdg-desktop-portal-gtk|
        xdg-desktop-portal-kde
        )$"

    # =========================
    # Picture-in-Picture
    # =========================
    "float on, match:title ^(Picture-in-Picture)$, match:class ^(
        zen|
        zen-beta|
        floorp|
        firefox
        )$"

      "pin on, match:title ^(Picture-in-Picture)$, match:class ^(
          zen|
          zen-beta|
          floorp|
          firefox
          )$"

    # =========================
    # Games tagging system
    # =========================
    "content game, match:tag games"
    "tag +games, match:content 3"
    "tag +games, match:class ^(
          steam_app.*|
          steam_app_[0-9]+
          )$"
    "tag +games, match:class ^(
          gamescope|
          Waydroid|
          osu!
          )$"

    "sync_fullscreen on, match:tag games"
    "fullscreen on, match:tag games"
    "border_size 0, match:tag games"
    "no_shadow on, match:tag games"
    "no_blur on, match:tag games"
    "no_anim on, match:tag games"

    # =========================
    # Godot
    # =========================
    "tile on, match:initial_title ^(Godot)$, match:initial_class ^(Godot)$"
    "float on, match:title ^(.*DEBUG.*), match:class ^(Godot)$"

    # =========================
    # microfetch popup
    # =========================
    "opacity 0.80 0.70, match:class ^(microfetch)$"
    "float on, match:class ^(microfetch)$"
    "center on, match:class ^(microfetch)$"
    "size 802 261, match:class ^(microfetch)$"

  ];
}
