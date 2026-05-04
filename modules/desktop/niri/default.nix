{ pkgs, ... }:

{
  # ─────────────────────────────
  # Niri compositor
  # ─────────────────────────────
  environment.systemPackages = [
    pkgs.niri
  ];

  # ─────────────────────────────
  # SDDM login manager
  # ─────────────────────────────
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;

  # ─────────────────────────────
  # Register Niri session
  # ─────────────────────────────
  services.displayManager.sessionPackages = [
    pkgs.niri
  ];

  # ─────────────────────────────
  # Wayland essentials
  # ─────────────────────────────
  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
  };

  # ─────────────────────────────
  # Basic Wayland environment
  # ─────────────────────────────
  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
  };
}
