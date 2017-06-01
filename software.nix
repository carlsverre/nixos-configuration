{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    firefox = {
      enableAdobeFlash = true;
      enableGoogleTalkPlugin = true;
    };
  };

  programs.zsh.enable = true;
  programs.light.enable = true;

  environment.systemPackages = with pkgs; [
    acpi
    atop
    compton
    dunst
    exfat
    git
    htop
    i3blocks-gaps
    libnotify
    powertop
    rxvt_unicode-with-plugins
    sysdig
    tlp
    wget
    curl
    wpa_supplicant_gui
    xorg.xf86inputsynaptics
  ];
}
