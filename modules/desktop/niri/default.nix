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
  # ─────────────────────────────
  # NIRI CONFIG (KEY PART)
  # ─────────────────────────────
  home-manager.sharedModules = [
    ({ pkgs, ... }:

    {
      home.file.".config/niri/config.kdl".text = ''
        binds {

            # ─────────────────────
            # BASIC TEST BINDS
            # ─────────────────────

            Mod+T spawn "kitty"
            Mod+Y spawn "kitty -e yazi"

            # fallback exit (always useful)
            Mod+Shift+E quit
        }
      '';
}
