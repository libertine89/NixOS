{
  host,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  inherit (lib) getExe getExe';

  inherit (import ../../../hosts/${host}/variables.nix)
    bar
    windowTheme
    browser
    terminal
    ide
    fileManager
    kbdLayout
    kbdVariant
    defaultWallpaper;

  # ─────────────────────────────
  # Scripts
  # ─────────────────────────────
  autoclicker = pkgs.callPackage ../scripts/autoclicker.nix { };
  batterynotify = pkgs.callPackage ../scripts/batterynotify.nix { };
  clipmanager = pkgs.callPackage ../scripts/clipmanager.nix { };
  fileManagerScript = pkgs.callPackage ../scripts/file-manager.nix { inherit terminal; };
  gamemode = pkgs.callPackage ../scripts/gamemode.nix { };
  keyboardswitch = pkgs.callPackage ../scripts/keyboardswitch.nix { };
  keybinds-ui = pkgs.callPackage ../scripts/keybinds-yad.nix { };
  rofimusic = pkgs.callPackage ../scripts/rofimusic.nix { };
  screen-record = pkgs.callPackage ../scripts/screen-record.nix { };
  screenshot = pkgs.callPackage ../scripts/screenshot.nix { };
  wallpaper = pkgs.callPackage ../scripts/wallpaper.nix { inherit defaultWallpaper; };
  zoom = pkgs.callPackage ../scripts/zoom.nix { };

  ctx = {
    inherit pkgs lib getExe getExe'
      browser terminal fileManager bar windowTheme
      kbdLayout kbdVariant defaultWallpaper
      autoclicker batterynotify clipmanager fileManagerScript
      gamemode keyboardswitch keybinds-ui rofimusic
      screen-record screenshot wallpaper zoom;
  };

in
{
  # ─────────────────────────────
  # SYSTEM LEVEL
  # ─────────────────────────────
  environment.systemPackages = with pkgs; [
    pavucontrol
    swappy
    cliphist
    wl-clipboard
    niri
  ];

  security.polkit.enable = true;

  services.displayManager.sessionPackages = [
    pkgs.niri
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  # ─────────────────────────────
  # HOME MANAGER (FULL NIRI MODULE HERE)
  # ─────────────────────────────
  home-manager.sharedModules = [
    ({ pkgs, ... }:

    let
      # ─────────────────────────────
      # NIRI CONFIG MODULE IMPORTS
      # ─────────────────────────────
      niriSettings =
        (import ./confs/input.nix { inherit ctx; })
        // (import ./confs/output.nix { inherit ctx; })
        // (import ./confs/keybindings.nix { inherit ctx; })
        // (import ./confs/switchevents.nix { inherit ctx; })
        // (import ./confs/layout.nix { inherit ctx; })
        // (import ./confs/general.nix { inherit ctx; }) #top level options
        // (import ./confs/windowrule.nix { inherit ctx; }) 
        // (import ./confs/layerrule.nix { inherit ctx; })
        // (import ./confs/animations.nix { inherit ctx; })
        // (import ./confs/gestures.nix { inherit ctx; })
        // (import ./confs/recentwindows.nix { inherit ctx; })
        // (import ./confs/debug.nix { inherit ctx; })
        // (import ./confs/autostart.nix { inherit ctx; });

    in
    {
      # ─────────────────────────────
      # GENERAL HOME MANAGER SETTINGS
      # ─────────────────────────────
      xdg.portal = {
        enable = true;
        extraPortals = [
          pkgs.xdg-desktop-portal-wlr
        ];
      };

      services.aww.enable = true;

      # ─────────────────────────────
      # NIRI CONFIG ENTRYPOINT
      # ─────────────────────────────
      programs.niri.settings = niriSettings;
    })
  ];
}
