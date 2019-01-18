{ config, pkgs, ... }:

let
  redirect = (target: {
    globalRedirect = target;
    enableACME = true;
    forceSSL = true;
  });

  vhost = (rootDir: {
    forceSSL = true;
    enableACME = true;

    locations."/robots.txt" = {
      extraConfig = ''
        add_header Content-Type text/plain;
        return 200 "User-agent: *\nDisallow:\n";
      '';
    };

    locations."/" = {
      root = rootDir;
    };
  });
in
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
        "proto.sh" = (redirect "www.proto.sh");
        "www.proto.sh" = (vhost "/srv/sh/proto/www");

        "carlsverre.com" = (redirect "www.carlsverre.com");
        "www.carlsverre.com" = (vhost "/srv/com/carlsverre/www");

        "resumesculptor.com" = (redirect "www.resumesculptor.com");
        "www.resumesculptor.com" = (vhost "/srv/com/resumesculptor/www");

        # c83.me is primary
        "www.c83.me" = (redirect "c83.me");
        "c83.me" = (vhost "/srv/me/c83/@");

        # memory.sh is primary
        "www.memory.sh" = (redirect "memory.sh");
        "memory.sh" = (vhost "/srv/sh/memory/@");
      };
    };
  };
}
