{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    oh-my-posh
  ];

  programs.zsh.interactiveShellInit = ''
    eval "$(oh-my-posh init zsh)"
  '';

  programs.bash.interactiveShellInit = ''
    eval "$(oh-my-posh init bash)"
  '';
}
