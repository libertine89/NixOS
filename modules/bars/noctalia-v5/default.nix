# Noctalia v5 bar - native C++ shell, no Quickshell involved.
#
# The v4 implementation lives in ../noctalia-shell/ and is untouched; switch
# bars by changing `bar` in hosts/Default/variables.nix.
{
  inputs,
  host,
  pkgs,
  ...
}:

let
  # Full colour pipeline: v5 palette (faithful) -> colors.json -> nvim
  # lua variables + starship.toml palette block. Wired into [hooks] below,
  # so no spawn-at-startup legwork is needed.
  noctaliaColourPipeline =
    pkgs.callPackage ../../desktop/scripts/niriscripts/noctaliaColourPipeline.nix { };
in
{
  # Optional Dependencies
  environment.systemPackages = with pkgs; [
    wl-clipboard
    brightnessctl
    xwayland
  ];

  home-manager.sharedModules = [
    ({ config, ... }: {
      imports = [
        inputs.noctalia-v5.homeModules.default
      ];

      programs.noctalia = {
        enable = true;
        systemd.enable = false; # started via niri spawn-at-startup
        package = inputs.noctalia-v5.packages.${pkgs.system}.default;

        # Nix attrset -> TOML (~/.config/noctalia/config.toml), validated at
        # build time by `noctalia config validate`. Keys translated from the
        # v4 settings in ../noctalia-shell/default.nix.
        settings = {
          # ─────────────────────────────
          # Theme - v4: colorSchemes.useWallpaperColors + generationMethod = faithful
          # ─────────────────────────────
          theme = {
            mode = "dark";
            source = "wallpaper";
            wallpaper_scheme = "faithful";
          };

          # ─────────────────────────────
          # Global shell
          # ─────────────────────────────
          shell = {
            font_family = "JetBrainsMonoNL NFP ExtraBold"; # v4: ui.fontDefault
            ui_scale = 0.85; # v4: general.scaleRatio
            avatar_path = "${config.home.homeDirectory}/NixOS/modules/bars/noctalia-shell/profile-picture.jpg"; # v4: general.avatarImage
            telemetry_enabled = false;
            setup_wizard_enabled = false;
          };

          # ─────────────────────────────
          # Bar
          # ─────────────────────────────
          bar = {
            order = [ "main" ];
          };

          bar.main = {
            position = "top";
            enabled = true;
            auto_hide = false; # v4: displayMode = always_visible
            show_on_workspace_switch = true; # v4: showOnWorkspaceSwitch
            reserve_space = true;
            layer = "top";
            background_opacity = 1.0; # v4: backgroundOpacity
            compositor_blur = true; # v4: general.enableBlurBehind
            border = "outline_variant";
            border_width = 0.0; # v4: showOutline = false
            radius = 12; # v4: frameRadius
            margin_edge = 8; # v4: marginVertical
            margin_ends = 10; # v4: marginHorizontal
            padding = 2; # v4: contentPadding
            widget_spacing = 1; # v4: widgetSpacing
            font_scale = 0.84; # v4: ui.fontDefaultScale
            scale = 0.85; # v4: general.scaleRatio (bar content)
            capsule = false; # v4: showCapsule = false
            shadow = true; # v4: general.enableShadows

            # v4: bar.widgets.left
            start = [
              "control-center"
              "workspaces"
              "audio_visualizer"
            ];
            # v4: bar.widgets.center
            center = [
              "active_window"
            ];
            # v4: bar.widgets.right
            end = [
              "tray"
              "sysmon"
              "clock"
              "caffeine" # v4: KeepAwake
              "session" # v4: SessionMenu
            ];
          };

          bar.main.dead_zone.actions = {
            right = "panel-toggle control-center"; # v4: rightClickAction = controlCenter
          };

          # v4: widgets.left Workspace widget
          widget.workspaces = {
            show_labels = false; # v4: labelMode = "none"
            pill_scale = 0.6; # v4: pillSize
            focused_color = "primary";
            occupied_color = "secondary";
            empty_color = "secondary";
          };

          # v4: widgets.left AudioVisualizer widget
          widget.audio_visualizer.color = "primary"; # v4: colorName

          # v4: widgets.right Clock widget
          widget.clock = {
            format = "%a, %d %b %H:%M"; # v4: formatHorizontal = "ddd, dd MMM HH:mm"
            tooltip_format = "%H:%M %a, %b %d"; # v4: tooltipFormat = "HH:mm ddd, MMM dd"
          };

          # ─────────────────────────────
          # Wallpaper - v4: wallpaper.*
          # ─────────────────────────────
          wallpaper = {
            directory = "${config.home.homeDirectory}/NixOS/modules/themes/wallpapers";
            fill_mode = "crop"; # v4: fillMode
            transition = [
              "fade"
              "disc"
              "stripes"
              "wipe"
              "pixel"
              "honeycomb"
            ]; # v4: transitionType
            transition_duration = 1500; # v4: transitionDuration
            transition_on_startup = true; # v4: skipStartupTransition = false
          };

          # ─────────────────────────────
          # Location - v4: location.name / autoLocate + manual sunrise/sunset
          # ─────────────────────────────
          location = {
            address = "London, United Kingdom";
            auto_locate = false;
            custom_schedule = true;
            sunrise = "06:30"; # v4: manualSunrise
            sunset = "18:30"; # v4: manualSunset
          };

          # ─────────────────────────────
          # Night light - v4: nightLight.*
          # Schedule follows [location]; v4 had forced + autoSchedule both,
          # which effectively ran on the fixed schedule above.
          # ─────────────────────────────
          nightlight = {
            enabled = true;
            temperature_day = 6500; # v4: dayTemp
            temperature_night = 4000; # v4: nightTemp
          };

          # ─────────────────────────────
          # Notifications
          # v4: notifications.enabled = false (toasts via OSD only).
          # v5 needs the daemon enabled for notification history/Mod+N to work.
          # ─────────────────────────────
          notification = {
            enable_daemon = true;
          };

          # ─────────────────────────────
          # Backdrop - niri overview wallpaper blur (replaces the
          # noctalia-overview layer surface + layerrule of v4)
          # ─────────────────────────────
          backdrop = {
            enabled = true;
          };

          # ─────────────────────────────
          # Hooks - color export -> nvim/starship variables
          # (replaces v4 hooks.colorGeneration + the spawn-at-startup call)
          # ─────────────────────────────
          hooks = {
            started = "${noctaliaColourPipeline}";
            wallpaper_changed = "${noctaliaColourPipeline}";
            colors_changed = "${noctaliaColourPipeline}";
          };
        };
      };
    })
  ];
}
