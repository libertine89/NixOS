{ pkgs, ... }:

{
  programs = {
    cursor = {
      enable = true;
      package = pkgs.code-cursor;
      mutableExtensionsDir = true;
      argvSettings = { };

      profiles = {
        default = {
          enableUpdateCheck = true;
          extensions = with pkgs; [
            vscode-extensions.esbenp.prettier-vscode
          ];
          enableExtensionUpdateCheck = true;
          userSettings = import ./cursor-settings.nix;
          keybindings = import ./cursor-keybindings.nix;
          userTasks = {
            tasks = [ { } ];
          };
          enableMcpIntegration = true;
          userMcp = { };
        };
      };
    };
  };

  home.packages = with pkgs; [
    ## Dependencies
  ];
}
