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
  # HOME MANAGER CONFIG (CORRECTLY PLACED)
  # ─────────────────────────────
#  home-manager.sharedModules = [
#    ({ pkgs, ... }:
#    {
#   # ─────────────────────────────
#   # NIRI CONFIG VIA HOME MANAGER
#   # ─────────────────────────────
#      xdg.configFile."niri/config.kdl".text = ''
#        binds {
#          Mod+T spawn "kitty"
#          Mod+Y spawn "kitty -e yazi"
#          Mod+Shift+E quit
#        }
#      '';
#    })
#  ];
}
