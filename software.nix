{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    htop
    wget
    curl
  ];
}
