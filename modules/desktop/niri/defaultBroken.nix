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

  # ─────────────────────────────────────────────
  # 🔥 FIX #1: STOP USING "//" (this was WRONG)
  # ─────────────────────────────────────────────
  niriSettings =
      (import ./confs/input.nix { inherit ctx; }) + "\n"
    + (import ./confs/output.nix { inherit ctx; }) + "\n"
    + (import ./confs/keybindings.nix { inherit ctx; }) + "\n"
    + (import ./confs/switchevents.nix { inherit ctx; }) + "\n"
    + (import ./confs/layout.nix { inherit ctx; }) + "\n"
    + (import ./confs/general.nix { inherit ctx; }) + "\n"
    + (import ./confs/windowrule.nix { inherit ctx; }) + "\n"
    + (import ./confs/layerrule.nix { inherit ctx; }) + "\n"
    + (import ./confs/animations.nix { inherit ctx; }) + "\n"
    + (import ./confs/gestures.nix { inherit ctx; }) + "\n"
    + (import ./confs/recentwindows.nix { inherit ctx; }) + "\n"
    + (import ./confs/debug.nix { inherit ctx; }) + "\n"
    + (import ./confs/autostart.nix { inherit ctx; });

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

  # services.displayManager.defaultSesson = "niri";

  programs.niri = {
    enable = true;
    package = inputs.nixpkgs.legacyPackages.${pkgs.system}.niri;
  };

  # ─────────────────────────────
  # HOME MANAGER
  # ─────────────────────────────
  home-manager.sharedModules = [
    ({ pkgs, ... }:

    {
      xdg.portal = {
        enable = true;
        extraPortals = [
          pkgs.xdg-desktop-portal-wlr
        ];
      };

      # services.aww.enable = true;

      # ─────────────────────────────
      # 🔥 FIX #2: this now expects STRING (KDL)
      # ─────────────────────────────
      home.file.".config/niri/config.kdl".text = '' input { keyboard { xkb { layout "us";}}}   '';
      #niriSettings;
    })
  ];
}
