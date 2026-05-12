{ config, pkgs, lib, ... }:

let
  dmsWrapper = pkgs.writeShellScriptBin "run-dms" ''
    #!/usr/bin/env bash
    pgrep Xwayland || Xwayland :0 -rootless &

    export DISPLAY=:0
    export XDG_SESSION_TYPE=wayland
    export GDK_BACKEND=x11

    exec dms run
  '';
in
{
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

    plugins = {
      # dockerManager.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    xwayland
    dmsWrapper 
  ];

  _module.args.dmsWrapper = dmsWrapper;

  services.tlp.enable = lib.mkForce false;
  services.power-profiles-daemon.enable = lib.mkForce true;
}
