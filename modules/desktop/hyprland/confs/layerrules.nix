{ ctx }:

let
  inherit (ctx)
    pkgs lib getExe getExe';
in
{
  layerrule = [
    # Rofi
    "blur on, match:namespace rofi"
    "ignore_alpha 0.7, match:namespace rofi"

    # Hyprpanel Menus
    "blur on, match:namespace ^bar-.*$"
    "blur on, match:namespace notifications-window"
    "blur on, match:namespace mediamenu"
    "blur on, match:namespace notificationsmenu"
    "blur on, match:namespace calendarmenu"
    "blur on, match:namespace audiomenu"
    "blur on, match:namespace networkmenu"
    "blur on, match:namespace energymenu"
    "blur on, match:namespace dashboardmenu"
    "ignore_alpha 0.7, match:namespace ^bar-.*$"
    "ignore_alpha 0.7, match:namespace notifications-window"
    "ignore_alpha 0.7, match:namespace mediamenu"
    "ignore_alpha 0.7, match:namespace notificationsmenu"
    "ignore_alpha 0.7, match:namespace calendarmenu"
    "ignore_alpha 0.7, match:namespace audiomenu"
    "ignore_alpha 0.7, match:namespace networkmenu"
    "ignore_alpha 0.7, match:namespace energymenu"
    "ignore_alpha 0.7, match:namespace dashboardmenu"

    # Swaync
    "blur on, match:namespace swaync-control-center"
    "blur on, match:namespace swaync-notification-window"
    "ignore_alpha 0.7, match:namespace swaync-control-center"
    "ignore_alpha 0.8, match:namespace swaync-notification-window"
    # "dim_around on, match:namespace swaync-control-center"
  ];
}
