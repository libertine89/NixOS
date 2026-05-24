{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    oh-my-posh
  ];
  home-manager.sharedModules = [
    (_: {
      programs.oh-my-posh = {
      enable = true;

      # useTheme = "catppuccin";
      # configFile = ./oh-my-posh.omp.json;

      # Shell integration
      enableZshIntegration = false;
      enableBashIntegration = false;
      enableFishIntegration = false;
      };
    })
  ];
}
