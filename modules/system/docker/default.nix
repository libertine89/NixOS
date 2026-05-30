{ host, pkgs, ... }:
let
  inherit (import ../../../hosts/${host}/variables.nix)
    username;
in
{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  users.extraGroups.docker.members = [
    "${username}"
  ];

  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    lazydocker
  ];
}
