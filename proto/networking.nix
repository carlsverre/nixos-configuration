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

      allowedTCPPorts = [ 80 443 ];
    };

    extraHosts = "127.0.0.1 ${hostName}";
  };
}
