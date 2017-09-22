{ config, pkgs, ... }:

{
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      powerline-fonts
      hack-font
      unifont
      ubuntu_font_family
      noto-fonts
      symbola
      font-awesome-ttf
      lato
      inconsolata
    ];
  };
}
