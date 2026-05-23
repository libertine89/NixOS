{ host, config, lib, pkgs, ... }:

let
  inherit (import ../hosts/${host}/variables.nix)
    username browser terminal editor shellPrompt
  ;
in
{
    users.${username} = {
      # Let Home Manager install and manage itself.
      programs.home-manager.enable = true;
      xdg.enable = true;

      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "26.05"; # Do not change!
        sessionVariables = {
          EDITOR =
            if (editor == "nixvim" || editor == "neovim" || editor == "nvchad") then
              "nvim"
            else if editor == "vscode" then
              "code"
            else
              "nano";
          BROWSER = "${browser}";
          TERMINAL = "${terminal}";

          # if (shellPrompt == "starship") =
          home.file.".config/starship.toml".source =
            config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS/modules/core/starship/starship.toml";
        };
      };
    };

}
