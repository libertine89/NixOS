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
      launch --cwd $HOME/NixOS
      launch --location=vsplit --cwd $HOME/NixOS/modules/
      launch --location=hsplit --cwd $HOME/NixOS/hosts/
    '')

    (mkKittySession "niri" ''
    new_tab notes
    launch --cwd $HOME/NixOS/modules/desktop/niri/
    '')
  ];
}
