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
      inconsolata
      unifont
      ubuntu_font_family
      noto-fonts
      symbola
      font-awesome-ttf
    ];
  };

  time.timeZone = "America/Los_Angeles";
}
