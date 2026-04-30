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
    browser
    terminal
    fileManager
    kbdLayout
    kbdVariant
    defaultWallpaper
    ;

  # scripts (unchanged)
  autoclicker = pkgs.callPackage ./scripts/autoclicker.nix { };
  batterynotify = pkgs.callPackage ./scripts/batterynotify.nix { };
  clipmanager = pkgs.callPackage ./scripts/clipmanager.nix { };
  fileManagerScript = pkgs.callPackage ./scripts/file-manager.nix { inherit terminal; };
  gamemode = pkgs.callPackage ./scripts/gamemode.nix { };
  keyboardswitch = pkgs.callPackage ./scripts/keyboardswitch.nix { };
  keybinds-yad = pkgs.callPackage ./scripts/keybinds-yad.nix { };
  rofimusic = pkgs.callPackage ./scripts/rofimusic.nix { };
  screen-record = pkgs.callPackage ./scripts/screen-record.nix { };
  screenshot = pkgs.callPackage ./scripts/screenshot.nix { };
  wallpaper = pkgs.callPackage ./scripts/wallpaper.nix { inherit defaultWallpaper; };
  zoom = pkgs.callPackage ./scripts/zoom.nix { };
  wrap-workspaces-next = pkgs.callPackage ./scripts/wrap-workspaces-next.nix {};
  wrap-workspaces-prev = pkgs.callPackage ./scripts/wrap-workspaces-prev.nix {};
  toggle-layout = pkgs.callPackage ./scripts/toggle-layout.nix {};

  ctx = {
    inherit pkgs lib getExe getExe'
      browser terminal fileManager bar;

    inherit keybinds-yad toggle-layout wrap-workspaces-next
      wrap-workspaces-prev zoom gamemode clipmanager
      batterynotify screen-record screenshot keyboardswitch fileManagerScript;
  };
in
{
  imports = [
    ../../themes/Catppuccin
    ./programs/${bar}
    ./programs/wlogout
    ./programs/rofi
    ./programs/hypridle
    ./programs/hyprlock
  ];

  home-manager.sharedModules = [
    ({ config, ... }:
    let
      # Import modular hyprland config pieces
      conf = import ./confs { inherit ctx; };
    in
    {
      wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;

        plugins = [
          # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprwinwrap
          # inputs.hyprsysteminfo.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];

        systemd = {
          enable = true;
          variables = [ "--all" ];
        };

        settings =
          {
            # base/global config still here
            "$mainMod" = "SUPER";
            "$term" = "${getExe pkgs.${terminal}}";
            "$editor" = "code --disable-gpu";
            "$browser" = browser;
          }
          // conf.env
          // conf.autostart 
          // conf.animations
          // conf.decoration
          // conf.keybindings
          // conf.monitors
          // conf.workspaces
          // conf.windowrules
          // conf.general
          // conf.layerrules;
      };
    })
  ];
}
