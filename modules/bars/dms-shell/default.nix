{ config, pkgs, lib, inputs, ... }:

let
  # === Get Bar to Display ===
  dmsWrapper = pkgs.writeShellScriptBin "run-dms" ''
    #!/usr/bin/env bash
    pgrep Xwayland || Xwayland :0 -rootless &

    export DISPLAY=:0
    export XDG_SESSION_TYPE=wayland
    export GDK_BACKEND=x11

    exec dms run
  '';

  # Import your scripts as derivations
  onWallpaperChanged = pkgs.callPackage ../../desktop/scripts/niriscripts/onWallpaperChanged.nix {};
in
{
  # === System-level configuration (NixOS) ===
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

  # === Home Manager configuration (user-level) ===
  home-manager.sharedModules = [
    (_:       
      let
        layoutSettings = import ./conf/layout.nix;
        systemSettings = import ./conf/system.nix;
        themeSettings = import ./conf/theme.nix;
        widgetsSettings = import ./conf/widgets.nix;
        sessionDefaults = import ./conf/session.nix;
      in
      {
      imports = [
        inputs.dms.homeModules.dank-material-shell
        inputs.dms-plugin-registry.modules.default  
        inputs.danksearch.homeModules.dsearch
      ];

      programs.dank-material-shell.enable = true;
      programs.dank-material-shell.settings =
        pkgs.lib.recursiveUpdate
          (pkgs.lib.recursiveUpdate
            (pkgs.lib.recursiveUpdate layoutSettings systemSettings)
            themeSettings)
          widgetsSettings;
      # Dont initial session so DMS can update wallpaper
      #programs.dank-material-shell.session = { isLightMode = false; };

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
        dankActions = { enable = true; };
        dankHooks = { enable = true; };
      };

      programs.dank-material-shell.managePluginSettings = false;

      programs.dsearch.enable = true;

      # Generate plugin JSON
      home.file.".config/DankMaterialShell/plugin_settings.json" = {
        text = builtins.toJSON {
          dankHooks = {
            enabled = true;
            wallpaperPath = "${onWallpaperChanged}";
          };
          dankActions = { enabled = true; };
        };
      };

      home.activation.dankSessionSeed = ''
        mkdir -p ~/.local/state/DankMaterialShell
        if [ ! -f ~/.local/state/DankMaterialShell/session.json ]; then
          cat > ~/.local/state/DankMaterialShell/session.json <<EOF
            ${builtins.toJSON sessionDefaults}
EOF
          chmod 600 ~/.local/state/DankMaterialShell/session.json
        fi
      '';
      
      home.packages = [
        pkgs.xwayland
        dmsWrapper
      ];
    })
  ];
}
