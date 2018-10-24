{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
  };

  environment.systemPackages = with pkgs; [
    nix-zsh-completions
    zsh
    git
    htop
    wget
    curl
  ];
}
