{ ctx }:

{
  env = import ./enviroments.nix { inherit ctx; };
  autostart = import ./autostart.nix { inherit ctx; };
  animations = import ./animations.nix { inherit ctx; };
  decoration = import ./decorations.nix { inherit ctx; };
  keybindings = import ./keybindings.nix { inherit ctx; };
  monitors = import ./monitors.nix { inherit ctx; };
  windowrules = import ./windowrules.nix { inherit ctx; };
  windows = import ./windows.nix { inherit ctx; };
  workspaces = import ./workspaces.nix { inherit ctx; };
  layers = import ./layers.nix { inherit ctx; };
}
