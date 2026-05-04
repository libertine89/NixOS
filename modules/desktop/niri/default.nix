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
  terminal
  ide
  fileManager
  kbdLayout
  kbdVariant
  defaultWallpaper;
in 
{
  imports = [
    ../../bars/${bar}
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
  services.xserver.displayManager.sddm.enable = true;

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

  xdg.portal.enable = true;

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
        binds {
          Mod+Return {
            spawn "kitty"
          }
          Mod+y {
            spawn "kitty" "-e" "yazi"
          }
        }
      '';
    })
  ];
}
