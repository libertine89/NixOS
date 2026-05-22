{ config, pkgs, lib, ... }:

{
  home.username = "nixius";
  home.homeDirectory = "/home/nixius";

  home.packages = [];

  home.file.".config/starship.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS/modules/core/starship.toml";
}
