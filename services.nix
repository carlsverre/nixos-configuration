{ config, pkgs, ... }:

{
  hardware.bluetooth.enable = false;

  networking = {
    enableIPv6 = false;
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
    wireless.enable = true;
  };

  services = {
    # Enable CUPS to print documents.
    printing.enable = false;

    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "caps:escape,altwin:swap_alt_win";

      displayManager = {
        slim = {
          enable = true;
          defaultUser = "carl";
        };

        xserverArgs = [ "-dpi 144" ];
      };

      windowManager = {
        i3.enable = true;
        default = "i3";
      };

      desktopManager.xterm.enable = false;

      synaptics = {
        enable = true;
      };
    };

    physlock = {
      enable = true;
    };
  };
}
