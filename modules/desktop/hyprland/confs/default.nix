{ ctx }:

let
{
  env = import ./environments.nix { inherit ctx; };
  autostart = import ./autostart.nix { inherit ctx; };
  animations = import ./animations.nix { inherit ctx; };
  decorations = import ./decorations.nix { inherit ctx; };
  keybindings = import ./keybindings.nix { inherit ctx; };
  monitors = import ./monitors.nix { inherit ctx; };
  windowrules = import ./windowrules.nix { inherit ctx; };
  general = import ./general.nix { inherit ctx; };
  workspaces = import ./workspaces.nix { inherit ctx; };
  layerrules = import ./layerrules.nix { inherit ctx; };
}
in
{
 settings = {
    # base/global config still here
    "$mainMod" = "SUPER";
    "$term" = "${getExe pkgs.${terminal}}";
    "$editor" = "code --disable-gpu";
    "$browser" = browser;
  }
  // conf.env
  // conf.autostart 
  // conf.animations
  // conf.decorations
  // conf.keybindings
  // conf.monitors
  // conf.workspaces
  // conf.windowrules
  // conf.general
  // conf.layerrules;
}
