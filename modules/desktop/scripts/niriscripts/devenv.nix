{
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) getExe';
  inherit ( import ../../hosts/Default/variables.nix)
  terminal;
in
pkgs.writeShellScriptBin "devenv" ''
#!/usr/bin/env bash

launch_pane() {
    location="$1"
    dir="$2"
    cmd="$3"

    # default dir
    if [ -z "$dir" ] || [ "$dir" = " " ]; then
        dir="$PWD"
    fi

    case "$dir" in
        "~"*) dir="$HOME/''${dir#\~}" ;;
    esac

    if [ -z "$cmd" ] || [ "$cmd" = " " ]; then
        ${terminal} --class kitty-dev @ launch \
            $location \
            --cwd="$dir"
    else
        ${terminal} --class kitty-dev @ launch \
            $location \
            --cwd="$dir" \
            bash -c "$cmd; exec bash"
    fi
}

# pane 1
launch_pane "--type=os-window" "$1" "$2"

sleep 0.2

# pane 2
launch_pane "--location=vsplit" "$3" "$4"

# pane 3
launch_pane "--location=hsplit" "$5" "$6"

# final nvim window
${terminal} --class kitty-dev --override font_size=10 --title nvim \
    bash -c "cd /home/nixius/NixOS && exec nvim"
''

