{ pkgs, ... }:
let
  vars = import ./variables.nix;
in
{
  environment.systemPackages = with pkgs; [
    pkgs.${vars.ide}
    libreoffice
    bitwarden-desktop
    peazip
    docker
    pgadmin4
    gnome-calculator
    github-desktop
    xournalpp
    qview
    snapper
    bat
  ];
}
