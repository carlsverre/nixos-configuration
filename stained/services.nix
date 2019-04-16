{ config, pkgs, ... }:

{
  networking = {
    enableIPv6 = false;
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
    wireless.enable = true;
  };


  environment.etc."docker/daemon.json".text = ''
    {
      "bip": "172.17.0.1/16"
    }
  '';

  virtualisation = {
    docker = {
      enable = true;
      extraOptions = "--insecure-registry psy3.memcompute.com";
      storageDriver = "overlay2";
      autoPrune = {
        enable = true;
      };
    };
  };

  services = {
    tlp = {
      enable = true;
      extraConfig = "
        CPU_SCALING_GOVERNOR_ON_AC=performance
        CPU_SCALING_GOVERNOR_ON_BAT=powersave
      ";
    };

    kbfs = {
      enable = true;
      mountPoint = "/keybase";
      extraFlags = [
        "-label kbfs"
      ];
    };

    udev = {
      extraRules = ''
        # Ultimate Hacking Keyboard
        SUBSYSTEM=="input", GROUP="input", MODE="0666"
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="1d50", ATTRS{idProduct}=="612[0-7]", MODE:="0666", GROUP="plugdev"
        KERNEL=="hidraw*", ATTRS{idVendor}=="1d50", ATTRS{idProduct}=="612[0-7]", MODE="0666", GROUP="plugdev"
      '';
    };

    dnsmasq = {
      enable = true;
      resolveLocalQueries = true;
      servers = [
        "/ops.memcompute.com/172.16.0.5"
        "/ops.memcompute.com/172.16.1.5"
        "/ops.memcompute.com/172.16.2.5"
        "8.8.8.8"
        "8.8.4.4"
      ];
      extraConfig = ''
        interface=lo
        bind-interfaces
        cache-size=1000
        no-negcache
      '';
    };

    # Enable CUPS to print documents.
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
    };

    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "caps:escape,altwin:swap_alt_win";
      useGlamor = true;
      videoDrivers = [ "intel" ];

      displayManager.slim = {
        enable = true;
        defaultUser = "carl";
        autoLogin = true;
      };

      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
        };
        default = "i3";
      };

      desktopManager = {
        xterm.enable = false;
        default = "none";
      };

      libinput = {
        enable = true;
        tapping = false;
        disableWhileTyping = true;
      };
    };

    physlock = {
      enable = true;
    };
  };
}
