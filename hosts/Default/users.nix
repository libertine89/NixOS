{ pkgs, ... }:

let
    inherit (import ./variables.nix)
    username shell;
in
{
  home-manager.users.${username}.imports = [
    ../../users/nixius.nix
  ];

  # # Example
  # home-manager.users.alice.imports = [
  #   ../../users/alice.nix
  # ];
  users = {
    mutableUsers = true;
    users.${username} = {
      isNormalUser = true;
      initialPassword = "123";
      extraGroups = [
        "wheel" # sudo access
        "input"
        "networkmanager"
        "video"
        "audio"
        "libvirtd"
        "kvm"
        "docker"
        "disk"
        "adbusers"
        "lp"
        "scanner"
        "vboxusers" # Virtual Box
      ];
      shell = pkgs.${shell};
      ignoreShellProgramCheck = true;
    };
  };
  nix.settings.allowed-users = [ "${username}" ];
}
