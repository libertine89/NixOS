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
  editor
  ide
  fileManager
  kbdLayout
  kbdVariant
  defaultWallpaper;

  ide-launcher = pkgs.callPackage ../scripts/niriscripts/ide-launcher.nix { };
  
ctx = {
  inherit pkgs lib getExe getExe' ide
  editor browser terminal fileManager bar 
  windowTheme kbdLayout kbdVariant defaultWallpaper;

  inherit ide-launcher;
  };
in 
{
  imports = [
    ../../bars/${bar}
    ../../utilities/rofi
  ]
  ++ lib.optional (bar != "hyprpanel") ../../utilities/swaync;

  # ─────────────────────────────
  # Niri compositor
  # ─────────────────────────────
  environment.systemPackages = with pkgs; [
    niri
    kitty
    yazi
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

  # xdg.portal.enable = true;
  
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
  };

  # ─────────────────────────────
  # Home Manager integration
  # ─────────────────────────────
  home-manager.sharedModules = [
    ({ pkgs, ... }: {
      home.packages = with pkgs; [
        kitty
        yazi
      ];

      home.file.".config/niri/config.kdl".text = ''
        ${import ./confs/keybindings.nix { inherit pkgs ctx; }}
        ${import ./confs/autostart.nix { inherit pkgs ctx; }}
        ${import ./confs/animations.nix { inherit pkgs ctx; }}
      '';
    })
  ];
}
