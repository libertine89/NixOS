{ pkgs, ... }:

{
  programs = {
    cursor = {
      enable = true;
      mutableExtensionsDir = true;
      argvSettings = {};

      profiles = {
        default = {
          extensions = [
            "prettier"
          ];
          userSettings = import ./cursor-settings.nix;
          keybindings = import ./cursor-keybindings.nix;
          userTasks = {
            tasks = [{}];
          };
          enableMcpIntergration = true;
          userMcp = {};
        };
      }
    };
  };

  home.packages = with pkgs; [
    ## Dependencies
  ];
}
