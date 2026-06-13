{ pkgs, ... }:

{
  programs.zed-editor.enable = true;

  environment.systemPackages = with pkgs; [
    prettier
  ];
}
