{
  host,
  lib,
  pkgs,
  inputs,
  dmsWrapper,
  ...
}:

let
  inherit (lib) getExe getExe';
  inherit (import ../../../hosts/${host}/variables.nix)
  bar
  windowTheme
  browser
  terminal
  editor
  ide
  fileManager
  kbdLayout
  kbdVariant
  defaultWallpaper;

  ide-launcher = pkgs.callPackage ../scripts/niriscripts/ide-launcher.nix { };
  wallpaper =  pkgs.callPackage ../scripts/niriscripts/wallpaper.nix { inherit defaultWallpaper; };
  toggle-dropdown = pkgs.callPackage ../scripts/niriscripts/toggle-dropdown.nix { };
  colourVariablesNvim = pkgs.callPackage ../scripts/niriscripts/colourVariablesNvim.nix { };
  colourVariablesOhMyPosh = pkgs.callPackage ../scripts/niriscripts/colourVariablesOhMyPosh.nix { };
  colourVariablesStarship = pkgs.callPackage ../scripts/niriscripts/colourVariablesStarship.nix { };
  noctaliaOnWallpaperChanged = pkgs.callPackage ../scripts/niriscripts/noctaliaOnWallpaperChanged.nix { };
  windowBehaviour = pkgs.callPackage ../scripts/niriscripts/window-behaviour.nix { };
  overviewCommands = pkgs.callPackage ../scripts/niriscripts/overview-commands.nix { };

  ctx = {
    inherit pkgs lib getExe getExe' ide
    editor browser terminal fileManager bar
    windowTheme kbdLayout kbdVariant defaultWallpaper;

    inherit ide-launcher wallpaper toggle-dropdown
    colourVariablesNvim colourVariablesOhMyPosh colourVariablesStarship
    noctaliaOnWallpaperChanged windowBehaviour overviewCommands;
    }
    // lib.optionalAttrs (bar == "dms-shell") { inherit dmsWrapper; };
in
{
  imports = [
   ../../themes/${windowTheme}
   ../../bars/${bar}
   ../../utilities/rofi
  ]
  ++ lib.optional (bar != "hyprpanel" && bar != "dms-shell") ../../utilities/swaync;

  # ─────────────────────────────
  # Niri compositor
  # ─────────────────────────────
  environment.systemPackages = with pkgs; [
    niri
    xwayland-satellite
    gtk4
    libadwaita
    kitty
    yazi
    python3
  ];

  # ─────────────────────────────
  # SDDM login manager
  # ─────────────────────────────
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;

  # ─────────────────────────────
  # Niri session
  # ─────────────────────────────
  services.displayManager.sessionPackages = [
    pkgs.niri
  ];

  # ─────────────────────────────
  # Wayland essentials
  # ─────────────────────────────
  services.dbus.enable = true;

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];

    config = {
      common = {
        default = [ "gtk" ];
      };
    };
  };

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    GDK_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    NIXOS_OZONE_WL = "1";
  };

  # ─────────────────────────────
  # Home Manager integration
  # ─────────────────────────────
  home-manager.sharedModules = [
    ({ config, pkgs, ... }: {
      home.packages = with pkgs; [
        kitty
        yazi
      ];

      # ─────────────────────────────
      # Set Wallpaper
      # ─────────────────────────────
      services.awww.enable =
        bar != "dms-shell" && bar != "noctalia-shell";

      home.file.".config/niri/config.kdl".text = ''
        ${import ./confs/input.nix { inherit pkgs ctx; }}
        ${import ./confs/gestures.nix { inherit pkgs ctx; }}
        ${import ./confs/output.nix { inherit pkgs ctx; }}
        ${import ./confs/autostart.nix { inherit pkgs ctx; }}
        ${import ./confs/general.nix { inherit pkgs ctx; }}
        ${import ./confs/keybindings.nix { inherit config pkgs ctx; }}
        ${import ./confs/windowrule.nix { inherit pkgs ctx; }}
        ${import ./confs/layout.nix { inherit pkgs ctx; }}
        ${import ./confs/layerrule.nix { inherit pkgs ctx; }}
        ${import ./confs/animations.nix { inherit pkgs ctx; }}
        ${import ./confs/switchevents.nix { inherit pkgs ctx; }}
        ${import ./confs/recentwindows.nix { inherit pkgs ctx; }}
        ${import ./confs/debug.nix { inherit pkgs ctx; }}
      '';
    })
  ];
}
