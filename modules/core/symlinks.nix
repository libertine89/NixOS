{ host, config, lib, pkgs, ... }:

let
  vars = import ../../hosts/${host}/variables.nix {};
in
{
  home-manager.users.${vars.username} = {
    home.file.".config/starship.toml".source =
    config.lib.file.mkOutOfStoreSymlink ./starship/starship.toml;
  };
}
