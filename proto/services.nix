{ config, pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
    };
  };

  services = {
    openssh = {
      enable = true;
      permitRootLogin = "no";
      passwordAuthentication = false;
    };
  };
}
