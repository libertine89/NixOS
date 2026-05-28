{ lib, ... }:

let
  mkKittySession = name: content: {
    name = ".config/kitty/sessions/${name}.session";
    value.text = content;
  };
in
{
  home.file = builtins.listToAttrs [
    (mkKittySession "dev" ''
      new_tab dev
      launch --cwd $HOME/NixOS yazi
      launch --location=vsplit --cwd $HOME/NixOS/modules/ yazi
      launch --location=hsplit --cwd $HOME/NixOS/hosts/ yazi
    '')

    (mkKittySession "nvim" ''
    new_tab nvim
    launch --cwd $HOME/NixOS/ nvim
    '')

    (mkKittySession "niri" ''
    new_tab notes
    launch --cwd $HOME/NixOS/modules/desktop/niri/
    '')
  ];
}
