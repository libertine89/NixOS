# modules/user/git-config.nix
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Chriss";
        email = "cdraper_electrical@hotmail.co.uk";
      };

      pull = {
        rebase = "false";   # ✅ must be string, not boolean
      };
    };
  };
}
