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
            root = "/srv/sh/proto/www";
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
            root = "/srv/com/carlsverre/www";
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
            root = "/srv/com/resumesculptor/www";
          };
        };

        "www.c83.me" = {
          globalRedirect = "c83.me";
          enableACME = true;
          forceSSL = true;
        };

        "c83.me" = {
          forceSSL = true;
          enableACME = true;

          locations."/" = {
            root = "/srv/me/c83/@";
          };
        };

        "www.memory.sh" = {
          globalRedirect = "memory.sh";
          enableACME = true;
          forceSSL = true;
        };

        "memory.sh" = {
          forceSSL = true;
          enableACME = true;

          locations."/" = {
            root = "/srv/sh/memory/@";
          };
        };
      };
    };
  };
}
