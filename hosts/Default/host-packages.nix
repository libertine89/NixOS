{ pkgs, ... }:
let
  vars = import ./variables.nix;
in
{
  ide = [
      ${vars.ide}
  ];
  environment.systemPackages = with pkgs; [
    ide 

    obsidian
    github-desktop
  ];
}
