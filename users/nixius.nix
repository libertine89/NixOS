{ host, config, pkgs, lib, ... }:

let
  vars = import ../hosts/${host}/variables.nix;
in
{
  # Import User specific Modules
  imports = [
    # ../modules/user/nixius-pkg.nix
    ../modules/user/nixius/git.nix
    ../modules/user/nixius/zed/zed.nix
  ];

  # User Specific Pakcages
  home.packages = with pkgs; [
    lsof
    fnm # run nvm install ... from root of repo
    github-desktop
    bat
    asciiquarium
    cmatrix
    figlet
  ];

  home.username = vars.username;
  home.homeDirectory = "/home/${vars.username}";
  home.stateVersion = "26.05";

  xdg.enable = true;

  home.sessionVariables = {
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
  }
  // lib.optionalAttrs (vars.shellPrompt == "oh-my-posh") {
    ".config/oh-my-posh/oh-my-posh.omp.json".source =
      config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/NixOS/modules/core/oh-my-posh/oh-my-posh.omp.json";
  };
}
