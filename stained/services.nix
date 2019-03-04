{ config, pkgs, ... }:

{
  networking = {
    enableIPv6 = false;
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
    wireless.enable = true;
  };

  virtualisation = {
    docker = {
      enable = true;
      extraOptions = "--insecure-registry psy3.memcompute.com --bip 172.30.0.1/16";
      storageDriver = "overlay2";
      autoPrune = {
        enable = true;
      };
    };

    virtualbox = {
      host = {
        enable = true;
      };
    };
  };

  powerManagement = {
    enable = true;
  };

  services = {
    tlp.enable = true;

    kbfs = {
      enable = true;
      mountPoint = "/keybase";
      extraFlags = [
        "-label kbfs"
      ];
    };

    dnsmasq = {
      enable = true;
      resolveLocalQueries = true;
      servers = [
        "/docker/172.18.0.1"
        "/memsql-master/172.18.0.1"
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
