{ host, pkgs, ... }:
pkgs.writeShellScriptBin "garbage-collection" ''
  # Colors for output
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  NC='\033[0m' # No Color
  PERIOD='30d'

  if [[ $EUID -eq 0 ]]; then
    echo "This script should not be executed as root! Exiting..."
    exit 1
  fi

  if [ -f "$HOME/NixOS/flake.nix" ]; then
    flake=$HOME/NixOS
  elif [ -f "/etc/nixos/flake.nix" ]; then
    flake=/etc/nixos
  else
    echo "Error: flake not found. ensure flake.nix exists in either $HOME/NixOS or /etc/nixos"
    exit 1
  fi

  echo -e "''${GREEN}Flake: $flake''${NC}"
  echo -e "''${GREEN}Host: ${host}''${NC}"

  echo -e "''${GREEN}Cleaning everything before the last: $PERIOD''${NC}"
  sudo nh clean all --keep-since 14d --keep 7
  # sudo nix-collect-garbage --delete-older-than "$PERIOD"

  echo
  read -rsn1 -p"$(echo -e "''${GREEN}Press any key to continue''${NC}")"
''
