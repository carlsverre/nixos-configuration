{ config, pkgs, ... }:

{
  # Use the gummiboot efi boot loader.
  boot.loader.gummiboot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/sda";

  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/sda3";
      preLVM = true;
    }
  ];

  networking.hostName = "stained";

  hardware.trackpoint = {
    enable = true;
    emulateWheel = true;
    speed = 180;
    sensitivity = 200;
  };
}
