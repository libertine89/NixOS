{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    oh-my-posh
  ];

  programs.zsh.interactiveShellInit = ''
    eval "$(oh-my-posh init zsh --config /home/nixius/.config/oh-my-posh/default.omp.json)"
  '';

  programs.bash.interactiveShellInit = ''
    eval "$(oh-my-posh init bash --config /home/nixius/.config/oh-my-posh/default.omp.json)"
  '';
}
