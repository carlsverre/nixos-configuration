{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix = {
    buildCores = 0;
    daemonIONiceLevel = 4;
    daemonNiceLevel = 10;
    useSandbox = true;
    extraOptions = ''
      auto-optimise-store = true
      gc-keep-outputs = true
    '';

    gc = {
      automatic = true;
    };
  };

  system.stateVersion = "18.03";
}
