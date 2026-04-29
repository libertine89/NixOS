{ ctx }:

{
  env = import ./enviroments.nix { inherit ctx; };
  autostart = import ./autostart.nix { inherit ctx; };
  animations = import ./animations.nix { inherit ctx; };
  decoration = import ./decorations.nix { ctx };
  keybindings = import ./keybindings.nix { ctx; };
  monitors = import ./monitors.nix { ctx };
  windowrules = import ./windowrules.nix { ctx };
  windows = import ./windows.nix { ctx };
  workspaces = import ./workspaces.nix { ctx };
  layouts = import ./layouts.nix { ctx };
}
