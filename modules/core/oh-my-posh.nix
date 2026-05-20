{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    oh-my-posh
  ];

  programs.zsh.interactiveShellInit = ''
    eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/default.omp.json)"
  '';

  programs.bash.interactiveShellInit = ''
    eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/default.omp.json)"
  '';
}
