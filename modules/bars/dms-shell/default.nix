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
        sessionDefaults = import ./conf/session.nix;
        vimKeybinds = import ./cheatsheets/vim.nix;
        configFiles = [
          (import ./conf/layout.nix)
          (import ./conf/bar.nix)
          (import ./conf/dock.nix)
          (import ./conf/system.nix)
          (import ./conf/theme.nix)
          (import ./conf/widgets.nix)
        ];
         # Merge them into one settings attribute set
         dmsSettings = pkgs.lib.foldl' pkgs.lib.recursiveUpdate {} configFiles;
      in
      {
      imports = [
        inputs.dms.homeModules.dank-material-shell
        inputs.dms-plugin-registry.modules.default
        inputs.danksearch.homeModules.dsearch
      ];

      # Set up DMS settings
      programs.dank-material-shell.enable = true;
      programs.dank-material-shell.settings = dmsSettings;

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

      # Set up plugin settings JSON
      home.file.".config/DankMaterialShell/plugin_settings.json" = {
        text = builtins.toJSON {
          dankHooks = {
            enabled = true;
            wallpaperPath = "${onWallpaperChanged}";
          };
          dankActions = { enabled = true; };
        };
      };
      # Seed DMS session json
      home.activation.dankSessionSeed = ''
        mkdir -p ~/.local/state/DankMaterialShell
        if [ ! -f ~/.local/state/DankMaterialShell/session.json ]; then
          cat > ~/.local/state/DankMaterialShell/session.json <<EOF
            ${builtins.toJSON sessionDefaults}
EOF
          chmod 600 ~/.local/state/DankMaterialShell/session.json
        fi
      '';

      # Set up Cheatsheets
      home.file.".config/DankMaterialShell/cheatsheets/vim.json" = {
        text = builtins.toJSON vimKeybinds;
      };

      home.packages = [
        pkgs.xwayland
        dmsWrapper
      ];
    })
  ];
}
