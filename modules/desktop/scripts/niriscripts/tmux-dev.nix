
{ pkgs, ... }:
pkgs.writeShellScriptBin "tmux-dev" ''
#!/usr/bin/env bash

dirs=($HOME/NixOS $HOME/NixOS/modules $HOME/NixOS/modules/desktop)
names=(graph-server graph graph-sdk)

start_nvim_session() {
    tmux new-session -d -s nvim-session -c "''${dirs[0]}" -n "''${names[0]}"
    tmux send-keys -t nvim-session:0 'nvim' Enter

    tmux new-window -t nvim-session -c "''${dirs[1]}" -n "''${names[1]}"
    tmux send-keys -t nvim-session:1 'nvim' Enter

    tmux new-window -t nvim-session -c "''${dirs[2]}" -n "''${names[2]}"
    tmux send-keys -t nvim-session:2 'nvim' Enter

    tmux attach -t nvim-session
}

start_term_session() {
    tmux new-session -d -s term-session -c "''${dirs[0]}" -n "''${names[0]}"
    tmux new-window -t term-session -c "''${dirs[1]}" -n "''${names[1]}"
    tmux new-window -t term-session -c "''${dirs[2]}" -n "''${names[2]}"

    tmux attach -t term-session
}

# Launch NVim session in Kitty with font size 9
kitty --override font_size=9 bash -c "$(declare -f start_nvim_session); start_nvim_session" &

# Launch terminal session in Kitty default font
kitty bash -c "$(declare -f start_term_session); start_term_session" &
''
