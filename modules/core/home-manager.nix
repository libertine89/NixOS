{
  inputs,
  host,
  ...
}:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  programs.dconf.enable = true; # Enable dconf for home-manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    overwriteBackup = true;
    backupFileExtension = "backup";

    extraSpecialArgs = {
      inherit inputs host;
    };
  };
}
