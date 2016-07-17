{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  programs.light.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    rxvt_unicode-with-plugins
    chromium
    dmenu
    i3status
    git
    htop
    atop
    xorg.xf86inputsynaptics
    wpa_supplicant_gui
    unzip
  ];
}
