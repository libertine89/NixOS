{ lib, ... }:
let
  vars = import ./variables.nix;
in
{
  imports = [
    ./hardware-configuration.nix
    ./host-packages.nix

    # Core Modules (Don't change unless you know what you're doing)
    ../../modules/scripts
    ../../modules/core/bash.nix
    ../../modules/core/zsh.nix
    ../../modules/core/fonts.nix
    ../../modules/core/nh.nix
    ../../modules/core/packages.nix
    ../../modules/core/printing.nix
    ../../modules/core/syncthing.nix
    ../../modules/core/home-manager.nix
    ../../modules/core/${vars.shellPrompt}/${vars.shellPrompt}.nix
    # ../../modules/core/flatpak.nix

    # System Modules
    ../../modules/system/boot.nix
    ../../modules/system/dns.nix
    ../../modules/system/hardware.nix
    ../../modules/system/network.nix
    ../../modules/system/plymouth.nix
    ../../modules/system/sddm.nix
    ../../modules/system/security.nix
    ../../modules/system/services.nix
    ../../modules/system/system.nix

    # Optional
    ../../modules/hardware/drives # Automatically mount extra external/internal drives
    ../../modules/hardware/video/${vars.videoDriver}.nix # Enable gpu drivers defined in variables.nix
    ../../modules/desktop/${vars.desktop} # Set window manager defined in variables.nix
    ../../modules/programs/browser/${vars.browser} # Set browser defined in variables.nix
    ../../modules/programs/terminal/${vars.terminal} # Set terminal defined in variables.nix
    ../../modules/programs/editor/${vars.editor} # Set editor defined in variables.nix
    ../../modules/programs/file-manager/${vars.fileManager} # Set file-manager defined in variables.nix
    ../../modules/programs/cli/tmux
    ../../modules/programs/cli/direnv
    ../../modules/programs/cli/lazygit
    ../../modules/programs/cli/cava
    ../../modules/programs/cli/fastfetch
    ../../modules/programs/cli/btop
    ../../modules/programs/media/discord
    ../../modules/programs/media/spicetify
    ../../modules/programs/media/mpv
    ../../modules/programs/misc/tlp
    ../../modules/programs/misc/lact # GPU fan, clock and power configuration
  ]
  ++ lib.optional (vars.games == true) ../../modules/core/games.nix;
}
