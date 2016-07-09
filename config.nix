{ config, pkgs, ... }:

{
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      powerline-fonts
      unifont
      ubuntu_font_family
      noto-fonts
      symbola
      font-awesome-ttf
    ];
  };

  time.timeZone = "America/Los_Angeles";

  environment.variables."SSL_CERT_FILE" = "/etc/ssl/certs/ca-bundle.crt";
}
