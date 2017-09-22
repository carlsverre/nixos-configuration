{ config, pkgs, ... }:

{
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  environment.variables."SSL_CERT_FILE" = "/etc/ssl/certs/ca-bundle.crt";
}
