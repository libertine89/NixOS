{ ctx }:

let
inherit (ctx)
  kbdLayout kbdVariant;
in
{
  input = {
    kb_layout = "${kbdLayout},ru";
    kb_variant = "${kbdVariant},";
    repeat_delay = 275; # or 212
    repeat_rate = 35;
    numlock_by_default = true;

    follow_mouse = 1;

    touchpad.natural_scroll = false;

    tablet.output = "current";

    sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
    force_no_accel = true;
  };

  general = {
    gaps_in = 4;
    gaps_out = 9;
    border_size = 2;
    "col.active_border" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
    "col.inactive_border" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
    resize_on_border = true;
    #layout = "scrolling"; # dwindle, master, scrolling, monocle
    # allow_tearing = true; # Allow tearing for games (use immediate window rules for specific games or all titles)
  };
  
  scrolling = {
    explicit_column_widths = "0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0";              
  };
  
  plugin = {
    "scrolloverview" = {
      enable = true;
    };
  };

  group = {
    "col.border_active" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
    "col.border_inactive" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
    "col.border_locked_active" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
    "col.border_locked_inactive" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
  };

  render = {
    direct_scanout = 0; # 0 = off, 1 = on, 2 = auto (on with content type ‘game’)
  };

  ecosystem = {
    no_update_news = true;
    no_donation_nag = true;
  };

  misc = {
    disable_hyprland_logo = true;
    mouse_move_focuses_monitor = true;
    swallow_regex = "^(Alacritty|kitty)$";
    enable_swallow = true;
    vrr = 2; # enable variable refresh rate (0=off, 1=on, 2=fullscreen only, 3 = fullscreen games/media)
  };

  xwayland = {
    force_zero_scaling = false;
  };

  gesture = [
    "3, horizontal, workspace"
  ];

  dwindle = {
    preserve_split = true;
  };

  master = {
    new_status = "master";
    new_on_top = true;
    mfact = 0.5;
  };
}
