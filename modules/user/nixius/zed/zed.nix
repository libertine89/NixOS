{ pkgs, ... }:

{
  programs = {
    zed-editor = {
      enable = true;
      extensions = [
        # Themes & icons
        "catppuccin"
        "catppuccin-icons"
        # LSP
        "basher"
        "nix"
        "lua"
        "ts-snippets"
      ];
      themes = {
        # Each theme is written to
        # {file}$XDG_CONFIG_HOME/zed/themes/theme-name.json
        # where the name of each attribute is the theme-name
      };
      mutableUserSettings = true;
      mutableUserKeymaps = true; # set to false when finished editing.
      userSettings = import ./zed-settings.nix;
      userKeymaps = import ./zed-keymaps.nix;
    };
  };

  home.packages = with pkgs; [
    # Formatters
    prettier # JS & TS
    shfmt # Shell script formatting
    alejandra # Nix formatting

    # LSPs
    nil # Nix language server
    nixd # Nix Flake language server
    lua-language-server
    bash-language-server

    # Linting
    shellcheck # Shell script linting
    statix # Nix linter
  ];
}
