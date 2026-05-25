{ host, pkgs, ... }:

let
  inherit (import ../../hosts/${host}/variables.nix)
    plymouthTheme;
  # Adi1090 Good themes
    # angular_alt, blockchain, connect, cubes, dark_planet, deus_ex, dna
    # flame, glowing, green_blocks, hexagon_dots_alt, hud_2, motion, square
    # More - https://github.com/adi1090x/plymouth-themes/
in
{
  boot = {
    plymouth = {
      enable = true;
      theme = "${plymouthTheme}";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "${plymouthTheme}" ];
        })
      ];
    };

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];

    # loader.timeout = 0; # Handled in boot.nix

    # boot.initrd.systemd.enable = true; # Use for luks login
  };
}
