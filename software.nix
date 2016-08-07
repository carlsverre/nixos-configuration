{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;

    chromium = {
      enablePepperFlash = true; # Chromium removed support for Mozilla (NPAPI) plugins so Adobe Flash no longer works
      enablePepperPDF = true;
      hiDPISupport = true;
    };
  };

  programs.zsh.enable = true;
  programs.light.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    rxvt_unicode-with-plugins
    dmenu
    i3blocks-gaps
    git
    htop
    atop
    xorg.xf86inputsynaptics
    wpa_supplicant_gui
    unzip
    acpi
    xclip
    compton
    chromium
  ];
}
