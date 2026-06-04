{ config, pkgs, ... }:

{
  # Enable Snapper
  services.snapper = {
    enable = true;

    # Root snapshots
    configs = {
      root = {
        subvolume = "/";
        extraConfig = ''
          ALLOW_USERS="root"
          SYNC_ACL="yes"

          # Snapshot limits
          NUMBER_CLEANUP="yes"
          NUMBER_LIMIT="10"
          NUMBER_LIMIT_IMPORTANT="5"

          TIMELINE_CREATE="yes"
          TIMELINE_CLEANUP="yes"
          TIMELINE_MIN_AGE="1800"
          TIMELINE_LIMIT_HOURLY="10"
          TIMELINE_LIMIT_DAILY="7"
          TIMELINE_LIMIT_WEEKLY="4"
          TIMELINE_LIMIT_MONTHLY="3"
        '';
      };

      # Home snapshots only if /home is Btrfs subvolume
      home = {
        subvolume = "/home";
        extraConfig = ''
          ALLOW_USERS="root"
          SYNC_ACL="yes"

          NUMBER_CLEANUP="yes"
          NUMBER_LIMIT="20"
          NUMBER_LIMIT_IMPORTANT="10"

          TIMELINE_CREATE="yes"
          TIMELINE_CLEANUP="yes"
          TIMELINE_MIN_AGE="1800"
          TIMELINE_LIMIT_HOURLY="10"
          TIMELINE_LIMIT_DAILY="7"
          TIMELINE_LIMIT_WEEKLY="4"
          TIMELINE_LIMIT_MONTHLY="6"
        '';
      };
    };
  };

  # Required tools
  environment.systemPackages = with pkgs; [
    snapper
    snap-pac
  ];

  # Optional but strongly recommended for Btrfs workflows
  services.btrfs.autoScrub = {
    enable = true;
    fileSystems = [ "/" ];
  };
}
