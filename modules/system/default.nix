{ ... }:
{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./network.nix
    ./sddm.nix
    ./security.nix
    ./dns.nix
    ./services.nix
    ./system.nix
    ./users.nix
    # ./virtualisation.nix
  ];
}
