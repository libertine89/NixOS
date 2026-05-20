{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    oh-my-posh
  ];

  programs.zsh.interactiveShellInit = ''
  '';

  programs.bash.interactiveShellInit = ''
    eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/default.omp.json)"
  '';
}
