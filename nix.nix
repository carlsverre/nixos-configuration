{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix = {
    nixPath = [ "/etc/nixos" "nixos-config=/etc/nixos/configuration.nix" ];

    buildCores = 0;
    daemonIONiceLevel = 4;
    daemonNiceLevel = 10;
    maxJobs = 8;
    useSandbox = true;
    extraOptions = ''
      auto-optimise-store = true
      gc-keep-outputs = true
    '';

    gc = {
      automatic = true;
    };
  };

  system.stateVersion = "16.09";
}
