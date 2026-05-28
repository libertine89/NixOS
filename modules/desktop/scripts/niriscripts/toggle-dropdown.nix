{ pkgs }:

  pkgs.writeShellScriptBin "toggle-dropdown.nix"
  ''
#!/usr/bin/env bash

APP_ID="dropdown"
CMD="$*"  # Collect all arguments as the command

# Get window info
WINDOWS="$(niri msg windows)"

# Find window ID
WIN_ID=$(echo "$WINDOWS" | awk '
  /Window ID/ { id=$3; sub(":", "", id) }
  /App ID: "dropdown"/ { print id }
')

# Is it focused?
FOCUSED=$(echo "$WINDOWS" | awk '
  /Window ID/ { id=$3; sub(":", "", id) }
  /\(focused\)/ { focused=id }
  END { print focused }
')

if [ -z "$WIN_ID" ]; then
    # Launch dropdown terminal
    if [ -z "$CMD" ]; then
        kitty --class dropdown &
    else
        kitty --class dropdown -e bash -c "$CMD" &
    fi
elif [ "$WIN_ID" = "$FOCUSED" ]; then
    # Hide it (close window)
    niri msg action close-window
else
    # Focus existing dropdown
    niri msg action focus-window --id "$WIN_ID"
fi
''
# # Open blank dropdown terminal
# ./toggle-dropdown.nix
#
# # Open dropdown terminal and run 'htop'
# ./toggle-dropdown.nix htop
#
# # Run multiple commands
# ./toggle-dropdown.nix "echo hello; sleep 5"
