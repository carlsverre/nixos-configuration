{ config, pkgs, ... }:

{
  boot = {
    # Note: in addition to disabling the audit service, nixos also requires
    # disabling audit at boot time if you want to remove all syscall overhead
    kernelParams = [ "audit=0" ];
  };

  security.audit.enable = false;

  nix.maxJobs = 8;
}
