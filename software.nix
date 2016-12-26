{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;

    google-chrome = {
      enablePepperFlash = true;
      enablePepperPDF = true;
    };

    firefox = {
      jre = true;
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
    firefox
    git
    google-chrome
    htop
    i3blocks-gaps
    libnotify
    powertop
    rxvt_unicode-with-plugins
    sysdig
    tlp
    wget
    wpa_supplicant_gui
    xorg.xf86inputsynaptics
  ];
}
