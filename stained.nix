{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/sda";

  # Note: in addition to disabling the audit service, nixos also requires
  # disabling audit at boot time if you want to remove all syscall overhead
  security.audit.enable = false;
  boot.kernelParams = [ "audit=0" ];

  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/sda3";
      preLVM = true;
    }
  ];

  networking.hostName = "stained";

  networking.firewall = {
    # chromecast support
    extraCommands = "iptables -I INPUT -p udp -m udp --dport 32768:61000 -j ACCEPT";
  };

  hardware = {
    trackpoint = {
      enable = true;
      emulateWheel = true;
      speed = 180;
      sensitivity = 200;
    };

    opengl = {
      driSupport32Bit = true;
      s3tcSupport = true;
    };

    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
  };
}
