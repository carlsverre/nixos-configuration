{ config, pkgs, ... }:

{
  programs.light.enable = true;

  environment.systemPackages = with pkgs; [
    acpi
    atop
    compton
    dunst
    exfat
    i3blocks-gaps
    libnotify
    powertop
    sysdig
    tlp
    wpa_supplicant_gui
    xorg.xf86inputsynaptics
    rxvt_unicode-with-plugins
    blueman
  ];
}
