{ config, pkgs, ... }:

let
    chromium = pkgs.chromium.override {
      enablePepperFlash = true;
      pulseSupport = true;
      hiDPISupport = true;
    };
in
  {
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
