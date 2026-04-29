{ lib, pkgs, getExe, getExe', browser, terminal, fileManager, ... }:

{
  bind = [
    "$mainMod, Return, exec, $term"
    "$mainMod, B, exec, $browser"
    "$mainMod, C, exec, code"
  ];

  binde = [
    ",XF86AudioRaiseVolume,exec,${pkgs.pamixer}/bin/pamixer -i 2"
    ",XF86AudioLowerVolume,exec,${pkgs.pamixer}/bin/pamixer -d 2"
  ];

  bindm = [
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];
}
