{pkgs, ...}:

  let
  wrap-workspaces-prev = pkgs.writeShellScriptBin "ws-prev" ''
    MIN=1
    MAX=5

    current=$(${pkgs.hyprland}/bin/hyprctl activeworkspace -j | ${pkgs.jq}/bin/jq '.id')

    next=$((current-1))

    if [ "$next" -lt "$MIN" ]; then
      next=$MAX
    fi

    ${pkgs.hyprland}/bin/hyprctl dispatch workspace "$next"
    '';

in {
  home.packages = [
    wrap-workspaces-prev
  ];
}
