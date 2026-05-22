{ config, pkgs, ... }:

{
  nixius = import ../../users/nixius.nix { inherit config pkgs; };
}
