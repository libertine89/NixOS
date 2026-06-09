
{ pkgs, ... }:
pkgs.writeShellScriptBin "tmux-dev" ''
  #!/usr/bin/env bash

  # Graph Server Session
  tmux new-session -d -s graph-server -c ~/NixOS
  tmux rename-window -t graph-server:1 nvim
  tmux send-keys -t graph-server:nvim 'nvim' C-m
  tmux new-window -t graph-server -n terminal -c ~/NixOS

  # Graph Session
  tmux new-session -d -s graph -c ~/NixOS/modules
  tmux rename-window -t graph:1 nvim
  tmux send-keys -t graph:nvim 'nvim' C-m
  tmux new-window -t graph -n terminal -c ~/NixOS/modules

  # Graph SDK Session
  tmux new-session -d -s graph-sdk -c ~/NixOS/modules/desktop
  tmux rename-window -t graph-sdk:1 nvim
  tmux send-keys -t graph-sdk:nvim 'nvim' C-m
  tmux new-window -t graph-sdk -n terminal -c ~/NixOS/modules/desktop

  # Attach to first session
  tmux attach -t graph-server
''
