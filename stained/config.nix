{ config, pkgs, ... }:

{
  environment.etc."opt/chrome/policies/managed/memcompute.json".text = builtins.toJSON {
    AuthServerWhitelist = "*.ops.memcompute.com";
    GSSAPILibraryName = "${pkgs.libheimdal}/lib/libgssapi.so";
    EnableCommonNameFallbackForLocalAnchors = true;
  };

  krb5 = {
    enable = true;
    kerberos = pkgs.heimdalFull;

    libdefaults = {
      default_realm = "OPS.MEMCOMPUTE.COM";
      dns_lookup_realm = true;
      dns_lookup_kdc = true;
      rdns = false;
      ticket_lifetime = "24h";
      forwardable = "yes";
      udp_preference_limit = 0;
    };

    domain_realm = {
      "ops.memcompute.com" = "OPS.MEMCOMPUTE.COM";
      ".ops.memcompute.com" = "OPS.MEMCOMPUTE.COM";
    };
  };
}
