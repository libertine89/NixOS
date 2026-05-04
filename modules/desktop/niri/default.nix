{ pkgs, inputs, ... }:

let
  unstablePkgs = inputs.nixpkgs.legacyPackages.${pkgs.system};
in
{
  # ─────────────────────────────
  # Install Niri (UNSTABLE)
  # ─────────────────────────────
  environment.systemPackages = [
    unstablePkgs.niri
  ];

  # ─────────────────────────────
  # Enable X + SDDM
  # ─────────────────────────────
  services.xserver.enable = true;

  services.xserver.displayManager.sddm.enable = true;

  # ─────────────────────────────
  # Register Niri as a session
  # ─────────────────────────────
  services.displayManager.sessionPackages = [
    unstablePkgs.niri
  ];

  # ─────────────────────────────
  # REQUIRED FOR WAYLAND (SDDM FIXES)
  # ─────────────────────────────
  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    WLR_BACKENDS = "drm";
  };

  environment.variables = {
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
  };

  services.dbus.enable = true;

  xdg.portal.enable = true;
}
