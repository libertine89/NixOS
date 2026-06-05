{ pkgs, ... }:
let
  vars = import ./variables.nix; # SHE
in
{
  environment.systemPackages = with pkgs; [
    libreoffice
    bitwarden-desktop
    peazip
    gnome-calculator
    xournalpp
    qview
    libqalculate
  ];
}
