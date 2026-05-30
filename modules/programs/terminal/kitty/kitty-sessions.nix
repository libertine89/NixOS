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
      launch --cwd $HOME/Git/algo/graph-server/
      launch --location=vsplit --cwd $HOME/Git/algo/graph/
      launch --location=hsplit --cwd $HOME/Git/algo/graph-sdk/
    '')

    (mkKittySession "algo" ''
    new_tab nvim
    launch --cwd $HOME/Git/algo nvim
    '')

    (mkKittySession "dots" ''
    new_tab nvim
    launch --cwd $HOME/NixOS/ nvim
    '')

    (mkKittySession "niri" ''
    new_tab notes
    launch --cwd $HOME/NixOS/modules/desktop/niri/
    '')
  ];
}
