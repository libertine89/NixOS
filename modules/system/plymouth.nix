
{ pkgs, ... }:

{
  home-manager.sharedModules = [
    (_: {
      programs.plymouth = {
        enable = true;

      };
    })
  ];
}
