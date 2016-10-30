{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;

    google-chrome = {
      enablePepperFlash = true;
      enablePepperPDF = true;
    };
  };

  programs.zsh.enable = true;
  programs.light.enable = true;

  environment.systemPackages = with pkgs; [
    acpi
    atop
    compton
    git
    google-chrome
    htop
    i3blocks-gaps
    rxvt_unicode-with-plugins
    sysdig
    wget
    wpa_supplicant_gui
    xorg.xf86inputsynaptics
  ];
}
