{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    starship
  ];

  home-manager.sharedModules = [
    (_: {
      programs.starship = {
        enable = true;

        # Shell integration
        enableZshIntegration = false;
        enableBashIntegration = false;
        enableFishIntegration = false;
      };
    })
  ];
}
