{ config, pkgs, ... }:

{ nix = {
    buildCores = 0;
    daemonIONiceLevel = 4;
    daemonNiceLevel = 10;
    maxJobs = 8;
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
