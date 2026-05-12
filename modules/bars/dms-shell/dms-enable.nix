{ config, pkgs, lib, ... }:

let
  dmsWrapper = pkgs.writeShellScriptBin "run-dms" ''
    #!/usr/bin/env bash
    # Start XWayland if not running
    pgrep Xwayland || Xwayland :0 -rootless &

    # Export env for GTK apps
    export DISPLAY=:0
    export XDG_SESSION_TYPE=wayland
    export GDK_BACKEND=x11

    # Allow X access
    ${pkgs.xorg.xhost}/bin/xhost +SI:localuser:$USER

    # Run DMS
    exec ${pkgs.dms}/bin/dms run
  '';
in
{
  options.dms = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Dank Material Shell";
    };
  };

  config = lib.mkIf config.dms.enable {
    programs.niri.autostart = [
      { name = "DMS"; command = dmsWrapper; }
    ];
  };
}
