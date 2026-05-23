{ host, config, pkgs, lib, ... }:

let
  vars = import ../hosts/${host}/variables.nix;
in
{
  home.username = vars.username;
  home.homeDirectory = "/home/${vars.username}";
  home.stateVersion = "26.05";

  xdg.enable = true;

  sessionVariables = {
    EDITOR =
      if (vars.editor == "nixvim" || vars.editor == "neovim" || vars.editor == "nvchad") then
        "nvim"
      else if vars.editor == "vscode" then
        "code"
      else
        "nano";

    BROWSER = vars.browser;
    TERMINAL = vars.terminal;
  };

  home.file = lib.optionalAttrs (vars.shellPrompt == "starship") {
    ".config/starship.toml".source =
      config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/NixOS/modules/core/starship/starship.toml";
  };
}
