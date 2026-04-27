{ pkgs, ... }:

  let 
  wrap-workspaces-next = pkgs.writeShellScriptBin "ws-next" ''
    MIN=1
    MAX=5

    current=$(${pkgs.hyprland}/bin/hyprctl activeworkspace -j | ${pkgs.jq}/bin/jq '.id')

    next=$((current+1))

    if [ "$next" -gt "$MAX" ]; then
      next=$MIN
    fi

    ${pkgs.hyprland}/bin/hyprctl dispatch workspace "$next"
    '';

in {
  home.packages = [
    wrap-workspaces-next
  ];
}
