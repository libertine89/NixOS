{ config, pkgs, lib, inputs, ... }:

let
  # Your wrapper script
  dmsWrapper = pkgs.writeShellScriptBin "run-dms" ''
    #!/usr/bin/env bash
    pgrep Xwayland || Xwayland :0 -rootless &
    export DISPLAY=:0
    export XDG_SESSION_TYPE=wayland
    export GDK_BACKEND=x11
    exec dms run
  '';

  # Import the external script
  onWallpaperChanged = pkgs.callPackage ../../modules/desktop/scripts/niriscripts/onWallpaperChanged.nix {};
in
{
  # === System-level configuration ===
  environment.systemPackages = with pkgs; [
    xwayland
    dmsWrapper
  ];

  services.tlp.enable = lib.mkForce false;
  services.power-profiles-daemon.enable = lib.mkForce true;

  programs.dms-shell = {
    enable = true;
    package = pkgs.dms-shell;

    systemd.enable = true;
    systemd.restartIfChanged = true;

    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableClipboardPaste = true;
  };

  _module.args.dmsWrapper = dmsWrapper;

  # === Home Manager configuration ===
  home-manager.sharedModules = [
    (_: {
      imports = [
        inputs.dms.homeModules.dank-material-shell
        inputs.dms-plugin-registry.modules.default
      ];

      programs.dank-material-shell.enable = true;

      programs.dank-material-shell.settings = {
        theme = "dark";
        dynamicTheming = true;
      };

      programs.dank-material-shell.session = {
        isLightMode = false;
      };

      programs.dank-material-shell.clipboardSettings = {
        maxHistory = 25;
        maxEntrySize = 5242880;
        autoClearDays = 1;
        clearAtStartup = true;
        disabled = false;
        disableHistory = false;
        disablePersist = true;
      };

      programs.dank-material-shell.plugins = {
        dankHooks = {
          enable = true;
          wallpaperPath = "${lib.getExe onWallpaperChanged}";  # absolute path to nix-store script
        };
        dankActions = {
          enable = true;
        };
      };

      programs.dank-material-shell.managePluginSettings = true;

      home.packages = [
        pkgs.xwayland
        dmsWrapper
      ];
    })
  ];
}
