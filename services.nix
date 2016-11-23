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
    };
  };

  services = {
    # Enable CUPS to print documents.
    printing.enable = false;

    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "caps:escape,altwin:swap_alt_win";

      displayManager.slim = {
        enable = true;
        defaultUser = "carl";
        autoLogin = true;
      };

      windowManager = {
        i3-gaps.enable = true;
        default = "i3-gaps";
      };

      desktopManager = {
        xterm.enable = false;
        default = "none";
      };

      synaptics = {
        enable = true;
      };
    };

    physlock = {
      enable = true;
    };

    mopidy = {
      enable = true;
      extensionPackages = [ pkgs.mopidy-gmusic ];
      extraConfigFiles = [
        "/var/lib/mopidy/config.cnf"
      ];
    };
  };
}
