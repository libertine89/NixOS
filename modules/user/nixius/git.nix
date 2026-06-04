# modules/user/git-config.nix
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Chris";      # replace or override in user file
    userEmail = "cdraper_electrical@hotmail.co.uk"; # replace or override in user file

    extraConfig = {
      "pull.rebase" = "false";
    };
  };
}
