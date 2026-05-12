{ config, pkgs, lib, ... }:

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
  ];

  # Force power management
  services.tlp.enable = lib.mkForce false;
  services.power-profiles-daemon.enable = lib.mkForce true;
}
