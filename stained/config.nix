{ config, pkgs, ... }:

{
  environment.etc."opt/chrome/policies/managed/memcompute.json".text = builtins.toJSON {
    AuthServerWhitelist = "*.ops.memcompute.com,*.cloud.memcompute.com";
  };
}
