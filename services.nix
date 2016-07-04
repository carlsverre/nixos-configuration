{ config, pkgs, ... }:

{
  hardware.bluetooth.enable = true;

  networking = {
    enableIPv6 = false;
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
    wireless.enable = true;
  };

  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "caps:escape";

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
