{ config, lib, pkgs, ... }:

{
  home.username = "nixius";
  home.homeDirectory = "/home/nixius";

  home.stateVersion = "26.05";

  home.file.".config/starship.toml".source =
  config.lib.file.mkOutOfStoreSymlink ./starship/starship.toml;

}
