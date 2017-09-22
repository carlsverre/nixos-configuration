{ config, pkgs, ... }:

{
  networking = rec {
    hostName = "proto";
    usePredictableInterfaceNames = false;

    firewall = {
      # docker support
      extraCommands = "
        iptables -I INPUT -i docker0 -j ACCEPT;
      ";

      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };

    extraHosts = "127.0.0.1 ${hostName}";
  };
}
