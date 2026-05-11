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
  wallpaper =  pkgs.callPackage ../scripts/niriscripts/wallpaper.nix { inherit defaultWallpaper; };
  toggle-dropdown = pkgs.callPackage ../scripts/niriscripts/toggle-dropdown.nix { };

ctx = {
  inherit pkgs lib getExe getExe' ide
  editor browser terminal fileManager bar 
  windowTheme kbdLayout kbdVariant defaultWallpaper;

  inherit ide-launcher wallpaper toggle-dropdown;
  };
in 
{
  imports = [
    ../../themes/${windowTheme}
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
      
      # ─────────────────────────────
      # Set Wallpaper
      # ─────────────────────────────
      services.awww.enable = true;
 

      home.file.".config/niri/config.kdl".text = ''
        ${import ./confs/input.nix { inherit pkgs ctx; }}
        ${import ./confs/gestures.nix { inherit pkgs ctx; }}
        ${import ./confs/output.nix { inherit pkgs ctx; }}
        ${import ./confs/autostart.nix { inherit pkgs ctx; }}
        ${import ./confs/general.nix { inherit pkgs ctx; }}
        ${import ./confs/keybindings.nix { inherit pkgs ctx; }}
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
