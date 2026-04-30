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

  # Import script modules
  # autowaybar = pkgs.callPackage ./scripts/autowaybar.nix { };
  autoclicker = pkgs.callPackage ./scripts/autoclicker.nix { };
  batterynotify = pkgs.callPackage ./scripts/batterynotify.nix { };
  clipmanager = pkgs.callPackage ./scripts/clipmanager.nix { };
  fileManagerScript = pkgs.callPackage ./scripts/file-manager.nix { inherit terminal; };
  gamemode = pkgs.callPackage ./scripts/gamemode.nix { };
  keyboardswitch = pkgs.callPackage ./scripts/keyboardswitch.nix { };
  keybinds-yad = pkgs.callPackage ./scripts/keybinds-yad.nix { };
  # keybinds-rofi = pkgs.callPackage ./scripts/keybinds-yad.nix { };
  # mediactrl = pkgs.callPackage ./scripts/mediactrl.nix { };
  rofimusic = pkgs.callPackage ./scripts/rofimusic.nix { };
  screen-record = pkgs.callPackage ./scripts/screen-record.nix { };
  screenshot = pkgs.callPackage ./scripts/screenshot.nix { };
  wallpaper = pkgs.callPackage ./scripts/wallpaper.nix { inherit defaultWallpaper; };
  zoom = pkgs.callPackage ./scripts/zoom.nix { };
  wrap-workspaces-next = pkgs.callPackage ./scripts/wrap-workspaces-next.nix {};
  wrap-workspaces-prev = pkgs.callPackage ./scripts/wrap-workspaces-prev.nix {};
  toggle-layout = pkgs.callPackage ./scripts/toggle-layout.nix {};
  toggle-kitty-quake = pkgs.callPackage ./scripts/toggle-kitty-quake.nix {};
in
{
  imports = [
    ../../themes/Catppuccin # Catppuccin GTK and QT themes
    ./programs/${bar}
    ./programs/wlogout
    ./programs/rofi
    ./programs/hypridle
    ./programs/hyprlock
  ];



  home-manager.sharedModules = [
    (
      { config, ... }:


        #test later systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
        wayland.windowManager.hyprland = {
          enable = true;
          package = inputs.hyprland.packages.${pkgs.system}.hyprland; #pkgs.hyprland;
          plugins = [
            # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprwinwrap
            # inputs.hyprsysteminfo.packages.${pkgs.stdenv.hostPlatform.system}.default
          ];
          systemd = {
            enable = true;
            variables = [ "--all" ];
          };
          settings = {
            "$mainMod" = "SUPER";
            "$term" = "${getExe pkgs.${terminal}}";
            "$editor" = "code --disable-gpu";
            "$browser" = browser;


           

    




          };
        };
      }
    )
  ];
}
