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
    defaultWallpaper
    ;

  # scripts (unchanged)
  autoclicker = pkgs.callPackage ../scripts/hyprscripts/autoclicker.nix { };
  batterynotify = pkgs.callPackage ../scripts/hyprscripts/batterynotify.nix { };
  clipmanager = pkgs.callPackage ../scripts/hyprscripts/clipmanager.nix { };
  fileManagerScript = pkgs.callPackage ../scripts/hyprscripts/file-manager.nix { inherit terminal; };
  gamemode = pkgs.callPackage ../scripts/hyprscripts/gamemode.nix { };
  keyboardswitch = pkgs.callPackage ../scripts/hyprscripts/keyboardswitch.nix { };
  keybinds-yad = pkgs.callPackage ../scripts/hyprscripts/keybinds-yad.nix { };
  rofimusic = pkgs.callPackage ../scripts/hyprscripts/rofimusic.nix { };
  screen-record = pkgs.callPackage ../scripts/hyprscripts/screen-record.nix { };
  screenshot = pkgs.callPackage ../scripts/hyprscripts/screenshot.nix { };
  wallpaper = pkgs.callPackage ../scripts/hyprscripts/wallpaper.nix { inherit defaultWallpaper; };
  zoom = pkgs.callPackage ../scripts/hyprscripts/zoom.nix { };

  ctx = {
    inherit pkgs lib getExe getExe'
      browser terminal fileManager bar windowTheme
      kbdLayout kbdVariant defaultWallpaper;

    inherit keybinds-yad
      zoom gamemode clipmanager wallpaper
      batterynotify screen-record screenshot keyboardswitch fileManagerScript
      exec-once-kitty-quake;
  };
in
{
  imports = [
    ../../themes/${windowTheme}
    ../../bars/${bar}
    ../../utilities/rofi
    ../../utilities/wlogout
    ../../utilities/hypridle
    ../../utilities/hyprlock
  ]
  ++ lib.optional (bar != "hyprpanel") ../../utilities/swaync;

  environment.systemPackages = with pkgs; [
    pavucontrol
    swappy
    cliphist
    wl-clipboard
  ];

  security.polkit.enable = true;

  services.displayManager.sessionPackages = [
    pkgs.niri
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri
  };

  home-manager.sharedModules = [
    ({ config, ... }:
    let
      # Import modular hyprland config pieces
      conf = import ./confs { inherit ctx; };
    in
      {
        xdg.portal = {
          enable = true;
          extraPortals = [
            pkgs.xdg-desktop-portal-wlr
          ];
        };

      # Set wallpaper
      services.awww.enable = true;
    
      wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.niri;

        systemd = {
          enable = true;
          variables = [ "--all" ];
        };
        settings =
          let
            input = import ./confs/input.nix { inherit ctx; };
            output = import ./confs/output.nix { inherit ctx; };
            keybindings = import ./confs/keybindings.nix { inherit ctx; };
            switch-events = import ./confs/switch-events.nix { inherit ctx; };
            layout = import ./confs/layout.nix { inherit ctx; };
            general = import ./confs/general.nix { inherit ctx; }; #top level options
            window-rule = import ./confs/window-rule.nix { inherit ctx; }; 
            layer-rule = import ./confs/layer-rule.nix { inherit ctx; };
            animations = import ./confs/animations.nix { inherit ctx; };
            gestures = import ./confs/gestures.nix { inherit ctx; };
            recent-windows = import ./confs/recent-windows.nix { inherit ctx; };
            debug = import ./confs/debug.nix { inherit ctx; };
            autostart = import ./confs/autostart.nix { inherit ctx; };
          in
          {
           # any code here
          }
            // input
            // output 
            // keybindings
            // switch-events 
            // layout 
            // general
            // window-rule 
            // layer-rule 
            // animations
            // gestures
            // recent-windows 
            // debug
            // autostart;
      };
    }
  )
];
} 
