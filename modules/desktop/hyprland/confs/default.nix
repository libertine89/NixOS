{ lib, pkgs, inputs, getExe, getExe', bar, browser, terminal, fileManager, kbdLayout, kbdVariant, ... }:

{
  env = import ./enviroments.nix { inherit lib pkgs getExe getExe'; };

  animations = import ./animations.nix { inherit lib; };

  decoration = import ./decorations.nix { };

  keybindings = import ./keybindings.nix {
    inherit lib pkgs getExe getExe' browser terminal fileManager;
  };

  monitors = import ./monitors.nix { };

  windowrules = import ./windowrules.nix { };

  windows = import ./windows.nix { };

  workspaces = import ./workspaces.nix { };

  layouts = import ./layouts.nix { };
}
