{ config, pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
    };
  };

  systemd.services = {
    nginx.serviceConfig.LimitNOFILE = 8192;
  };

  services = {
    openssh = {
      enable = true;
      permitRootLogin = "no";
      passwordAuthentication = false;
    };

    fail2ban = {
      enable = true;
    };

    nginx = {
      enable = true;
      package = pkgs.nginxMainline;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;

      appendConfig = ''
        worker_processes 2;
      '';

      eventsConfig = ''
        worker_connections 1024;
      '';

      virtualHosts = {
        "proto.sh" = {
          serverAliases = [ "proto.sh" "www.proto.sh" ];

          forceSSL = true;
          enableACME = true;

          locations."/" = {
            root = "/srv/proto.sh";
          };
        };
      };
    };
  };
}
