{ pkgs, ... }:

{
  programs = {
    zed-editor = {
      enable = true;
      extensions = [];
      themes = {
        # Each theme is written to
        # {file}$XDG_CONFIG_HOME/zed/themes/theme-name.json
        # where the name of each attribute is the theme-name
      };
      userSettings = import ./zed-settings.nix;
      userKeymaps = import ./zed-keymaps.nix;
    };
  };

  home.packages = with pkgs; [
    prettier
  ];
}
