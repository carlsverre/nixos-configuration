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
          globalRedirect = "www.proto.sh";
          enableACME = true;
          forceSSL = true;
        };

        "www.proto.sh" = {
          forceSSL = true;
          enableACME = true;

          locations."/" = {
            root = "/srv/www-proto-sh";
          };
        };

        "carlsverre.com" = {
          globalRedirect = "www.carlsverre.com";
          enableACME = true;
          forceSSL = true;
        };

        "www.carlsverre.com" = {
          forceSSL = true;
          enableACME = true;

          locations."/" = {
            root = "/srv/www-carlsverre-com";
          };
        };

        "resumesculptor.com" = {
          globalRedirect = "www.resumesculptor.com";
          enableACME = true;
          forceSSL = true;
        };

        "www.resumesculptor.com" = {
          forceSSL = true;
          enableACME = true;

          locations."/" = {
            root = "/srv/www-resumesculptor-com";
          };
        };
      };
    };
  };
}
