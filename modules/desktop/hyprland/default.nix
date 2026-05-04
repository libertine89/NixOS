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
  gamemode = pkgs.callPackage ../scripts/hyprscripts/hyprscripts/gamemode.nix { };
  keyboardswitch = pkgs.callPackage ../scripts/hyprscripts/keyboardswitch.nix { };
  keybinds-yad = pkgs.callPackage ../scripts/hyprscripts/keybinds-yad.nix { };
  rofimusic = pkgs.callPackage ../scripts/hyprscripts/rofimusic.nix { };
  screen-record = pkgs.callPackage ../scripts/hyprscripts/screen-record.nix { };
  screenshot = pkgs.callPackage ../scripts/hyprscripts/screenshot.nix { };
  wallpaper = pkgs.callPackage ../scripts/hyprscripts/wallpaper.nix { inherit defaultWallpaper; };
  zoom = pkgs.callPackage ../scripts/hyprscripts/zoom.nix { };
  wrap-workspaces-next = pkgs.callPackage ../scripts/hyprscripts/wrap-workspaces-next.nix {};
  wrap-workspaces-prev = pkgs.callPackage ../scripts/hyprscripts/wrap-workspaces-prev.nix {};
  wrap-window-workspace-next = pkgs.callPackage ../scripts/hyprscripts/wrap-window-workspace-next.nix {};
  wrap-window-workspace-prev = pkgs.callPackage ../scripts/hyprscripts/wrap-window-workspace-prev.nix {};
  toggle-layout = pkgs.callPackage ../scripts/hyprscripts/toggle-layout.nix {};
  exec-once-kitty-quake = pkgs.callPackage ../scripts/hyprscripts/exec-once-kitty-quake.nix {};

  ctx = {
    inherit pkgs lib getExe getExe'
      browser terminal fileManager bar windowTheme
      kbdLayout kbdVariant defaultWallpaper;

    inherit keybinds-yad toggle-layout wrap-workspaces-next
      wrap-workspaces-prev wrap-window-workspace-next wrap-window-workspace-prev 
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

  systemd.user.services.hyprpolkitagent = {
    description = "Hyprpolkitagent - Polkit authentication agent";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
  services.displayManager.defaultSession = "hyprland";

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;# pkgs.hyprland;
    # withUWSM = true;
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
          extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
          ];
          xdgOpenUsePortal = true;
          configPackages = [ config.wayland.windowManager.hyprland.package ];
          config.hyprland = {
            default = [
              "hyprland"
              "gtk"
            ];
            "org.freedesktop.impl.portal.OpenURI" = "gtk";
            "org.freedesktop.impl.portal.FileChooser" = "gtk";
            "org.freedesktop.impl.portal.Print" = "gtk";
          };
        };

        xdg.configFile."hypr/icons" = {
          source = ./icons;
          recursive = true;
        };

      # Set wallpaper
      services.awww.enable = true;
    
      wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;

        plugins = [
          # scrolloverview # = inputs.hyprlandScrollOverview.packages.${pkgs.system}.default;
          # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprwinwrap
          # inputs.hyprsysteminfo.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];

        systemd = {
          enable = true;
          variables = [ "--all" ];
        };
        settings =
          let
            animations = import ./confs/animations.nix { inherit ctx; };
            keybindings = import ./confs/keybindings.nix { inherit ctx; };
            env = import ./confs/environments.nix { inherit ctx; };
            decorations = import ./confs/decorations.nix { inherit ctx; };
            general = import ./confs/general.nix { inherit ctx; };
            layerrules = import ./confs/layerrules.nix { inherit ctx; };
            windowrules = import ./confs/windowrules.nix { inherit ctx; };
            monitors = import ./confs/monitors.nix { inherit ctx; };
            workspaces = import ./confs/workspaces.nix { inherit ctx; };
            autostart = import ./confs/autostart.nix { inherit ctx; };
          in
          {
            "$mainMod" = "SUPER";
            "$term" = "${getExe pkgs.${terminal}}";
            "$editor" = "code --disable-gpu";
            "$browser" = browser;
          }
          // env
          // autostart
          // animations
          // decorations
          // keybindings
          // monitors
          // workspaces
          // windowrules
          // general  
          // layerrules;
      };
    }
  )
];
} 
