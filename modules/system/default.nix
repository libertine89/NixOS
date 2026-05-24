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
    ./plymouth.nix
    # ./virtualisation.nix
  ];
}
