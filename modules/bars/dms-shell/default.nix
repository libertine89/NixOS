{ pkgs, inputs, ... }:

{
  imports = [
    inputs.dms.nixosModules.default
    inputs.dms-plugin-registry.modules.default
  ];

  programs.dms-shell = {
    enable = true;

    package =
      inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    # Core features
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableClipboardPaste = true;

    plugins = {
      # dankBatteryAlerts.enable = true;
      # dockerManager.enable = true;
    };
  };
}
