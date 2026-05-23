{
  pkgs,
  inputs,
  host,
  lib,
  config,
  ...
}:
let
  inherit (import ../../hosts/${host}/variables.nix)
    username
    shell
    ;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  programs.dconf.enable = true; # Enable dconf for home-manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    overwriteBackup = true;
    backupFileExtension = "backup";

  };
}
