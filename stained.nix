{ config, pkgs, ... }:

{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.grub.device = "/dev/sda";

    # Note: in addition to disabling the audit service, nixos also requires
    # disabling audit at boot time if you want to remove all syscall overhead
    kernelParams = [ "audit=0" ];

    extraModulePackages = with pkgs.linuxPackages; [
      sysdig
      acpi_call
    ];

    initrd.luks.devices = [
      {
        name = "root";
        device = "/dev/sda3";
        preLVM = true;
      }
    ];
  };

  security.audit.enable = false;

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
      s3tcSupport = true;
    };

    pulseaudio = {
      enable = true;
      support32Bit = true;
    };

    bluetooth.enable = false;
  };

  services = {
    tlp.enable = true;

    xserver = {
      useGlamor = true;
      videoDrivers = [ "intel" ];
    };
  };
}
