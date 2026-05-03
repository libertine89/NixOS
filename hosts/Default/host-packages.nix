{ pkgs, ... }:
let
  vars = import ./variables.nix;
in
{
  environment.systemPackages = with pkgs; [
    pkgs.${vars.ide}
    libreoffice
    bitwarden-desktop
    asciiquarium
    cmatrix
    figlet
    peazip
    docker
    pgadmin4
    gnome-calculator
    obsidian
    github-desktop
  ];
}
