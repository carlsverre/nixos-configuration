{ config, pkgs, ... }:

{
  environment.etc."opt/chrome/policies/managed/memcompute.json".text = builtins.toJSON {
    AuthServerWhitelist = "*.ops.memcompute.com";
    GSSAPILibraryName = "${pkgs.libheimdal}/lib/libgssapi.so";
    EnableCommonNameFallbackForLocalAnchors = true;
  };
}
