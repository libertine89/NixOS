{ ... }:

let
    inherit (import ./variables.nix)
    username;
in
{
  home-manager.users.${username}.imports = [
    ../../users/nixius.nix
  ];

  # # Example
  # home-manager.users.alice.imports = [
  #   ../../users/alice.nix
  # ];
}
