{ config, pkgs, ... }:

{
  environment.etc."opt/chrome/policies/managed/memcompute.json".text = builtins.toJSON {
    AuthServerWhitelist = "*.ops.memcompute.com";
    GSSAPILibraryName = "${pkgs.libheimdal}/lib/libgssapi.so";
    EnableCommonNameFallbackForLocalAnchors = true;
  };

  environment.etc."X11/xorg.conf.d/50-stained.conf".text = ''
    Section "InputClass"
      Identifier "Expert Wireless TB"
      MatchProduct "Expert Wireless TB"
      Driver "libinput"
      Option "AccelProfile" "adaptive"
      Option "AccelSpeed" "-0.5"
      Option "ScrollMethod" "button"
      Option "ScrollButton" "8"
      Option "ButtonMapping" "1 8 3 4 5 6 7 2 9"
    EndSection
  '';

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
